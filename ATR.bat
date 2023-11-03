@echo off
color f0 & title v4                                                                                                                                                                gzmatte.github.io                 

if exist "C:\Windows\ATR" goto start
if not exist "C:\Windows\ATR" goto download

:download
echo Downloading files to work...
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest "https://github.com/gzmatte/ATR/raw/main/core.zip" -OutFile "%temp%\ATR.zip"


:: 7zip CHECK
:zip

if not exist "C:\Program Files\7-Zip\7z.exe" %SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest "https://www.7-zip.org/a/7z2201-x64.exe" -OutFile "%temp%\7z.exe" && "%temp%\7z.exe"

if exist "C:\Program Files\7-Zip\7z.exe" goto unzip


:unzip

cd "C:\Program Files\7-Zip\"
7z x %temp%\ATR.zip -oC:\Windows\ATR

if exist "%temp%\ATR.zip" del /F /Q "%temp%\ATR.zip" && rmdir /S /Q "%temp%\ATR.zip"
goto start

:start
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo.
echo.
echo     [1] Post-Install
echo.
echo     [2] Programs ^& Games
echo.
echo     [3] Tweaking
echo.
echo.
echo.
echo.
echo.
ECHO.
ECHO.
ECHO.
ECHO.
ECHO.

set /p menu=: 

if "%menu%"=="1" goto 1
if "%menu%"=="2" goto 2
if "%menu%"=="3" goto 3



:: ---------------------------------------------------------------------------------
:: ---------------------------------------------------------------------------------
:: ---------------------------------------------------------------------------------
:: ---------------------------------------------------------------------------------
:: ---------------------------------------------------------------------------------
:: ---------------------------------------------------------------------------------


:1

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Installing Firefox...
echo.

if exist "C:\Program Files\Mozilla Firefox" goto f2
if not exist "C:\Program Files\Mozilla Firefox" goto f1

:f1
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
start /w "" "C:\Windows\ATR\Firefox.exe" /s /w
echo.
goto f3


:f2
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Firefox Detected! Aborting...
echo.
echo.
timeout /t 1 /nobreak >nul
cls
goto f3

:f3
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Installing Timer Resolution...
cd C:\Windows\ATR\
copy SetTimerResolutionService.exe C:\Windows

cd C:\Windows\
SetTimerResolutionService -install
echo.
echo Ready!
echo.
echo.
echo.
echo.
timeout /t 1 /nobreak >nul


:: DRIVERS


cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo                                   Select your GPU
echo     [1] NVIDIA
echo     [2] AMD
echo                                                                    [0] Exit
echo.

set /p menu=: 

if "%menu%"=="1" goto N
if "%menu%"=="2" goto A
if "%menu%"=="0" goto exit


:N
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Opening NvCleanstall 1.16.0

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest "https://cdn.discordapp.com/attachments/913116249133838406/1133928426852601888/NVCleanstall_1.16.0.exe" -OutFile "%temp%\NvCleanstall_1.16.0.exe" && "%temp%\NvCleanstall_1.16.0.exe"

echo.
echo.
echo.
echo.
echo Once the driver is installed, press any key to continue.
pause>nul

CHOICE /C YN /M "ONLY for NVME SSD !!! - Install a Modded Driver?"
IF %ERRORLEVEL% EQU 1 (
cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\NVME.rar -oC:\Users\%USERNAME%\Desktop\NVME
start C:\Users\%USERNAME%\Desktop\NVME

copy C:\Windows\ATR\NVME-Guide.txt C:\Users\%USERNAME%\Desktop\NVME
start "" "devmgmt.msc"
cls
exit)

cls
echo Press any key to restart
pause>nul

shutdown -r -t 0
pause
exit



:A
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Downloading W10 Drivers...
echo.
start https://github.com/Pablerso/AMD-Drivers-Modded/releases/download/AMD/AMD.20.4.2.MODDED.BY.PABLERSO.zip
echo.
echo.
echo.
echo.
echo Press any key once is downloaded
pause>nul

