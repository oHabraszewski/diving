<template>
    <div class="login center horizontal-vertical" >
        <h1>Diving</h1>
        <form @submit="sendData" action="javascript:void(0);" autocomplete="off">
            <input-vue @valueChange="setUsername" title="Type your username" placeholder="Username" maxim="24" :value="username">Username</input-vue>
            <input-vue @valueChange="setPassword" title="Type your password" placeholder="Password" type="password" maxim="32" :value="password"></input-vue>
            <button-vue>Play</button-vue>
            <check-vue @valueChange="setRemember" id="remember" :value="remember">Remember me</check-vue>
        </form>
        <p v-if="!success">{{error}}</p>
        <button-vue destination="/game">Play without login</button-vue> <!--TODO: remove on production-->
        <link-vue destination="/register">Don't have an account?</link-vue>
        <link-vue destination="/credits">We made this game!</link-vue>
        <link-vue destination="/technical">Check how we made this game</link-vue>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'
    import LinkVue from './components/Link.vue'  
    import CheckVue from './components/Check.vue'

    import connect from "../js/utils/connectAxios.js"

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
            async sendData(){
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

                    let response = await connect("http://localhost:8080/api/rls/login", {  //TODO: set right URL on production
                        username: this.username,
                        password: this.password
                    })

                    this.success = response.data.success

                    if(this.success){
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
                        this.error = response.data.error

                        console.warn("Login data validation has not been completed successfully! Read description below for details")
                        console.warn(response)
                    }
                }
            }
        },
        components: {
            ButtonVue,
            InputVue,
            LinkVue,
            CheckVue
        }
    }
</script>
<style lang="scss" scoped>
   
</style>
