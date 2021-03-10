<template>
    <div class="register">
        <h1>Register</h1>
        <form v-if="!success" @submit="validateData" action="javascript:void(0);">
            <Input @valueChange="setUsername" title="Username" placeholder="Username" maxim="24"></Input>
            <Input @valueChange="setPassword" type="password" title="Password" placeholder="Password" minim="8" maxim="32"></Input>
            <Input @valueChange="setEmail" type="email" title="Email" placeholder="Email"></Input>
            <p v-if="!success">{{error}}</p>
            <Button text="Sign up"></Button>
        </form>
    </div>
</template>
<script>
    import Button from './Button.vue'
    import Input from './Input.vue'
    import axios from 'axios'

    export default {
        components: {
            Button,
            Input
        },
        data(){
            return {
                username: "",
                password: "",
                email: "",
                errored: false,
                error: ""
            }
        },
        methods: {
            setUsername(value){
                this.username=value
            },
            setPassword(value){
                this.password=value
            },
            setEmail(value){
                this.email=value
            },
            validateData(){
                this.sendData()
            },
            sendData(){
                axios.post("http://localhost:8080/registerValidation", {  //TODO: set right URL on production
                    username: this.username,
                    password: this.password,
                    email: this.email
                }).then(response=>{
                    if(response.data.success){

                    }else{

                    }
                    this.error = response.data.description
                    console.log(response)
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
    h1 {
        font-size: 75px;
        text-shadow: 3px 3px#266159;
        margin-bottom: 10px;
    }
    .register {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>