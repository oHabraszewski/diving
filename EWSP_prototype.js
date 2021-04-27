/*
----------------------------------------------------------------------------------------------------------------------------------------------------------

                                                        THIS FILE IS NOT A PART OF THE PROJECT ITSELF
                                                            IT'S ONLY FOR FEATURE PRESENTATION

----------------------------------------------------------------------------------------------------------------------------------------------------------
*/



// This file contains information and data about EWSP - Event-driven WebSocket Protocol
// It will be used to communicate between game client and Spring server to provide various data about game.
// EWSP is meant to be lightweight and easy-to-use replacement for socket.io. It can be supported by any WebSocket compatible client or server. Only the right message structure needs to be done.
//Event-driven protocols are especially useful for gamedev data transfer, where we are sending a lot different data to the same client

const EWSPPrototype = {
    event: "eventKey", //It can be whatever protocol's user wants
    header: {
        //Another various important data for proper protocol handling
    },
    payload: {
        //All data we are sending is inside this object
    }
}

//Also, as the JSON, which the EWSP uses as the protocol format (Don't mind red underline, it's JSON and we are at JS file, that's why)

{
    "event": "eventKey", 
    "header": {
    
    },
    "payload": {
       
    }
}

//It is recommended to create own API for handling EWSP's messages rather than doing it manually (by the raw JSON manipulation)