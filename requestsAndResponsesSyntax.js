// ---------------------------------------------------------------------------------------

//                                   REQUESTS SYNTAX

// ---------------------------------------------------------------------------------------

const username = localStorage.getItem("username") //Both username and unique_key are saved in localStorage.
const key = localStorage.getItem("unique_key")

//                                World Requests

const CREATE_EVENT_REQUEST = {
    "event":"create_world",
    "payload":{
        "username": username,
        "unique_key": key,
        "world": {
            "name": "name",
            "seed": 213921391203921, //Seed is not required, if missing, randomly generated
            "data": "{}" //If needed, some world data can be injected during world creation
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

//                                Scoreboard requests

const WRITE_RECORD_REQUEST = { //WRITE_RECORD event is used for both creating first-time record and updating record as well.
    "event": "write_record",
    "payload": {
        "username": username,
        "unique_key": key,
        "record": {
            "time": "MM:SS", //Time is sent in String formatted like "MM:SS" MM - minutes, SS - seconds
            "score": 43, //Score is sent in numerical type
        }
    }
}

const READ_RECORD_REQUEST = { //To read scoreboard's record or entire scoreboard unique_key is not redundant - board is public, so we don't have to authenticate
    "event": "read_record",
    "payload": {
        "username": username
    }
}

const READ_BOARD_REQUEST = {
    "event": "read_board"
}

// ---------------------------------------------------------------------------------------

//                                   RESPONSES SYNTAX

// ---------------------------------------------------------------------------------------

//Error codes are API-friendly way to transmit information about error.
//They allow for an easy implementation of the exception catching algorithm without a need to compare entire string of error message.
//On the server side, they are as easy as using a special enum with error codes, which is highly recommended if possible on the client side.

//IMPORTANT!!! Error codes are not always numbers (in future, they could have form of K3 or 3E for example), so it's not recommended to use numerical type to store them.

const ERROR_CODES = [ 
    "01", //There is no user with such a username.
    "06", //Authentication failed.
    "09", //Somehow there are 2 or more users with exactly the same username.

    "11", //There is no world with such a name.
    "12", //There is already a world with such a name.
    "15", //This user has achieved limit of worlds (10 worlds per user).
    "19", //Somehow there are 2 or more worlds with exactly the same name.

    "21", //This user does not have a record saved.

    "91", //There was problem during casting data. It might mean, that numerical data was sent as a string or there was another issue with incompatible data types.
]

//                                World Responses

const CREATE_EVENT_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"create_world",
        "payload":{
            "success": true,
            "world": {
                "name": "name", //World name provided in request.
                "seed": "213921391203921", //Seed provided in request or randomly generated one.
                "data": "{}" //Data provided in request or empty object.
            }
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"create_world",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem during world creation." //Text error message, useful e.g. for printing in console.err().
        }
    }
 
}

const READ_EVENT_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"read_world",
        "payload":{
            "success": true,
            "world": {
                "name": "name", //World name provided in request.
                "seed": "213921391203921", //Seed acquired from database.
                "data": "{}" //Data acquired from database.
            }
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"read_world",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem during reading world from database." //Text error message, useful e.g. for printing in console.err().
        }
    }
}

const WRITE_EVENT_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"write_world",
        "payload":{
            "success": true,
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"write_world",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem during writing world to database." //Text error message, useful e.g. for printing in console.err().
        }
    }
}

const DELETE_EVENT_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"delete_world",
        "payload":{
            "success": true,
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"delete_world",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem during deleting world from database." //Text error message, useful e.g. for printing in console.err().
        }
    }
}

//                                Scoreboard responses

const WRITE_RECORD_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"write_record",
        "payload":{
            "success": true,
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"write_record",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem" //Text error message, useful e.g. for printing in console.err().
        }
    }
}

const READ_RECORD_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"read_record",
        "payload":{
            "success": true,
            "record":{
                "username": "username",
                "time": "22:18",
                "score": 21,
                "position": 0, //Position is direct read from array lenght -> in order to get proper "position" it has to be incremented once.
            }
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"read_record",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem" //Text error message, useful e.g. for printing in console.err().
        }
    }
}

const READ_BOARD_RESPONSE = {
    if_success: { //Response given if operation has been executed successfully.
        "event":"read_board",
        "payload":{
            "success": true,
            "board":[
                {
                    "username": "username",
                    "time": "21:18",
                    "score": 34,
                },
                {
                    "username": "username2",
                    "time": "22:18",
                    "score": 34,
                },
                {
                    "username": "username2",
                    "time": "5:18",
                    "score": 15,
                },

                //...
            ]
        }
    },
    if_failure: { //Response given if operation has not been executed successfully and there was some problem.
        "event":"read_board",
        "payload":{
            "success": false,
            "ecode": "01", //For more details, see Error Codes.
            "error": "There was some problem" //Text error message, useful e.g. for printing in console.err().
        }
    }
}