cd "C:\Program Files\7-Zip\"
7z x C:\Users\%USERNAME%\Downloads\AMD.20.4.2.MODDED.BY.PABLERSO.zip -oC:\Users\%USERNAME%\Desktop\AMD
if exist "C:\Users\%USERNAME%\Downloads\AMD.20.4.2.MODDED.BY.PABLERSO.zip" del /F /Q "C:\Users\%USERNAME%\Downloads\AMD.20.4.2.MODDED.BY.PABLERSO.zip" && rmdir /S /Q "C:\Users\%USERNAME%\Downloads\AMD.20.4.2.MODDED.BY.PABLERSO.zip"

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Opening Device Manager...
start devmgmt.msc
echo.
timeout /t 3 /nobreak >nul
echo 1- Select your Display Driver
echo.
timeout /t 1 /nobreak >nul
echo 2- Update it with the .inf file 
echo.
echo.
echo.
echo Once the driver is installed, press any key to continue.
pause>nul

CHOICE /C YN /M "ONLY for NVME SSD !!! - Install a Modded Driver?"
IF %ERRORLEVEL% EQU 1 (
cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\NVME.rar -oC:\Users\%USERNAME%\Desktop\NVME
start C:\Users\%USERNAME%\Desktop\NVME

copy C:\Windows\ATR\NVME-Guide.txt C:\Users\%USERNAME%\Desktop\NVME
cls
exit)
cls
echo Press any key to restart
pause>nul

shutdown -r -t 0
pause
exit



:: PROGRAMS AND GAMES MENU

:2

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo                   Install ^& tweak it
echo.
echo     [0] Discord
echo     [1] OBS
echo     [2] Spotify
echo.
echo     [3] VALORANT
echo     [4] CS2 ^& STEAM
echo     [5] FORTNITE
echo.
echo     [6] Logitech Mouse
echo     [7] Razer Mouse
echo.
echo     [8] ACTIVATE WINDOWS
echo.                                                               [9] Back
echo.
set /p menu=: 

if "%menu%"=="0" goto Discord
if "%menu%"=="1" goto Obs
if "%menu%"=="2" goto Spfy
if "%menu%"=="3" goto Val
if "%menu%"=="4" goto CS
if "%menu%"=="5" goto Fort
if "%menu%"=="6" goto Log
if "%menu%"=="7" goto Raz
if "%menu%"=="9" goto Start
goto 9


:Discord
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Downloading Discord...

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest 'https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable"&"platform=win"&"arch=x86' -OutFile "%temp%\DiscordSetupWEB.exe" && "%temp%\DiscordSetupWEB.exe"
echo.
echo.
echo Please set-up your settings and press a key to continue...
echo.
echo.
pause>nul

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Debloating Discord...
echo.
REG DELETE HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Discord /f
echo.
start /w "" "C:\Windows\ATR\Discord.bat" /s /w
echo.
echo Ready!
echo.
echo.
echo.
echo.
echo Press any key...
pause>nul
REG DELETE HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v Discord /f
goto 2


:Obs
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting OBS Bat...
start /w "" "C:\Windows\ATR\OBS.bat" /s /w
echo.
echo Ready!
echo.
timeout /t 3 /nobreak >nul
goto 2


:Val

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Downloading Valorant...
%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest "https://valorant.secure.dyn.riotcdn.net/channels/public/x/installer/current/live.live.eu.exe" -OutFile "%temp%\ValorantInstaller.exe" && "%temp%\ValorantInstaller.exe"
echo.

cls 
type C:\Windows\ATR\logo.txt
echo.
echo.
echo WAIT 25% DOWNLOAD.
echo.
echo.
echo.
echo.
echo Press any key to continue
pause>nul


type C:\Windows\ATR\logo.txt
echo.
echo.
echo TWEAKING VALORANT...
@echo on

sc config vgc start= auto
sc start vgc

sc config vgk start= system
sc start vgk

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationAuditOptions" /t REG_BINARY /d "222222222222222222222222222222222222222222222222" /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "MitigationOptions" /t REG_BINARY /d "232222222223222222222222222222222222222222222222" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Version" /t REG_SZ /d "1.0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Application Name" /t REG_SZ /d "valorant.exe" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Protocol" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Local Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Local IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Remote Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Remote IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "DSCP Value" /t REG_SZ /d "46" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Throttle Rate" /t REG_SZ /d "-1" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Version" /t REG_SZ /d "1.0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Application Name" /t REG_SZ /d "VALORANT-Win64-Shipping.exe" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Protocol" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Local Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Local IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Remote Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Remote IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "DSCP Value" /t REG_SZ /d "46" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\VALORANT" /v "Throttle Rate" /t REG_SZ /d "-1" /f



Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Version" /t REG_SZ /d "1.0" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Application Name" /t REG_SZ /d "VALORANT-Win64-Shipping.exe" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Protocol" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Local Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Local IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Remote Port" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Remote IP" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "DSCP Value" /t REG_SZ /d "46" /f
Reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS\Valorant" /v "Throttle Rate" /t REG_SZ /d "-1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientCrashHandler.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientCrashHandler.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientCrashHandler.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientCrashHandler.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientCrashHandler.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUx.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUx.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUx.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUx.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUx.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUxRender.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUxRender.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUxRender.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUxRender.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RiotClientUxRender.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant-win64-shipping.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant-win64-shipping.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\valorant.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgc.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgtray.exe" /v "MitigationOptions" /t REG_BINARY /d "030000000003000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgtray.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "000000000000000000000000000000000000000000000000" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgtray.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgtray.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vgtray.exe\PerfOptions" /v "PagePriority" /t REG_DWORD /d "2" /f

