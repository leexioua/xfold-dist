@echo off
@echo set the encoding as utf-8
@chcp 65001

set regpath=%1

echo.
echo 打开注册表，跳转路径：
echo %regpath%
echo.
taskkill /F /IM regedit.exe >NUL 2>NUL
cmd /c reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /v "LastKey" /d %regpath% /f
start regedit.exe

rem pause