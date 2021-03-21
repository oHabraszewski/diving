<template>
    <div class="login">
        <div class="newlogin">
            <h1>Diving</h1>
            <form @submit="sendData" action="javascript:void(0);">
                <Input @valueChange="setUsername" title="Type your username" placeholder="Username" maxim="24" :value="username"></Input>
                <Input @valueChange="setPassword" title="Type your password" placeholder="Password" type="password" maxim="32" :value="password"></Input>
                <Button text="Play"></Button>
                <p v-if="!success">{{error}}</p>
                <Check @valueChange="setRemember" text="Remember me" id="remember" :value="remember"></Check>
            </form>
            <Button text="Play without login" destination="/game"></Button> <!--TODO: remove on production-->
            <Link text="Don't have an account?" destination="/register"></Link>
        </div>
    </div>
</template>
<script>
    import axios from 'axios'
    import Button from './Button.vue'
    import Input from './Input.vue'
    import Link from './Link.vue'
    import Check from './Check.vue'

    export default {
        data() {
            return {
                username: "",
                password: "",
                remember: false,
                success: false,
                error: "",
            }
        },
        mounted(){
            const username = localStorage.getItem("username")
            const token = localStorage.getItem("token")
            if(username && token){
                this.username = username;
                this.password = "password";
                this.remember = true;
            }
        },
        methods: {
            setUsername(value){
                this.username = value;
            },
            setPassword(value){
                 this.password = value;
            },
            setRemember(value){
                 this.remember = value;
            },
            changeDirectory(dir){
                location.href = dir;
            },
            clearLocalStorage(){
                localStorage.removeItem("username")
                localStorage.removeItem("token")
            },
            sendData(){
                const username = localStorage.getItem("username")
                const token = localStorage.getItem("token")

                if(username && token){
                    console.debug("There is saved token, going directly into a game")
                    if(!this.remember){
                        this.clearLocalStorage()
                    }
                    this.changeDirectory("/game")
                }else{
                    console.debug("There is no token, connecting with server...")
                    axios.post("http://localhost:8080/loginValidation", {  //TODO: set right URL on production
                        username: this.username,
                        password: this.password,
                    }).then(response=>{
                        if(response.data.success){
                            
                            this.success = true

                            let storage;

                            if(this.remember){
                                storage = localStorage;
                            }
                            else{ 
                                storage = sessionStorage;
                                this.clearLocalStorage()
                            }

                            storage.setItem("username", this.username)
                            storage.setItem("token", response.data.token)

                            console.debug("Username: " + storage.getItem("username"))
                            console.debug("Token: " + storage.getItem("token"))

                            this.changeDirectory("/game")
                        }else{
                            this.success = false
                            this.error = response.data.error

                            console.warn("Login data validation has not been completed successfully! Read description below for details")
                            console.warn(response)
                        }
                    }).catch(error=>{
                        this.success = false
                        this.error = error

                        console.error("An error occured while trying connecting with a server, see description for more details: " + error)
                    })
                }
            }
        },
        components: {
            Button,
            Input,
            Link,
            Check
        }
    }
</script>
<style lang="scss" scoped>
    @import '../scss/variables';
    .login {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px;
    }
</style>
