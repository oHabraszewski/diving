@echo off
where npm >nul 2>nul
if %ERRORLEVEL% neq 0 (
echo npm not found! downloading it from https://nodejs.org/dist/v14.15.5/node-v14.15.5-x64.msi
curl https://nodejs.org/dist/v14.15.5/node-v14.15.5-x64.msi --output node-v14.15.5-x64.msi
node-v14.15.5-x64.msi
echo continue when you install node.js
pause
npm i -g yarn
goto :installed
) else (
where yarn >nul 2>nul
if %ERRORLEVEL% neq 0 (
echo yarn not found! this script will try to install it. If it fails install it using "npm i -g yarn" and add it to the PATH
npm i -g yarn
pause
exit
)
)
where yarn >nul 2>nul
if %ERRORLEVEL% neq 0 (
echo yarn not found! this script will try to install it. If it fails install it using "npm i -g yarn" and add it to the PATH
npm i -g yarn
pause
exit
)
:installed
where godot >nul 2>nul
if %ERRORLEVEL% neq 0 (
rem TODO: download godot and do all of this shit with it
echo godot not found! install it from https://downloads.tuxfamily.org/godotengine/3.2.3/Godot_v3.2.3-stable_win64.exe.zip, unzip, rename file to "godot.exe" and add it to the PATH
pause
exit
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
    exit
)


if not "%JAVA_HOME%"=="" (
cd ..

if not exist server/public (
    mkdir server/public
)

cd game
timeout 5
godot --no-window -w --path ./project.godot --export HTML5 ../server/public/game.html

cd ..
cd server
mvnw spring-boot:run
cd..
) else (
echo JAVA_HOME is empty!!! Define it as your JDK/OpenJDK home folder!
pause
exit
)