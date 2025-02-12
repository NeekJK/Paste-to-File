[Setup]
AppName=Paste-to-File
AppVersion=1.0
DefaultDirName={commonpf}\Paste-to-File
UninstallDisplayName=Paste-to-File Uninstaller
SetupIconFile="C:\Users\nicho\Documents\Tech Projects\Paste-to-File\src\paste2file.ico"
OutputDir=Output
AppPublisher=neek0tine
AppCopyright=© 2024 neek0tine

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Dirs]
Name: "{commonpf}\Paste-to-File"

[Files]
Source: "C:\Users\nicho\Documents\Tech Projects\Paste-to-File\src\paste2file.exe"; DestDir: "{app}"
Source: "C:\Users\nicho\Documents\Tech Projects\Paste-to-File\src\paste2file.ico"; DestDir: "{app}"

[Registry]
Root: HKCR; Subkey: "Directory\Background\shell\Paste2File"; ValueType: string; ValueName: ""; ValueData: "&Paste as file"
Root: HKCR; Subkey: "Directory\Background\shell\Paste2File"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\paste2file.ico"
Root: HKCR; Subkey: "Directory\Background\shell\Paste2File\command"; ValueType: string; ValueName: ""; ValueData: """{app}\paste2file.exe"""
Root: HKCR; Subkey: "Directory\Background\shell\Paste2File"; Flags: uninsdeletekey  