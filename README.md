# winget-hackgen

Windows Package Manager manifests for HackGen, a Japanese programming font developed by yuru7 and based on Hack and GenJyuu-Gothic.

This repository contains manifests intended for submission to the Windows Package Manager Community Repository.

## Package

- Package identifier: `yuru7.HackGen`
- Package version: `2.10.0`
- Upstream project: <https://github.com/yuru7/HackGen>
- Upstream release: <https://github.com/yuru7/HackGen/releases/tag/v2.10.0>

## Validation

From Windows:

```powershell
winget validate .\fonts\y\yuru7\HackGen\2.10.0
```

From WSL, copy the manifest directory to a Windows-readable path first if `winget.exe` cannot read the WSL UNC path directly.

## License

The manifests in this repository are licensed under the MIT License.

HackGen itself is developed by yuru7 and is distributed under the SIL Open Font License 1.1.
