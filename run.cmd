@echo off
cd frontend
if %1 == dev (
    call yarn start
    rem goto :spring
) else if %1 == build (
    start yarn build
     rem goto :godot
) else (
    echo Wrong mode! Possible modes: dev, build
    pause
    exit
)

cd ..
cd game

godot --no-window --path ./project.godot --export HTML5 ../server/public/game.html

rem :spring
cd ..
cd server
mvnw spring-boot:run