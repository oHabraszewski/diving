@echo off
cd frontend
if %1 == dev (
    call yarn start
    goto :spring
) else if %1 == build (
    start yarn build
    goto :spring
) else (
    echo Wrong mode! Possible modes: dev, build
    pause
    exit
)

rem there needs to be a godot export to HTML script

:spring
cd ..
cd server
mvnw spring-boot:run