@echo off

cls
type C:\Windows\ATR\logo.txt
echo.
CHOICE /C YN /M "Do you want to move Valorant from another disk?"
IF %ERRORLEVEL% EQU 1 (
echo Please, Close the client.
timeout /t 3 /nobreak >nul
cls
echo Opening folder with files to move...
timeout /t 2 /nobreak >nul
start C:\Windows\ATR\Val\
echo.
echo.
cls
echo Now, Copy-paste the Valorant folder and ready!
echo.
pause
cls)
cls
goto 2

:Fort
cls
type C:\Windows\ATR\logo.txt
echo.
cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\Fortnite.zip -oC:\Users\%USERNAME%\Desktop\FortniteTweaks

start C:\Users\%USERNAME%\Desktop\FortniteTweaks
CLS)
timeout /t 2 /nobreak >nul
goto 2


:CS
cls
type C:\Windows\ATR\logo.txt
echo.
echo Applying Steam Tweaks... (No needs to be installed)
echo.
echo.
start /w "" "C:\Windows\ATR\Steam.bat" /s /w
echo.
echo.
echo.
echo.
cls
CHOICE /C YN /M "You are going to play CS2?"
IF %ERRORLEVEL% EQU 1 (

cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\CS.zip -oC:\Users\%USERNAME%\Desktop\CS2

start C:\Users\%USERNAME%\Desktop\CS2
CLS)
timeout /t 2 /nobreak >nul
goto 2

:Win
cls
type C:\Windows\ATR\logo.txt
start C:\Windows\ATR\WinActivators.bat
goto 2

:Log
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Downloading Logitech OnBoard...
echo.
echo If dont work, re-enable disabled HID devices.

timeout /t 2 /nobreak >nul

%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-WebRequest "https://github.com/gzmatte/trash/releases/download/c/OnboardMemoryManager.exe" -OutFile "C:\Users\%USERNAME%\Desktop\logitech.exe" && "C:\Users\%USERNAME%\Desktop\logitech.exe"
goto 2


:Raz
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Moving to desktop...
echo.
echo Use with razer synapse installed.
timeout /t 2 /nobreak >nul
echo.
cd C:\Windows\ATR\
copy Razer_Synapse_Debloat.bat C:\Users\%USERNAME%\Desktop
goto 2


:Spfy
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting SpotX
echo.
start C:\Windows\ATR\Spotify.bat
echo.
echo Press any key to debloat.
pause>nul

start C:\Windows\ATR\DebloatSpotify.bat
pause
goto 2


:: TWEAKING SECTION
:3

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& 'C:\Windows\ATR\USB.ps1'"
echo.
Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{8A69D345-D564-463c-AFF1-A69D9E530F96}" /f
Reg.exe delete "HKLM\Software\Microsoft\Active Setup\Installed Components\{AFE6A462-C574-4B8A-AF43-4CC60DF4563B}" /f
echo.
taskkill /f /im maintenanceservice.exe >nul 2>&1
taskkill /f /im uninstall.exe >nul 2>&1
net stop MozillaMaintenance >nul 2>&1
sc delete MozillaMaintenance >nul 2>&1
rmdir "C:\Program Files (x86)\Mozilla Maintenance Service" /s /q >nul 2>&1
del /f "C:\Program Files\Mozilla Firefox\maintenanceservice_installer.exe" >nul 2>&1
del /f "C:\Program Files\Mozilla Firefox\maintenanceservice.exe" >nul 2>&1
del /f "C:\Program Files\Mozilla Firefox\updater.exe" >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "DisableAppUpdate" /t REG_DWORD /d "1" /f
cls

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo                                Select GPU to Tweak
echo     [1] NVIDIA
echo     [2] AMD
echo                                                                    [0] Exit
echo.

