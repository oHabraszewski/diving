# Diving game

**Game created in Pałac Młodzieży for 5. Silesian Science Festival. It's simple game about diving in ocean and collecting treasures. It introduces scoreboard system for best five players and registration system with email verification algorithm, all managed by server and its database.**

**You can play the Diving here:**

[![Diving](https://the-diving.herokuapp.com/assets/favicon-48x48.png)](https://the-diving.herokuapp.com/)

## Languages
- Java
- GDScript (language similar to Python)
- HTML
- SCSS
- JS

## Technologies
- Godot
  - Game engine
- Spring
  - Java server framework
- VueJS
  - Web framework
- REST
  - API architecture
- Axios
- WebSocket
- Maven
- Webpack
- Git
- Yarn

## Project operating
If you want to experiment with the code on your own.

### Run project (development mode)

- Open CMD/Terminal/PowerShell at root directory of the project
- Type: ./run
- Press enter

#### OR
- In 3 different terminals run:
  - yarn serve (at /frontend)
  - mvnw spring-boot:run (at /server)
  - *path to godot.exe* --no-window -w --path ./project.godot --export HTML5 ../server/public/game.html (at /game)
  (For exporting in godot you need to download godot's export templates)

### Build project (production mode)

- Open CMD/Terminal/PowerShell at root directory of the project
- Type: ./run build
- Press enter

### Stop project

- Press ctrl+c
