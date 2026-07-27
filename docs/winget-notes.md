# WinGet Packaging Notes

This document records packaging decisions and observations from preparing HackGen for the Windows Package Manager Community Repository.

## Current approach

The package is submitted as a regular manifest under:

```text
manifests/y/yuru7/HackGen/2.10.0
```

It uses an Inno Setup installer:

```yaml
InstallerType: inno
Scope: machine
```

This is intentional. HackGen is primarily useful in terminals and developer tools, and Windows Terminal needs the font to be visible from packaged app contexts.

## Why not `fonts/`

WinGet has a `fonts/` tree with manifests that use:

```yaml
InstallerType: zip
NestedInstallerType: font
```

This was tested first for HackGen. The ZIP manifest validated and installed successfully, but the font was installed per-user under a Desktop App Installer font path similar to:

```text
C:\Users\<user>\AppData\Local\Microsoft\Windows\Fonts\Microsoft.DesktopAppInstaller_...
```

Windows Terminal did not enumerate that per-user installation. WPS Writer did, which confirmed that the font was installed but not visible to all application models.

Adding `Scope: machine` to the ZIP/font manifest did not make it install into `C:\Windows\Fonts`; it still installed per-user. The likely reason is that `NestedInstallerType: font` is handled by Desktop App Installer rather than by an installer that accepts a machine-scope switch.

## Windows Terminal behavior

Directly setting Windows Terminal to:

```json
"font": {
  "face": "HackGen Console"
}
```

failed when HackGen was installed through the ZIP/font manifest. After installing the Inno Setup package machine-wide, Windows Terminal could see and use HackGen.

This matches discussion in `microsoft/winget-cli` where `@lhecker`, who works on Windows Terminal font rendering, noted that per-user fonts do not work for packaged apps and that all-user font installation is preferable for Terminal compatibility:

```text
https://github.com/microsoft/winget-cli/discussions/4515#discussioncomment-9638670
```

## Chocolatey comparison

Chocolatey's `font-hackgen` package does not build an EXE installer. It downloads the upstream HackGen ZIP and uses Chocolatey's PowerShell font helper functions:

```text
Install-ChocolateyFont
Uninstall-ChocolateyFont
```

That model does not translate directly to WinGet because WinGet manifests are declarative and do not run arbitrary package scripts in the same way.

## Installer notes

The Inno Setup installer is generated locally from the upstream HackGen release ZIP. The build script:

1. Downloads `HackGen_v2.10.0.zip` from `yuru7/HackGen`.
2. Verifies its SHA256 hash.
3. Extracts the TTF files into `vendor/`.
4. Builds `dist/HackGen-2.10.0-Setup.exe`.

The generated installer is not committed to this repository. It is published as a GitHub Releases asset.

The installer is currently not code-signed. Windows Defender SmartScreen may warn that it is unrecognized. If a signed build is produced later, publish it as a new asset, recalculate `InstallerSha256`, and update the manifest.

## Versioning

`PackageVersion` follows the bundled HackGen font version. The installer version currently follows the same value, but it is conceptually distinct from the upstream font version.

Avoid replacing an existing release asset in-place after publication. A rebuilt installer changes the SHA256 hash and should be published with a deliberate update to the manifest.

## Official PR

The initial PR to `microsoft/winget-pkgs` is:

```text
https://github.com/microsoft/winget-pkgs/pull/407728
```

At the time these notes were written, validation had passed and the PR was waiting for moderator review.