set /p menu=: 

if "%menu%"=="1" goto NT
if "%menu%"=="2" goto AT
if "%menu%"=="0" goto Exit



:NT

Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR" /v "MUIVerb" /t REG_SZ /d "Nvidia Service" /f
Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR" /v "Position" /t REG_SZ /d "Mid" /f
Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR" /v "SubCommands" /t REG_SZ /d "" /f
Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR\Shell\01menu" /v "MUIVerb" /t REG_SZ /d "On" /f
Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR\Shell\01menu\command" /ve /t REG_SZ /d "cmd.exe /c sc config NVDisplay.ContainerLocalSystem start= auto & net start NVDisplay.ContainerLocalSystem" /f
Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR\Shell\02menu" /v "MUIVerb" /t REG_SZ /d "Off" /f
Reg.exe add "HKCR\DesktopBackground\Shell\NvidiaPanelXR\Shell\02menu\command" /ve /t REG_SZ /d "cmd.exe /c sc config NVDisplay.ContainerLocalSystem start= disabled & net stop NVDisplay.ContainerLocalSystem" /f


cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting MSI Utility...
start /w "" "C:\Windows\ATR\MSI.exe" /s /w
echo.
echo Ready!
echo.
pause

cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\NIPS.zip -oC:\Users\%USERNAME%\Desktop\NIPS

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting NvidiaProfileInspector...
echo.
echo Please, move a NIP to the program.
echo.
timeout /t 3 /nobreak >nul
start /w "" "C:\Windows\ATR\nvidiaProfileInspector.exe" /s /w
echo.
echo.
echo.
echo Ready!

pause


cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting CRU...
timeout /t 2 /nobreak >nul
echo.
start /w "" "C:\Windows\ATR\CRU.exe" /s /w
echo.
echo.
pause
echo Ready!
goto 4


:AT
cls
type C:\Windows\ATR\logo.txt
echo.
echo.

cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\AMD.zip -o"C:\Users\%USERNAME%\Desktop\AMD"

echo.
echo Ready!
echo.
pause


cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting MSI Utility...
start /w "" "C:\Windows\ATR\MSI.exe" /s /w
echo.
echo Ready!
echo.
pause

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting CRU...
timeout /t 2 /nobreak >nul
echo.
start /w "" "C:\Windows\ATR\CRU.exe" /s /w
echo.
echo.
pause
echo Ready!

goto 4

:4

:: TWEAKING

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting Settings...
echo.
timeout /t 3 /nobreak >nul
start ms-settings:
pause


:: 7   -  Control Settings

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting Control...
timeout /t 3 /nobreak >nul
echo.
start control
echo.
echo.
pause


:: 8  -  Device Manager Settings

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting Device Manager...
timeout /t 3 /nobreak >nul
echo.
start /w "" "devmgmt.msc" /s /w
echo.
echo.
pause

cls

type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting AutoRuns...
timeout /t 2 /nobreak >nul
echo.
start /w "" "C:\Windows\ATR\Autoruns.exe"
echo.
pause


::  Device Cleanup
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Starting Device Cleanup...
timeout /t 2 /nobreak >nul
echo.
start /w "" "C:\Windows\ATR\DeviceCleanup.exe"
echo.
pause



cls
type C:\Windows\ATR\logo.txt
echo.
echo.
:: 14 - Disk Check
echo.
echo Select your Disk, Properties, Unmark Index files.
echo.
echo Also, Disable Write Cache.
start shell:mycomputerfolder
echo.
pause





:: 13 Serviwin
cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Use Serviwin.

start /w "" "C:\Windows\ATR\Serviwin.exe"
pause

cls
type C:\Windows\ATR\logo.txt
echo.
echo Optional Tweaks in desktop.

timeout /t 3 /nobreak >nul

cd "C:\Program Files\7-Zip\"
7z x C:\Windows\ATR\add.zip -o"C:\Users\%USERNAME%\Desktop\Tweaking Folder"

cls
type C:\Windows\ATR\logo.txt
echo.
echo.
echo Cleaning temps...

rd %temp% /s /q

md %temp%

rd temp /s /q

md temp

rd C:\$Recycle.Bin /s /q

md C:\$Recycle.Bin

start C:\Windows\TEMP



cls
echo All Ready! Closing...
timeout /t 5 /nobreak >nul
goto exit

:exit
exit

