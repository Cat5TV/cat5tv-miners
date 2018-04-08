; The name of the installer
Name "cat5tv-miners-cpu-autominer"

; The file to write
OutFile "cat5tv-miners-cpu-autominer-x64.exe"

; The default installation directory
InstallDir $PROGRAMFILES\cat5tv-miners-cpu-autominer

; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\cat5tv-miners-cpu-autominer" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------

; Pages

Page components
Page directory
Page instfiles

UninstPage uninstConfirm
UninstPage instfiles

;--------------------------------

; The stuff to install
Section "cat5tv-miners CPU Auto Miner"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "xmrig.exe"
  File "automine.bat"
  File "monero.conf"
  File "turtlecoin.conf"
  
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\cat5tv-miners-cpu-autominer "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-cpu-autominer" "DisplayName" "cat5tv-miners Monero CPU Miner"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-cpu-autominer" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-cpu-autominer" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-cpu-autominer" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\cat5tv-miners-cpu-autominer"
  CreateShortcut "$SMPROGRAMS\cat5tv-miners-cpu-autominer\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortcut "$SMPROGRAMS\cat5tv-miners-cpu-autominer\cat5tv-miners CPU Auto Miner.lnk" "$INSTDIR\xmrig.exe" "" "$INSTDIR\automine.bat" 0
  
SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-cpu-autominer"
  DeleteRegKey HKLM SOFTWARE\cat5tv-miners-cpu-autominer

  ; Remove files and uninstaller
  Delete $INSTDIR\xmrig.exe
  Delete $INSTDIR\monero.conf
  Delete $INSTDIR\turtlecoin.conf
  Delete $INSTDIR\automine.bat
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\cat5tv-miners-cpu-autominer\*.*"

  ; Remove directories used
  RMDir "$SMPROGRAMS\cat5tv-miners-cpu-autominer"
  RMDir "$INSTDIR"

SectionEnd
