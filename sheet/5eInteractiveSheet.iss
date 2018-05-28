            #define MyAppName "5eInteractiveSheet"
#define MyAppVersion "1.0.0"
#define MyAppExeName "5eInteractiveSheet.bat"
#define RVersion "3.4.3"
#define IncludeR true
#define PandocVersion "1.17.2"
#define IncludePandoc false
#define IncludeChrome false
#define MyAppPublisher ""
#define MyAppURL ""

[Setup]
AppName = {#MyAppName}
AppId = {{ZY5P0XDC-YF04-IL9C-15BW-NRYU7ZFI31UC}
DefaultDirName = {userdocs}\{#MyAppName}
DefaultGroupName = {#MyAppName}
OutputDir = RInno_installer
OutputBaseFilename = setup_{#MyAppName}
SetupIconFile = setup.ico
AppVersion = {#MyAppVersion}
AppPublisher = {#MyAppPublisher}
AppPublisherURL = {#MyAppURL}
AppSupportURL = {#MyAppURL}
AppUpdatesURL = {#MyAppURL}
PrivilegesRequired = lowest
InfoBeforeFile = infobefore.txt
InfoAfterFile = infoafter.txt
Compression = lzma2/ultra64
SolidCompression = yes
ArchitecturesInstallIn64BitMode = x64

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\default.ico"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\default.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; IconFilename: "{app}\default.ico"

          [Files]
          Source: "LICENSE"; Flags: dontcopy
          Source: "{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
          #if IncludeR
              Source: "R-{#RVersion}-win.exe"; DestDir: "{tmp}"; Check: RNeeded
          #endif
          #if IncludePandoc
              Source: "pandoc-{#PandocVersion}-windows.msi"; DestDir: "{tmp}"; Check: PandocNeeded
          #endif
          #if IncludeChrome
              Source: "chrome_installer.exe"; DestDir: "{tmp}"; Check: ChromeNeeded
          #endif
          Source: "5eInteractiveSheet.bat"; DestDir: "{app}"; Flags: ignoreversion;
Source: "default.ico"; DestDir: "{app}"; Flags: ignoreversion;
Source: "global.R"; DestDir: "{app}"; Flags: ignoreversion;
Source: "LICENSE"; DestDir: "{app}"; Flags: ignoreversion;
Source: "modules.R"; DestDir: "{app}"; Flags: ignoreversion;
Source: "server.R"; DestDir: "{app}"; Flags: ignoreversion;
Source: "setup.ico"; DestDir: "{app}"; Flags: ignoreversion;
Source: "ui.R"; DestDir: "{app}"; Flags: ignoreversion;
          Source: "modules/healthModule.R"; DestDir: "{app}\modules"; Flags: ignoreversion;
Source: "utils/app.R"; DestDir: "{app}\utils"; Flags: ignoreversion;
Source: "utils/config.cfg"; DestDir: "{app}\utils"; Flags: ignoreversion;
Source: "utils/ensure.R"; DestDir: "{app}\utils"; Flags: ignoreversion;
Source: "utils/get_app_from_app_url.R"; DestDir: "{app}\utils"; Flags: ignoreversion;
Source: "utils/package_manager.R"; DestDir: "{app}\utils"; Flags: ignoreversion;
Source: "utils/wsf/js/JSON.minify.js"; DestDir: "{app}\utils\wsf\js"; Flags: ignoreversion;
Source: "utils/wsf/js/json2.js"; DestDir: "{app}\utils\wsf\js"; Flags: ignoreversion;
Source: "utils/wsf/js/run.js"; DestDir: "{app}\utils\wsf\js"; Flags: ignoreversion;
Source: "utils/wsf/run.wsf"; DestDir: "{app}\utils\wsf"; Flags: ignoreversion;
Source: "www/default.ico"; DestDir: "{app}\www"; Flags: ignoreversion;
Source: "www/icons/battered-axe.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/bo.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/claw-hammer.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/crossbow.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/dart.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/dice-twenty-faces-twenty.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/fishing-net.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/fist.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/flail.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/flanged-mace.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/high-shot.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/pointy-sword.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/sharp-halberd.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/sickle.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/sling.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/spear-hook.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/thrown-spear.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/trident.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/whip.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/icons/wood-club.png"; DestDir: "{app}\www\icons"; Flags: ignoreversion;
Source: "www/js/jqfp.js"; DestDir: "{app}\www\js"; Flags: ignoreversion;
Source: "www/js/md5.js"; DestDir: "{app}\www\js"; Flags: ignoreversion;
Source: "www/js/shinyBindings.js"; DestDir: "{app}\www\js"; Flags: ignoreversion;
Source: "www/style.css"; DestDir: "{app}\www"; Flags: ignoreversion;

  [Run]
  #if IncludeR
      Filename: "{tmp}\R-{#RVersion}-win.exe"; Parameters: "/SILENT"; WorkingDir: {tmp}; Check: RNeeded; Flags: skipifdoesntexist; StatusMsg: "Installing R if needed"
  #endif
  #if IncludePandoc
      Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\pandoc-{#PandocVersion}-windows.msi"" /q"; WorkingDir: {tmp}; Check: PandocNeeded; Flags: skipifdoesntexist; StatusMsg: "Installing Pandoc if needed"
  #endif
  #if IncludeChrome
      Filename: "chrome_installer.exe"; Parameters: "/silent /install"; WorkingDir: {tmp}; Check: ChromeNeeded; Flags: skipifdoesntexist; StatusMsg: "Installing Chrome if needed"
  #endif
  Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: shellexec postinstall skipifsilent


  [UninstallDelete]
Type: filesandordirs; Name: "{app}\library";
Type: filesandordirs; Name: "{app}\utils";
Type: filesandordirs; Name: "{app}\log";

[Code]
const
  ChromeRegKey = 'Software\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe';
  IERegKey = 'Software\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE';
  FFRegKey = 'Software\Microsoft\Windows\CurrentVersion\App Paths\firefox.exe';
var
  RVersions: TStringList;
  RRegKey: string;
  RegPathsFile: string;
  SecondLicensePage: TOutputMsgMemoWizardPage;
  License2AcceptedRadio: TRadioButton;
  License2NotAcceptedRadio: TRadioButton;

// Is R installed?
function RDetected(): boolean;
var
    v: Integer;
    success: boolean;
begin
    for v := 0 to (RVersions.Count - 1) do
      begin
        if RegKeyExists(HKLM, 'Software\R-Core\R\' + RVersions[v]) or RegKeyExists(HKCU, 'Software\R-Core\R\' + RVersions[v]) then
          success := true
        if success then
          begin
            RRegKey := 'Software\R-Core\R\' + RVersions[v];
            break;
          end;
      end;
  begin
    Result := success;
  end;
end;

// If R is not detected, it is needed
function RNeeded(): Boolean;
begin
  Result := not RDetected;
end;


// Is Chrome installed?
function ChromeDetected(): boolean;
var
    success: boolean;
begin
  success := RegKeyExists(HKLM, ChromeRegKey);
  begin
    Result := success;
  end;
end;

// If Chrome is not detected, it is needed
function ChromeNeeded(): Boolean;
begin
  Result := not ChromeDetected;
end;


// Registry path update function (adds an extra backslash for json)
function AddBackSlash(Value: string): string;
begin
  Result := Value;
  StringChangeEx(Result, '\', '\\', True);
end;


// Pandoc is stored in the System PATH
function PandocDetected(): Boolean;
var
  PandocDir, Path: String;
begin
  Log('Checking for Pandoc in %PATH%');
  if RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', Path) then
  begin // Successfully read the value
    Log('HKCU\Environment\PATH = ' + Path);
    PandocDir := ExpandConstant('{localappdata}\Pandoc\');
    Log('Looking for Pandoc in %PATH%: ' + PandocDir + ' in ' + Path);
    if Pos(LowerCase(PandocDir), Lowercase(Path)) = 0 then
		begin
			Log('Did not find Pandoc in %PATH%');
			Result := False;
		end
    else
		begin
			Log('Found Pandoc in %PATH%');
			Result := True;
		end
  end
  else // The key probably doesn't exist
  begin
    Log('Could not access HKCU\Environment\PATH.');
    Result := False;
  end;
end;

// If Pandoc is not detected, it is needed
function PandocNeeded(): Boolean;
begin
  Result := not PandocDetected;
end;

// Save installation paths
procedure CurStepChanged(CurStep: TSetupStep);
var
  RPath, ChromePath, IEPath, FFPath, PandocPath: string;
begin
if CurStep = ssPostInstall then begin
    RPath := '';
    ChromePath := '';
    IEPath := '';
    FFPath := '';
    PandocPath := ExpandConstant('{localappdata}\Pandoc\');
    RegPathsFile := ExpandConstant('{app}\utils\regpaths.json');

    if Length(RRegKey) = 0 then
      RDetected;

    // Create registry paths file
    SaveStringToFile(RegPathsFile, '{' + #13#10, True);

    // R RegPath
    if RegQueryStringValue(HKLM, RRegKey, 'InstallPath', RPath) or RegQueryStringValue(HKCU, RRegKey, 'InstallPath', RPath) then
      SaveStringToFile(RegPathsFile, '"r": "' + AddBackSlash(RPath) + '",' + #13#10, True)
    else
      SaveStringToFile(RegPathsFile, '"r": "none",' + #13#10, True);

    // Chrome RegPath
    if RegQueryStringValue(HKLM, ChromeRegKey, 'Path', ChromePath) then
      SaveStringToFile(RegPathsFile, '"chrome": "' + AddBackSlash(ChromePath) + '",' + #13#10, True)
    else
      SaveStringToFile(RegPathsFile, '"chrome": "none",' + #13#10, True);

    // Internet Explorer RegPath
    if RegQueryStringValue(HKLM, IERegKey, '', IEPath) then
      SaveStringToFile(RegPathsFile, '"ie": "' + AddBackSlash(IEPath) + '",' + #13#10, True)
    else
      SaveStringToFile(RegPathsFile, '"ie": "none",' + #13#10, True);

    // Firefox RegPath
    if RegQueryStringValue(HKLM, FFRegKey, 'Path', FFPath) then
      SaveStringToFile(RegPathsFile, '"ff": "' + AddBackSlash(FFPath) + '",' + #13#10, True)
    else
      SaveStringToFile(RegPathsFile, '"ff": "none",' + #13#10, True);

    // Pandoc RegPath
    // ** Last Line in json file (no trailing comma) **
    if PandocDetected() then
      SaveStringToFile(RegPathsFile, '"pandoc": "' + AddBackSlash(PandocPath) + '"' + #13#10, True)
    else
      SaveStringToFile(RegPathsFile, '"pandoc": "none"' + #13#10, True);

    SaveStringToFile(RegPathsFile, '}', True);
  end;
end;

// Add RInno's license to the installer
procedure CheckLicense2Accepted(Sender: TObject);
begin
  { Update Next button when user (un)accepts the license }
  WizardForm.NextButton.Enabled := License2AcceptedRadio.Checked;
end;

function CloneLicenseRadioButton(Source: TRadioButton): TRadioButton;
begin
  Result := TRadioButton.Create(WizardForm);
  Result.Parent := SecondLicensePage.Surface;
  Result.Caption := Source.Caption;
  Result.Left := Source.Left;
  Result.Top := Source.Top;
  Result.Width := Source.Width;
  Result.Height := Source.Height;
  Result.OnClick := @CheckLicense2Accepted;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  { Update Next button when user gets to second license page }
  if CurPageID = SecondLicensePage.ID then
  begin
    CheckLicense2Accepted(nil);
  end;
end;

procedure InitializeWizard();
var
  LicenseFileName: string;
  LicenseFilePath: string;
begin
  { Create second license page, with the same labels as the original license page }
  SecondLicensePage :=
    CreateOutputMsgMemoPage(
      wpLicense, SetupMessage(msgWizardLicense), SetupMessage(msgLicenseLabel),
      SetupMessage(msgLicenseLabel3), '');

  { Shrink license box to make space for radio buttons }
  SecondLicensePage.RichEditViewer.Height := WizardForm.LicenseMemo.Height;

  { Load license }
  { Loading ex-post, as Lines.LoadFromFile supports UTF-8, }
  { contrary to LoadStringFromFile. }
  LicenseFileName := 'LICENSE';
  ExtractTemporaryFile(LicenseFileName);
  LicenseFilePath := ExpandConstant('{tmp}\' + LicenseFileName);
  SecondLicensePage.RichEditViewer.Lines.LoadFromFile(LicenseFilePath);
  DeleteFile(LicenseFilePath);

  { Clone accept/do not accept radio buttons for the second license }
  License2AcceptedRadio := CloneLicenseRadioButton(WizardForm.LicenseAcceptedRadio);
  License2NotAcceptedRadio := CloneLicenseRadioButton(WizardForm.LicenseNotAcceptedRadio);

  { Initially not accepted }
  License2NotAcceptedRadio.Checked := True;

  // Initialize the values of supported versions
  RVersions := TStringList.Create; // Make a new TStringList object reference
  // Add strings to the StringList object
  RVersions.Add('3.5.0');
  RVersions.Add('3.4.4');
  RVersions.Add('3.4.3');

end;

// Procedure called by InnoSetup when it is closing
procedure DeinitializeSetup();
begin
  RVersions.Free;
end;
