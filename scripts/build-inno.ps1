$ErrorActionPreference = 'Stop'

$Root = Split-Path -Parent (Split-Path -Parent $PSCommandPath)
$IsccCandidates = @(@(
    (Get-Command ISCC.exe -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source -ErrorAction SilentlyContinue),
    'C:\Program Files (x86)\Inno Setup 6\ISCC.exe',
    'C:\Program Files\Inno Setup 6\ISCC.exe',
    "$env:LOCALAPPDATA\Programs\Inno Setup 6\ISCC.exe"
) | Where-Object { $_ -and (Test-Path $_) })

if (-not $IsccCandidates) {
    throw 'Inno Setup Compiler was not found. Install Inno Setup 6, then rerun this script.'
}

& (Join-Path $Root 'scripts\prepare-hackgen.ps1')

$IssPath = Join-Path $Root 'installer\HackGen.iss'
& $IsccCandidates[0] $IssPath

Get-ChildItem (Join-Path $Root 'dist') -Filter '*.exe' | Sort-Object LastWriteTime -Descending | Select-Object -First 1 FullName, Length
