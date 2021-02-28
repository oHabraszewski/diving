@echo off
:start
..\..\godot --no-window -w --path ./project.godot --export HTML5 ../server/public/game.html
pause
goto :start