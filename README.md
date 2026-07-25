# winget-hackgen

Windows Package Manager manifests for HackGen, a Japanese programming font developed by yuru7 and based on Hack and GenJyuu-Gothic.

This repository contains manifests intended for submission to the Windows Package Manager Community Repository.

## Package

- Package identifier: `yuru7.HackGen`
- Package version: `2.10.0`
- Upstream project: <https://github.com/yuru7/HackGen>
- Upstream release: <https://github.com/yuru7/HackGen/releases/tag/v2.10.0>
- Installer type: Inno Setup
- Installer scope: machine

## Validation and local install

From Windows:

```powershell
winget validate .\manifests\y\yuru7\HackGen\2.10.0
```

To test installation from a local manifest, enable local manifest files from an elevated PowerShell session:

```powershell
winget settings --enable LocalManifestFiles
```

Then run:

```powershell
winget install --manifest .\manifests\y\yuru7\HackGen\2.10.0
```

From WSL, copy the manifest directory to a Windows-readable path first if `winget.exe` cannot read the WSL UNC path directly.

## Inno Setup installer

The `installer/` and `scripts/` directories contain an Inno Setup based installer for machine-wide font installation.

Prerequisites:

- Inno Setup 6
- PowerShell

Build from Windows:

```powershell
.\scripts\build-inno.ps1
```

The build script downloads the upstream HackGen `v2.10.0` ZIP, verifies its SHA256 hash, extracts the TTF files under `vendor/`, and writes the installer under `dist/`.

The generated installer requires administrator privileges and installs the fonts to Windows' automatic fonts location through Inno Setup's `{autofonts}` destination.

The winget manifest expects the installer to be published as a GitHub Releases asset:

```text
https://github.com/dfirr/winget-hackgen/releases/download/v2.10.0/HackGen-2.10.0-Setup.exe
```

Installer SHA256:

```text
A1FABFAE036E4688DE76B3FC26CE041338F046C66598EEB57BBFD2F816FFAFED
```

The installer is not code-signed. Windows Defender SmartScreen may warn that the app is unrecognized until the binary has sufficient reputation. Verify the SHA256 hash before running the installer directly.

## License

The manifests in this repository are licensed under the MIT License.

HackGen itself is developed by yuru7 and is distributed under the SIL Open Font License 1.1.
