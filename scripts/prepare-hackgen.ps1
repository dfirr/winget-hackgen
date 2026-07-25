$ErrorActionPreference = 'Stop'

$Version = '2.10.0'
$ExpectedSha256 = 'ED182E2A4B95792D94DEA7932F6B45280B5AE353651BE249D5F6B7867B788DB7'
$Root = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$Vendor = Join-Path $Root 'vendor'
$ZipPath = Join-Path $Vendor "HackGen_v$Version.zip"
$ExtractPath = Join-Path $Vendor "HackGen_v$Version"
$LicensePath = Join-Path $Vendor 'HackGen-LICENSE.txt'
$ReleaseUrl = "https://github.com/yuru7/HackGen/releases/download/v$Version/HackGen_v$Version.zip"
$LicenseUrl = "https://raw.githubusercontent.com/yuru7/HackGen/v$Version/LICENSE"

New-Item -ItemType Directory -Force -Path $Vendor | Out-Null

if (-not (Test-Path $ZipPath)) {
    Invoke-WebRequest -Uri $ReleaseUrl -OutFile $ZipPath
}

$ActualSha256 = (Get-FileHash -Algorithm SHA256 -Path $ZipPath).Hash
if ($ActualSha256 -ne $ExpectedSha256) {
    throw "Unexpected SHA256 for $ZipPath. Expected $ExpectedSha256 but got $ActualSha256."
}

if (Test-Path $ExtractPath) {
    Remove-Item -Recurse -Force $ExtractPath
}

Expand-Archive -Path $ZipPath -DestinationPath $Vendor -Force
Invoke-WebRequest -Uri $LicenseUrl -OutFile $LicensePath

Get-ChildItem -Path $ExtractPath -Filter '*.ttf' | Sort-Object Name | Select-Object Name, Length
