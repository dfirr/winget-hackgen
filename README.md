# winget-hackgen

Windows Package Manager manifests for HackGen, a Japanese programming font developed by yuru7 and based on Hack and GenJyuu-Gothic.

This repository contains manifests intended for submission to the Windows Package Manager Community Repository.

## Package

- Package identifier: `yuru7.HackGen`
- Package version: `2.10.0`
- Upstream project: <https://github.com/yuru7/HackGen>
- Upstream release: <https://github.com/yuru7/HackGen/releases/tag/v2.10.0>

## Validation and local install

From Windows:

```powershell
winget validate .\fonts\y\yuru7\HackGen\2.10.0
```

To test installation from a local manifest, enable local manifest files from an elevated PowerShell session:

```powershell
winget settings --enable LocalManifestFiles
```

Then run:

```powershell
winget install --manifest .\fonts\y\yuru7\HackGen\2.10.0
```

From WSL, copy the manifest directory to a Windows-readable path first if `winget.exe` cannot read the WSL UNC path directly.

## Inno Setup installer experiment

The `installer/` and `scripts/` directories contain an experimental Inno Setup based installer for testing machine-wide font installation.

Prerequisites:

- Inno Setup 6
- PowerShell

Build from Windows:

```powershell
.\scripts\build-inno.ps1
```

The build script downloads the upstream HackGen `v2.10.0` ZIP, verifies its SHA256 hash, extracts the TTF files under `vendor/`, and writes the installer under `dist/`.

The generated installer requires administrator privileges and installs the fonts to Windows' automatic fonts location through Inno Setup's `{autofonts}` destination.

## License

The manifests in this repository are licensed under the MIT License.

HackGen itself is developed by yuru7 and is distributed under the SIL Open Font License 1.1.
