@echo off

if "%JAVA_HOME%"=="" (
echo JAVA_HOME is empty!!! Define it as your JDK/OpenJDK bin folder!
)


cd frontend

if not exist node_modules (
    call yarn
)
if %1 == dev (
    start yarn start
    rem goto :spring
) else if %1 == build (
    call yarn build
     rem goto :godot
) else (
    echo Wrong mode! Possible modes: dev, build
    pause
    exit
)


cd ..

if not exist server/public (
    mkdir server/public
)

cd game
timeout 5
rem TODO: try to disable GUI at godot export
godot --no-window --path ./project.godot --export HTML5 ../server/public/game.html

cd ..
cd server
mvnw spring-boot:run
cd..