<template>
    <div class="login">
        <div class="newlogin">
            <h1>Diving</h1>
            <form @submit="sendData" action="javascript:void(0);">
                <Input @valueChange="setUsername" title="Type your username" placeholder="Username" maxim="24"></Input>
                <Input @valueChange="setPassword" title="Type your password" placeholder="Password" type="password" maxim="32"></Input>
                <Button text="Play"></Button>
                <p v-if="!success">{{error}}</p>
                <Check text="Remember me" id="remember"></Check>
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
            sendData(){
                axios.post("http://localhost:8080/loginValidation", {  //TODO: set right URL on production
                    username: this.username,
                    password: this.password,
                }).then(response=>{
                    if(response.data.success){
                        this.success = true
                        this.$cookies.set("sessionKey", response.data.session)
                        console.log(this.$cookies.get("sessionKey"))
                        //location.href = "/game" //TODO: re-enable
                    }else{
                        this.error = response.data.error
                        console.log(response)
                    }
                }).catch(error=>{
                    this.errored = true
                    this.error = error
                    console.log(error)
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
