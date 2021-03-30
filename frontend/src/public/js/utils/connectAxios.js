import axios from 'axios'

async function connect(address, data){
    return new Promise((resolve)=>{
        axios.post(address, data).then(response=>{
                    resolve(response)
                }).catch(errored=>{
                    let response
                    response.success = false
                    response.error = errored
                    resolve(response)
                    console.error("An error occured while trying connecting with a server, see description for more details: " + errored)
                })
    })
}

export default connect