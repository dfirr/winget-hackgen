#define AppName "HackGen"
#define AppVersion "2.10.0"
#define AppPublisher "yuru7"
#define AppURL "https://github.com/yuru7/HackGen"
#define SourceDir "..\vendor\HackGen_v2.10.0"

[Setup]
AppId={{90F8EA35-5CE0-4BBE-81D1-69D1397673F4}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={autopf}\HackGen
DisableDirPage=yes
DisableProgramGroupPage=yes
OutputBaseFilename=HackGen-{#AppVersion}-Setup
OutputDir=..\dist
Compression=lzma2
SolidCompression=yes
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64compatible
UninstallDisplayName=HackGen
UninstallDisplayIcon={app}\HackGen-Regular.ttf
LicenseFile=..\vendor\HackGen-LICENSE.txt
WizardStyle=modern

[Files]
Source: "{#SourceDir}\HackGen-Regular.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen Regular"; Flags: restartreplace
Source: "{#SourceDir}\HackGen-Bold.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen Bold"; Flags: restartreplace
Source: "{#SourceDir}\HackGen35-Regular.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen35 Regular"; Flags: restartreplace
Source: "{#SourceDir}\HackGen35-Bold.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen35 Bold"; Flags: restartreplace
Source: "{#SourceDir}\HackGenConsole-Regular.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen Console Regular"; Flags: restartreplace
Source: "{#SourceDir}\HackGenConsole-Bold.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen Console Bold"; Flags: restartreplace
Source: "{#SourceDir}\HackGen35Console-Regular.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen35 Console Regular"; Flags: restartreplace
Source: "{#SourceDir}\HackGen35Console-Bold.ttf"; DestDir: "{autofonts}"; FontInstall: "HackGen35 Console Bold"; Flags: restartreplace
Source: "{#SourceDir}\HackGen-Regular.ttf"; DestDir: "{app}"; Flags: ignoreversion
