; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Markdown Edit"
#define MyAppVersion "1.0.1"
#define MyAppPublisher "Mike Ward"
#define MyAppURL "http://mike-ward.net/markdownedit"
#define MyAppExeName "mde.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{24E78DF4-D32B-4B48-A58D-84EA579B0E6E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=..\..\LICENSE.txt
OutputBaseFilename=MarkdownEditSetup
SetupIconFile=..\MarkdownEdit\logo.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\MarkdownEdit\bin\Release\mde.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\CommonMark.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\ICSharpCode.AvalonEdit.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\MahApps.Metro.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\NHunspell.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Hunspellx64.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Hunspellx86.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\System.Windows.Interactivity.dll"; DestDir: "{app}"; Flags: ignoreversion

Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\en_us.aff"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\en_us.dic"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion

Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\German.aff"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\German.dic"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion

Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\French.aff"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\French.dic"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion

Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\Spanish.aff"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\Spanish.dic"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion

Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\Italian.aff"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\SpellCheck\Dictionaries\Italian.dic"; DestDir: "{app}\SpellCheck\Dictionaries"; Flags: ignoreversion

Source: "..\MarkdownEdit\bin\Release\Themes\brain-salad-surgery.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\inflamed-wound.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\milk-toast.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\programmers-cant-design.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\solarized-light.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\solarized-dark.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\the-blues.json"; DestDir: "{app}\Themes"; Flags: ignoreversion
Source: "..\MarkdownEdit\bin\Release\Themes\zenburn.json"; DestDir: "{app}\Themes"; Flags: ignoreversion

Source: "Fonts\OpenSans-Regular.ttf"; DestDir: "{fonts}"; FontInstall: "Open Sans Regular"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\OpenSans-Bold.ttf"; DestDir: "{fonts}"; FontInstall: "Open Sans Bold"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\OpenSans-Italic.ttf"; DestDir: "{fonts}"; FontInstall: "Open Sans Italic"; Flags: onlyifdoesntexist uninsneveruninstall;
Source: "Fonts\OpenSans-BoldItalic.ttf"; DestDir: "{fonts}"; FontInstall: "Open Sans Bold Italic"; Flags: onlyifdoesntexist uninsneveruninstall;

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
function IsDotNetDetected(): boolean;
var
    key: string;
    release: cardinal;
    success: boolean;
begin
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\full';
    success := RegQueryDWordValue(HKLM, key, 'Release', release);
    success := success and (release >= 379893);
    result := success;
end;

function InitializeSetup(): Boolean;
begin
    if not IsDotNetDetected() then begin
        MsgBox('Markdown Edit requires Microsoft .NET 4.5.2'#13#13
               'Download it at http://smallestdotnet.com'#13
               ,mbError, MB_OK);
        result := false;
    end 
    else
        result := true;
end;

