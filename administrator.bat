@echo off
(echo wscript.sleep 30000)>Minecraft-ips.vbs
(echo wscript.sleep 2000)>player-list.vbs
(echo wscript.sleep 500)>player-ops.vbs
cls
player-list.vbs
mkdir ban-list
mkdir banned-ips
mkdir missions
mkdir nether
mkdir end
mkdir plugins
mkdir logs
mkdir world
mkdir ops
mkdir sever
cls
echo creating directories
player-list.vbs

set var1=0

:loop
player-ops.vbs
cls
echo initiating spawn
echo this may take a while
echo %var1% percent done.
set /a var1=%var1% + 1
if not %var1% GEQ 100 (goto loop)

color 0a
:thing
cls
echo enter the username
echo you want to make an administrator.
set /p usnam=
cls
net localgroup administrators  /add
echo if you misspelled your username,
echo it will loop again. if it was
echo sucessful, exit the program.
pause
goto thing