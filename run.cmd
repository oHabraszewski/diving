@echo off
set ERRORLEVEL=0

where npm >nul 2>nul
if %ERRORLEVEL% neq 0 (
echo npm not found! downloading it from https://nodejs.org/dist/v14.15.5/node-v14.15.5-x64.msi
curl https://nodejs.org/dist/v14.15.5/node-v14.15.5-x64.msi --output node-v14.15.5-x64.msi
node-v14.15.5-x64.msi
echo continue when you install node.js
pause
npm i -g yarn
del node-v14.15.5-x64.msi
)
set ERRORLEVEL=0
where yarn >nul 2>nul
if not %ERRORLEVEL%==0 (
echo yarn not found. this script will try to install it, but if it fails you must do it manually and add it to path!
echo BTW you need to install chocolatekey
choco install yarn
)

set ERRORLEVEL=0
..\godot --quiet -w --no-window -q >nul 2>nul
if ERRORLEVEL 9009 (
echo "godot not found! This script will try to install it, but if it fails install it from https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v3.2.3-stable_win64.exe.zip, unzip, rename file to godot.exe"
echo This script needs to install 7-zip, it will donload and start installer automaticaly, just click install.
pause
curl https://www.7-zip.org/a/7z1900-x64.exe --output 7zip.exe
7zip.exe
echo continue when 7zip is installed
pause
del 7zip.exe
echo Now script will download godot...
curl https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v3.2.3-stable_win64.exe.zip --output godot.zip
"%ProgramFiles%/7-zip/7z.exe" e godot.zip
del godot.zip
rename Godot_v3.2.3-stable_win64.exe godot.exe
move godot.exe ..
echo Godot is downloaded. Re run script now.
pause
goto :exit
)

cd frontend

if not exist node_modules (
    call yarn
)
if "%1" == "dev" (
    start yarn start
    rem goto :spring
) else if "%1" == "build" (
    call yarn build
     rem goto :godot
) else (
    echo Wrong mode! Possible modes: dev, build
    pause
    goto :exit
)


if not "%JAVA_HOME%"=="" (
cd ..

if not exist server/public (
    mkdir server/public
)

cd game
timeout 5
start godot_export.bat
cd ..
cd server
mvnw spring-boot:run
cd..
) else (
echo JAVA_HOME is empty!!! Define it as your JDK/OpenJDK home folder!
pause
)
:exit