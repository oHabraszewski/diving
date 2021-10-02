import polish from "../../../assets/json/translate/polish.json"
import english from "../../../assets/json/translate/english.json"

function createLang(page){
    if(localStorage.getItem("lang") == undefined){
        localStorage.setItem("lang", "EN")
    }

    const lang = localStorage.getItem("lang")

    let langObj
    switch(lang){
        case "EN":
            langObj = english[page]
            break;
        case "PL":
            langObj = polish[page]
            break;
    }
    return langObj;
}

export default createLang;