<template>
    <div class="register center-container">
        <h1>Register</h1>
        <form v-if="!success" @submit="validateData" action="javascript:void(0);">
            <InputVue @valueChange="setUsername" title="Type an username" placeholder="Username" maxim="24"></InputVue>
            <InputVue @valueChange="setPassword" type="password" title="Type a password" placeholder="Password" minim="8" maxim="32"></InputVue>
            <InputVue @valueChange="setEmail" type="email" title="Type your email" placeholder="Email" maxim="256"></InputVue>
            <p v-if="!success">{{error}}</p>
            <ButtonVue>Sign up</ButtonVue>
        </form>
        <div class="registered" v-if="success">
            Thank you for sign up to Diving game!
            Now you can login and jump into a game.

            <ButtonVue destination="./">Return to login</ButtonVue>
        </div>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'

    import connect from "../js/utils/connectAxios.js"


    export default {
        components: {
            ButtonVue,
            InputVue
        },
        data(){
            return {
                username: "",
                password: "",
                email: "",
                error: "",
                success: false
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
            async sendData(){
                const response = await connect("http://localhost:8080/registerValidation",{  //TODO: set right URL on production
                    username: this.username,
                    password: this.password,
                    email: this.email
                })

                this.success = response.data.success;

                if(!this.success){
                        this.error = response.data.error

                        console.warn("Register data validation has not been completed successfully! Read description below for details")
                        console.warn(response)
                }
            }
        }
    }
</script>
<style lang="scss" scoped>
    @import '../scss/variables';
</style>