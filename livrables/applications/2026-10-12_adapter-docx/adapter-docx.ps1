<#
.SYNOPSIS
    Crée un CV ou une lettre à partir d'un modèle Word, en remplaçant des paragraphes entiers,
    puis exporte le PDF avec Word. Utilisé par /emploi.

.DESCRIPTION
    Le fichier de remplacements est un JSON { "texte exact du paragraphe d'origine": "nouveau texte" }.
    Seul le texte change : la police, la taille et la mise en forme du paragraphe sont conservées
    (celles de son premier caractère). Ne pas l'utiliser sur un paragraphe qui mélange plusieurs
    mises en forme (ex. une date en gras suivie d'un intitulé normal).
    Le script s'arrête si un paragraphe d'origine est introuvable, pour éviter un document à moitié modifié.

.EXAMPLE
    .\adapter-docx.ps1 -Modele ..\..\taff\x\lettre.docx -Sortie ..\..\taff\y\lettre-motivation_y.docx -Remplacements remplacements.json
#>
param(
    [Parameter(Mandatory)][string]$Modele,
    [Parameter(Mandatory)][string]$Sortie,
    [Parameter(Mandatory)][string]$Remplacements
)

$ErrorActionPreference = 'Stop'

$modeleComplet = (Resolve-Path $Modele).Path
$sortieComplete = [IO.Path]::GetFullPath((Join-Path (Get-Location) $Sortie))
$pdf = [IO.Path]::ChangeExtension($sortieComplete, '.pdf')
New-Item -ItemType Directory -Force (Split-Path $sortieComplete) | Out-Null
Copy-Item $modeleComplet $sortieComplete -Force

$table = Get-Content $Remplacements -Raw -Encoding UTF8 | ConvertFrom-Json
# Les espaces insécables (typographie française, ex. avant « : ») comptent comme des espaces normales
function Get-TexteNormalise([string]$t) { $t -replace '[  ]', ' ' }

$aFaire = @{}
foreach ($prop in $table.PSObject.Properties) { $aFaire[(Get-TexteNormalise $prop.Name)] = $prop.Value }

$word = New-Object -ComObject Word.Application
$word.Visible = $false
$word.DisplayAlerts = 0
try {
    $doc = $word.Documents.Open($sortieComplete)
    $trouves = @{}
    foreach ($p in @($doc.Paragraphs)) {
        $texte = $p.Range.Text.TrimEnd([char]13, [char]7, ' ')
        $cle = Get-TexteNormalise $texte
        if ($aFaire.ContainsKey($cle) -and -not $trouves.ContainsKey($cle)) {
            # On ne remplace que le texte visible, sans la marque de fin de paragraphe
            $debut = $p.Range.Start
            # Espace insécable avant : ; ! ? pour éviter qu'ils se retrouvent seuls en début de ligne
            $doc.Range($debut, $debut + $texte.Length).Text = $aFaire[$cle] -replace ' ([:;!?])', "$([char]0x00A0)`$1"
            $trouves[$cle] = $true
        }
    }
    $manquants = $aFaire.Keys | Where-Object { -not $trouves.ContainsKey($_) }
    if ($manquants) {
        $doc.Close([ref]0)
        Remove-Item $sortieComplete -Force
        throw "Paragraphe(s) introuvable(s) dans le modèle :`n - " + ($manquants -join "`n - ")
    }
    $doc.Save()
    $doc.ExportAsFixedFormat($pdf, 17)   # 17 = PDF
    $pages = $doc.ComputeStatistics(2)   # 2 = nombre de pages
    $doc.Close([ref]0)
    "OK : $(Split-Path $sortieComplete -Leaf) et PDF, $pages page(s), $($trouves.Count) paragraphe(s) remplacé(s)"
}
finally {
    $word.Quit()
    [void][Runtime.InteropServices.Marshal]::ReleaseComObject($word)
}
