<template>
    <div class="register center horizontal-vertical">
        <h1>Register</h1>
        <form v-if="!success" @submit="validateData" action="javascript:void(0);">
            <input-vue @valueChange="setUsername" title="Type an username" placeholder="Username" maxim="24"></input-vue>
            <input-vue @valueChange="setPassword" type="password" title="Type a password" placeholder="Password" minim="8" maxim="32"></input-vue>
            <input-vue @valueChange="setEmail" type="email" title="Type your email" placeholder="Email" maxim="256"></input-vue>
            <p v-if="!success">{{error}}</p>
            <button-vue>Sign up</button-vue>
        </form>
        <div class="registered" v-if="success">
            Thank you for sign up to Diving game!
            Now you can login and jump into a game.

            <button-vue destination="./">Return to login</button-vue>
        </div>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'

    import connect from "../js/utils/connectAxios.js"
    import ConfigVars from "../js/utils/ConfigVars.js"


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
                const response = await connect(ConfigVars.HOSTNAME + "/registerValidation",{ 
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