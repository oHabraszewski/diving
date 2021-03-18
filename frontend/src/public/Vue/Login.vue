<template>
    <div class="login">
        <div class="newlogin">
            <h1>Diving</h1>
            <form @submit="sendData" action="javascript:void(0);">
                <Input @valueChange="setUsername" title="Type your username" placeholder="Username" maxim="24"></Input>
                <Input @valueChange="setPassword" title="Type your password" placeholder="Password" type="password" maxim="32"></Input>
                <Button text="Play"></Button>
                <p v-if="!success">{{error}}</p>
                <Check @valueChange="setRemember" text="Remember me" id="remember"></Check>
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
        components: {
            Button,
            Input,
            Link,
            Check
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
            sendData(){
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
                        }

                        storage.setItem("username", this.username)
                        storage.setItem("token", response.data.token)

                        console.debug("Username: " + storage.getItem("username"))
                        console.debug("Token: " + storage.getItem("token"))
                        
                        //location.href = "/game" //TODO: re-enable
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
