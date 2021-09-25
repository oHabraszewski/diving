const username = localStorage.getItem("username") //Both username and unique_key are saved in localStorage.
const key = localStorage.getItem("unique_key")

const CREATE_EVENT_REQUEST = {
    "event":"create_world",
    "payload":{
        "username": username,
        "unique_key": key,
        "world": {
            "name": "name",
            "seed": "213921391203921", //Seed is not required, if missing, randomly generated
            "data": {} //If needed, some world data can be injected during world creation
        }
    }
}

const READ_EVENT_REQUEST = {
    "event":"read_world",
    "payload":{
        "username": username,
        "unique_key": key,
        "world": {
            "name": "name"
        }
    }
}

const WRITE_EVENT_REQUEST = {
    "event":"write_world",
    "payload":{
        "username": username,
        "unique_key": key,
        "world": {
            "name": "name",
            "data": {}
        }
    }
}

const DELETE_EVENT_REQUEST = {
    "event":"delete_world",
    "payload":{
        "username": username,
        "unique_key": key,
        "world": {
            "name": "name"
        }
    }
}