<#
.SYNOPSIS
    Cherche des offres d'emploi avec l'API officielle France Travail (Offres d'emploi v2).

.DESCRIPTION
    Fonctionnement en 2 temps (OAuth2 « client credentials ») :
      1. On échange FRANCE_TRAVAIL_CLIENT_ID + FRANCE_TRAVAIL_CLIENT_SECRET (lus dans .env)
         contre un jeton d'accès temporaire (valable environ 25 minutes).
      2. On appelle la recherche d'offres avec ce jeton dans l'en-tête Authorization.
    Par défaut : autour de Villepreux (code INSEE 78674), dans un rayon de 15 km,
    offres publiées depuis 7 jours, les plus récentes d'abord.

.EXAMPLE
    .\chercher-offres.ps1 -MotsCles "assistant administratif"
.EXAMPLE
    # Sortie JSON, pour que Claude la lise dans /emploi
    .\chercher-offres.ps1 -MotsCles "assistant ADV" -Distance 20 -Json
#>
param(
    [Parameter(Mandatory)][string]$MotsCles,
    # Code INSEE de la commune de référence (78674 = Villepreux)
    [string]$Commune = '78674',
    # Rayon en km autour de la commune
    [int]$Distance = 15,
    # Publiées depuis : 1, 3, 7, 14 ou 31 jours
    [ValidateSet(1, 3, 7, 14, 31)][int]$PublieeDepuis = 7,
    # Nombre maximum d'offres (150 au maximum par appel)
    [ValidateRange(1, 150)][int]$Max = 50,
    [switch]$Json
)

$ErrorActionPreference = 'Stop'

# --- 1. Identifiants dans .env (jamais affichés)
$racine = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
$vars = @{}
Get-Content (Join-Path $racine '.env') -Encoding UTF8 | ForEach-Object {
    if ($_ -match '^\s*([A-Z0-9_]+)\s*=\s*(.*)$') { $vars[$Matches[1]] = $Matches[2].Trim().Trim('"').Trim("'") }
}
$clientId = $vars['FRANCE_TRAVAIL_CLIENT_ID']
$clientSecret = $vars['FRANCE_TRAVAIL_CLIENT_SECRET']
if (-not $clientId -or -not $clientSecret) {
    throw "FRANCE_TRAVAIL_CLIENT_ID ou FRANCE_TRAVAIL_CLIENT_SECRET est vide dans .env"
}

# --- 2. Jeton d'accès
$reponseJeton = Invoke-RestMethod -Method Post `
    -Uri 'https://entreprise.francetravail.fr/connexion/oauth2/access_token?realm=%2Fpartenaire' `
    -ContentType 'application/x-www-form-urlencoded' `
    -Body @{
        grant_type    = 'client_credentials'
        client_id     = $clientId
        client_secret = $clientSecret
        scope         = 'api_offresdemploiv2 o2dsoffre'
    }

# --- 3. Recherche des offres
$parametres = @{
    motsCles      = $MotsCles
    commune       = $Commune
    distance      = $Distance
    publieeDepuis = $PublieeDepuis
    sort          = 1                 # 1 = les plus récentes d'abord
    range         = "0-$($Max - 1)"
}
$requete = ($parametres.GetEnumerator() | ForEach-Object { "$($_.Key)=$([uri]::EscapeDataString([string]$_.Value))" }) -join '&'

# L'API répond 200 (tout tient dans la page), 206 (résultats partiels) ou 204 (aucune offre)
$reponse = Invoke-WebRequest -Uri "https://api.francetravail.io/partenaire/offresdemploi/v2/offres/search?$requete" `
    -Headers @{ Authorization = "Bearer $($reponseJeton.access_token)"; Accept = 'application/json' }

if ($reponse.StatusCode -eq 204 -or -not $reponse.Content) {
    if ($Json) { '[]' } else { "Aucune offre pour « $MotsCles » à $Distance km, publiée depuis $PublieeDepuis jours." }
    return
}

# --- 4. On ne garde que l'utile
$offres = ($reponse.Content | ConvertFrom-Json).resultats | ForEach-Object {
    [pscustomobject]@{
        id          = $_.id
        intitule    = $_.intitule
        entreprise  = $_.entreprise.nom
        lieu        = $_.lieuTravail.libelle
        contrat     = $_.typeContratLibelle
        duree       = $_.dureeTravailLibelle
        salaire     = $_.salaire.libelle
        publiee     = ([datetime]$_.dateCreation).ToString('yyyy-MM-dd')
        experience  = $_.experienceLibelle
        courriel    = $_.contact.courriel
        lien        = if ($_.origineOffre.urlOrigine) { $_.origineOffre.urlOrigine } else { "https://candidat.francetravail.fr/offres/recherche/detail/$($_.id)" }
        description = $_.description
    }
}

if ($Json) {
    $offres | ConvertTo-Json -Depth 3
}
else {
    "$(@($offres).Count) offre(s) pour « $MotsCles » à $Distance km de la commune $Commune, publiées depuis $PublieeDepuis jours :"
    $offres | Format-Table publiee, intitule, entreprise, lieu, contrat -AutoSize -Wrap
}
