<#
.SYNOPSIS
    Envoie un mail de candidature depuis Gmail (SMTP), avec le CV et la lettre en pièces jointes.

.DESCRIPTION
    Utilisé par la commande /emploi, uniquement après la validation de Nicolas.
    Lit GMAIL_ADRESSE et GMAIL_MOT_DE_PASSE_APPLI dans le .env à la racine du workspace
    (mot de passe d'application Google, pas le mot de passe du compte).
    Le corps du mail est lu dans un fichier texte UTF-8.
    Le mail envoyé apparaît dans le dossier « Messages envoyés » de Gmail.

.EXAMPLE
    # Vérifier sans rien envoyer
    .\envoyer-candidature.ps1 -A rh@exemple.fr -Objet "Candidature assistant administratif" `
        -CorpsFichier ..\..\taff\2026-10-13_candidature-x\mail.txt `
        -PiecesJointes ..\..\taff\2026-10-13_candidature-x\cv-nicolas-bideau_x.pdf, ..\..\taff\2026-10-13_candidature-x\lettre-motivation_x.pdf `
        -Test
#>
param(
    [Parameter(Mandatory)][string]$A,
    [Parameter(Mandatory)][string]$Objet,
    [Parameter(Mandatory)][string]$CorpsFichier,
    [string[]]$PiecesJointes = @(),
    # N'envoie rien : affiche seulement ce qui partirait
    [switch]$Test
)

$ErrorActionPreference = 'Stop'

# --- Lecture des identifiants dans .env (jamais affichés)
$racine = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
$fichierEnv = Join-Path $racine '.env'
if (-not (Test-Path $fichierEnv)) { throw ".env introuvable : $fichierEnv" }

$vars = @{}
Get-Content $fichierEnv -Encoding UTF8 | ForEach-Object {
    if ($_ -match '^\s*([A-Z0-9_]+)\s*=\s*(.*)$') { $vars[$Matches[1]] = $Matches[2].Trim().Trim('"').Trim("'") }
}
$expediteur = $vars['GMAIL_ADRESSE']
# Google affiche le mot de passe en 4 blocs séparés par des espaces : on les retire
$motDePasse = $vars['GMAIL_MOT_DE_PASSE_APPLI'] -replace '\s', ''
if (-not $expediteur -or -not $motDePasse) {
    throw "GMAIL_ADRESSE ou GMAIL_MOT_DE_PASSE_APPLI est vide dans .env"
}

# --- Vérifications avant envoi
foreach ($f in @($CorpsFichier) + $PiecesJointes) {
    if (-not (Test-Path $f)) { throw "Fichier introuvable : $f" }
}
$corps = Get-Content $CorpsFichier -Raw -Encoding UTF8
if ($corps -match '\[[^\]]+\]') { throw "Le mail contient encore un repère à compléter entre crochets : $($Matches[0])" }

$taille = ($PiecesJointes | ForEach-Object { (Get-Item $_).Length } | Measure-Object -Sum).Sum
if ($taille -gt 20MB) { throw "Pièces jointes trop lourdes : $([math]::Round($taille / 1MB, 1)) Mo (20 Mo maximum)" }

# Noms lisibles pour le recruteur, quel que soit le nom du fichier sur le disque
function Get-NomPieceJointe([string]$chemin) {
    $nom = Split-Path $chemin -Leaf
    if ($nom -like 'cv*') { return 'CV - Nicolas Bideau.pdf' }
    if ($nom -like 'lettre*') { return 'Lettre de motivation - Nicolas Bideau.pdf' }
    return $nom
}

if ($Test) {
    "TEST, rien n'est envoyé"
    "De      : Nicolas Bideau <$expediteur>"
    "À       : $A"
    "Objet   : $Objet"
    "PJ      : " + (($PiecesJointes | ForEach-Object { Get-NomPieceJointe $_ }) -join ', ') + " ($([math]::Round($taille / 1KB)) Ko)"
    "---"
    $corps
    return
}

# --- Envoi
$message = New-Object System.Net.Mail.MailMessage
$message.From = New-Object System.Net.Mail.MailAddress($expediteur, 'Nicolas Bideau')
$message.To.Add($A)
$message.Subject = $Objet
$message.Body = $corps
$message.SubjectEncoding = [Text.Encoding]::UTF8
$message.BodyEncoding = [Text.Encoding]::UTF8
foreach ($p in $PiecesJointes) {
    $pj = New-Object System.Net.Mail.Attachment((Resolve-Path $p).Path)
    $pj.Name = Get-NomPieceJointe $p
    $message.Attachments.Add($pj)
}

$smtp = New-Object System.Net.Mail.SmtpClient('smtp.gmail.com', 587)
$smtp.EnableSsl = $true
$smtp.Credentials = New-Object System.Net.NetworkCredential($expediteur, $motDePasse)
try {
    $smtp.Send($message)
    "Envoyé à $A : $Objet"
}
finally {
    $message.Dispose()
    $smtp.Dispose()
}
