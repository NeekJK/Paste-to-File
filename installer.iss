[Setup]
AppName=Paste-to-File
AppVersion=1.0
AppPublisher=Nick Calvin
AppPublisherURL=http://www.github.com/NeekJK
DefaultDirName={pf}\Paste-to-File
DefaultGroupName=Paste-to-File
OutputDir=.
OutputBaseFilename="Paste-to-File Installer"
Compression=zip
SolidCompression=yes
PrivilegesRequired=admin
CreateUninstallRegKey=yes
UninstallDisplayName="Paste-to-File"
UninstallDisplayIcon={app}\paste-to-file.exe
AllowNoIcons=yes
SetupIconFile=icon.ico

[Files]
Source: "target\release\paste-to-file.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "target\release\uninstall.bat"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\Paste-to-File"; Filename: "{app}\paste-to-file.exe"

[Registry]
; Add right-click "Launch Paste-to-File here" to directories
Root: HKCR; Subkey: "Directory\Background\shell\PasteToFile"; ValueType: string; ValueName: ""; ValueData: "Paste as file"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\PasteToFile\command"; ValueType: string; ValueName: ""; ValueData: """{app}\paste-to-file.exe"" ""%V"""; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\Background\shell\PasteToFile"; ValueType: string; ValueName: Icon; ValueData: "{app}\paste-to-file.exe"

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[UninstallRun]
Filename: "{app}\uninstall.bat"; Flags: runhidden
