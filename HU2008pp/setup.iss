#define GameName "Hunting Unlimited 2008"
#define MyAppVersion "1.01"
#define MySetupFile "HU2008pp"
#define InstIcon "pp2008.ico"
#define UninstIcon "pp2008u.ico"
#define HUexe "hu2008.exe"
#define MyAppPublisher "HU Corner"
#define MyAppURL "http://hucorner.imbl.net/"

[Setup]
AppName={#GameName} PowerPack
AppVersion={#MyAppVersion}
AppVerName={#SetupSetting("AppName")} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
VersionInfoVersion={#SetupSetting("AppVersion")}
DefaultGroupName={#GameName}
SetupIconFile=..\inno_files\{#InstIcon}
DefaultDirName={code:GetHUPath}\pp_files
CreateAppDir=yes
DisableDirPage=yes
UninstallDisplayIcon={app}\{#InstIcon}
UninstallFilesDir={app}
InfoBeforeFile=info.txt
WizardSmallImageFile=..\inno_files\logoimg.bmp
WizardImageFile=..\inno_files\sideimg.bmp
OutputDir=.
OutputBaseFilename=..\{#MySetupFile}
Compression=lzma
SolidCompression=yes
;Uninstallable=false
DisableProgramGroupPage=yes
;SetupLogging=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: desktopicons; Description: "Create a &desktop icon"

[Files]
Source: "lib\game.dll"; DestDir: "{code:GetHUPath}\lib"; BeforeInstall: BackupFiles; Flags: ignoreversion
Source: "base\*"; DestDir: "{tmp}\pp08files"; Flags: recursesubdirs ignoreversion deleteafterinstall
Source: "7za.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "license.txt"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "readme.txt"; DestDir: "{app}"; Flags: ignoreversion isreadme
Source: "..\inno_files\{#InstIcon}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\inno_files\{#UninstIcon}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\inno_files\hucorner.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\inno_files\link_HUCorner.url"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#SetupSetting("AppName")}"; Filename: "{code:GetHUPath}\{#HUexe}"; IconFilename: "{app}\{#InstIcon}"
Name: "{group}\{#SetupSetting("AppName")} Readme"; Filename: "{app}\readme.txt"
Name: "{group}\Uninstall {#SetupSetting("AppName")}"; Filename: "{uninstallexe}"; IconFilename: "{app}\{#UninstIcon}"
Name: "{group}\Visit HU Corner site"; Filename: "{app}\link_HUCorner.url"; IconFilename: "{app}\hucorner.ico"
Name: "{group}\{#GameName} Tournaments Folder"; Filename: "{userdocs}\{#GameName}\tournaments"
Name: "{commondesktop}\{#SetupSetting("AppName")}"; Filename: "{code:GetHUPath}\{#HUexe}"; IconFilename: "{app}\{#InstIcon}"; Tasks: desktopicons
Name: "{commondesktop}\Visit HU Corner site"; Filename: "{app}\link_HUCorner.url"; IconFilename: "{app}\hucorner.ico"; Tasks: desktopicons
Name: "{commondesktop}\{#GameName} Tournaments Folder"; Filename: "{userdocs}\{#GameName}\tournaments"; Tasks: desktopicons

[Messages]
SetupAppTitle={#SetupSetting("AppVerName")} Installer
SetupWindowTitle={#SetupSetting("AppVerName")} Installer
UninstallAppTitle={#SetupSetting("AppVerName")} Uninstaller
UninstallAppFullTitle={#SetupSetting("AppVerName")} Uninstaller

[Registry]
Root: HKCU; Subkey: "Software\HU Corner"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\HU Corner\HU PowerPack"; Flags: uninsdeletekeyifempty
Root: HKCU; Subkey: "Software\HU Corner\HU PowerPack\{#GameName}"; ValueType: string; ValueName: "Version"; ValueData: "{#MyAppVersion}"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\HU Corner\HU PowerPack\{#GameName}"; ValueType: string; ValueName: "GamePath"; ValueData: "{code:GetHUPath}"; Flags: uninsdeletekey

[Run]
Filename: "{tmp}\7za.exe"; Parameters: "a -tzip -r0 -mx0 ""{code:GetHUPath}\base.scs"" .\pp08files\*"; StatusMsg: "Adding files to your {#GameName} game, please wait..."; Flags: runhidden
Filename: "{code:GetHUPath}\{#HUexe}"; Description: "Launch {#SetupSetting("AppName")}"; Flags: postinstall nowait skipifsilent unchecked

[Code]
const
   GameNotFoundError = '{#GameName} installation was not detected on this system.';
   BaseFileNotFoundError = 'base.scs file not found.';
   NoBackupError = 'No backup files detected. Would you like to backup files now?'#13#13'This might take awhile...';
   InstallStopMsg = '{#SetupSetting("AppName")} installation will now stop.';
   AltInstallMsg = 'If you have {#GameName} on your computer, move the PowerPack installer to the game folder and install from there.';

var HUPath: String;

procedure BackupFiles();
begin
  //silent copy of game dll file to restore at unistall
  if not FileExists(HUPath + '\zbplib.dll') then begin
  FileCopy(HUPath + '\lib\game.dll', HUPath + '\zbplib.dll', true);
  end;

  if not FileExists(HUPath + '\pp_files\backup\ppbfile.001') then begin
    if MsgBox(NoBackupError, mbConfirmation, MB_YesNo) = IDYes then begin
      CreateDir(HUPath + '\pp_files');
      CreateDir(HUPath + '\pp_files\backup');
      FileCopy(HUPath + '\base.scs', HUPath + '\pp_files\backup\ppbfile.001', false);
      FileCopy(HUPath + '\lib\game.dll', HUPath + '\pp_files\backup\ppbfile.002', false);
    end;
  end;
end;

function GetNumber(var temp: String): Integer;
var part: String; pos1: Integer;
begin
  if Length(temp) = 0 then begin
    Result := -1;
    Exit;
  end;
  pos1 := Pos('.', temp);
  if (pos1 = 0) then begin
    Result := StrToInt(temp);
    temp := '';
  end else begin
    part := Copy(temp, 1, pos1 - 1);
    temp := Copy(temp, pos1 + 1, Length(temp));
    Result := StrToInt(part);
  end;
end;


function CompareInner(var temp1, temp2: String): Integer;
var num1, num2: Integer;
begin
  num1 := GetNumber(temp1);
  num2 := GetNumber(temp2);
  if (num1 = -1) or (num2 = -1) then begin
    Result := 0;
    Exit;
  end;
  if (num1 > num2) then begin
    Result := 1;
  end else if (num1 < num2) then begin
    Result := -1;
  end else begin
    Result := CompareInner(temp1, temp2);
  end;
end;


function CompareVersion(str1, str2: String): Integer;
var temp1, temp2: String;
begin
  temp1 := str1;
  temp2 := str2;
  Result := CompareInner(temp1, temp2);
end;


function InitializeSetup(): Boolean;
var KeyValue, oldVersion: String;
begin
  // Check & find game folder via Reg - PowerPack RegKey
  if RegQueryStringValue(HKCU, 'Software\HU Corner\HU PowerPack\{#GameName}', 'GamePath', KeyValue) then begin
    HUPath := KeyValue;
    Result := true;
    //Check if same or newer version of PowerPack is installed
    RegQueryStringValue(HKCU, 'Software\HU Corner\HU PowerPack\{#GameName}', 'Version', oldVersion)
    if (CompareVersion(oldVersion, '{#MyAppVersion}') >= 0) then begin
      if MsgBox('{#SetupSetting("AppName")} ' + oldVersion + ' is already installed. You are about to install version {#MyAppVersion} .'#13'Proceed with installation?', mbConfirmation, MB_YesNo) = IDNo then
        Result := false;
    end;
  // Check & find game folder via Reg - Retail version
  end else if RegQueryStringValue(HKCU, 'Software\ValuSoft\Hunting Unlimited 2008', 'TargetPath', KeyValue) then begin
    HUPath := RemoveBackslashUnlessRoot(ExtractFilePath(KeyValue));
    Result := true;
  // Check & find game folder via Reg - Steam version
  end else if RegQueryStringValue(HKLM, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 12530', 'InstallLocation', KeyValue) then begin
    HUPath := KeyValue;
    Result := true;
  end else if RegQueryStringValue(HKLM, 'Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 12530', 'InstallLocation', KeyValue) then begin
    HUPath := KeyValue;
    Result := true;
  // Alternate install method, if base.scs is present in the same folder.
  end else if FileExists(ExpandConstant('{src}') + '\base.scs') then begin
    HUPath := ExpandConstant('{src}');
    Result := true;
  end else begin
    MsgBox(GameNotFoundError + #13 + InstallStopMsg + #13#13 + AltInstallMsg, mbError, mb_Ok);
    Result := false;
  end;
  // In case HU is installed but base.scs is not found...
  if not FileExists(HUPath + '\base.scs') then begin
    MsgBox(BaseFileNotFoundError + #13 + InstallStopMsg + #13#13 + AltInstallMsg, mbError, mb_Ok);
    Result := false;
  end;
end;

function GetHUPath(Param: String): String;
begin
   Result := HUPath;
end;


function InitializeUninstall(): Boolean;
begin
  if not RegQueryStringValue(HKCU, 'Software\HU Corner\HU PowerPack\{#GameName}', 'GamePath', HUPath) then begin
    MsgBox('Missing uninstall information data.'#13'Please reinstall {#SetupSetting("AppVerName")}', mbError, mb_Ok);
    Result := false;
  end else begin
  Result := true;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if (CurUninstallStep = usPostUninstall) then begin
    if DirExists(HUPath + '\pp_files\backup') then begin
      if FileExists(HUPath + '\pp_files\backup\ppbfile.001') or FileExists(HUPath + '\pp_files\backup\ppbfile.002') then begin
        MsgBox('Backup files detected, they will now be restored.'#13#13'Click OK to continue.', mbConfirmation, mb_OK);
      end;
      if FileExists(HUPath + '\pp_files\backup\ppbfile.001') then begin
        FileCopy(HUPath + '\pp_files\backup\ppbfile.001', HUPath + '\base.scs', false);
        DeleteFile(HUPath + '\pp_files\backup\ppbfile.001');
      end;
      if FileExists(HUPath + '\pp_files\backup\ppbfile.002') then begin
        FileCopy(HUPath + '\pp_files\backup\ppbfile.002', HUPath + '\lib\game.dll', false);
        DeleteFile(HUPath + '\pp_files\backup\ppbfile.002');
      end;
      RemoveDir(HUPath + '\pp_files\backup');
    end;

    //silent restore of game dll file backed up at install
    FileCopy(HUPath + '\zbplib.dll', HUPath + '\lib\game.dll', false);
    DeleteFile(HUPath + '\zbplib.dll');
  end;

  if (CurUninstallStep = usDone) then begin
    RemoveDir(HUPath + '\pp_files');
  end;
end;