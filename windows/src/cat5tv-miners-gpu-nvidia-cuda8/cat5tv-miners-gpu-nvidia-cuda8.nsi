; The name of the installer
Name "cat5tv-miners-gpu-nvidia-cuda8"

; The file to write
OutFile "cat5tv-miners-gpu-nvidia-cuda8.exe"

; The default installation directory
InstallDir $PROGRAMFILES\cat5tv-miners-gpu-nvidia-cuda8

; Registry key to check for directory (so if you install again, it will 
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\cat5tv-miners-gpu-nvidia-cuda8" "Install_Dir"

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
Section "cat5tv-miners Monero CPU Miner"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "xmrig-nvidia.exe"
  File "config.json"
  
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\cat5tv-miners-gpu-nvidia-cuda8 "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-gpu-nvidia-cuda8" "DisplayName" "cat5tv-miners Monero CPU Miner"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-gpu-nvidia-cuda8" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-gpu-nvidia-cuda8" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-gpu-nvidia-cuda8" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\cat5tv-miners-gpu-nvidia-cuda8"
  CreateShortcut "$SMPROGRAMS\cat5tv-miners-gpu-nvidia-cuda8\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortcut "$SMPROGRAMS\cat5tv-miners-gpu-nvidia-cuda8\cat5tv-miners Monero CPU Miner.lnk" "$INSTDIR\xmrig-nvidia.exe" "" "$INSTDIR\xmrig-nvidia.exe" 0
  
SectionEnd

;--------------------------------

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\cat5tv-miners-gpu-nvidia-cuda8"
  DeleteRegKey HKLM SOFTWARE\cat5tv-miners-gpu-nvidia-cuda8

  ; Remove files and uninstaller
  Delete $INSTDIR\xmrig-nvidia.exe
  Delete $INSTDIR\config.json
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\cat5tv-miners-gpu-nvidia-cuda8\*.*"

  ; Remove directories used
  RMDir "$SMPROGRAMS\cat5tv-miners-gpu-nvidia-cuda8"
  RMDir "$INSTDIR"

SectionEnd
