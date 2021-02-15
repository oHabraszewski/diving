import "./main.scss"

const button = document.getElementById("button")  // It's all for prototyping - checking if webpack is working correctly.

button.onclick = ()=>{
    button.style = "color: blue";
}