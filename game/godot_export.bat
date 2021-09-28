@echo off
:start
..\..\godot --no-window -w --path ./project.godot --export HTML5 ../server/src/main/resources/public/game.html
pause
goto :start