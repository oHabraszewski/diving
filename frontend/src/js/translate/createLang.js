import polish from "../../../assets/json/translate/polish.json"
import english from "../../../assets/json/translate/english.json"

function createLang(page){
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