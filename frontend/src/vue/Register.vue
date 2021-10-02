<template>
    <div class="register center horizontal-vertical">
        <h1>{{lang.register}}</h1>
        <form v-if="!success" @submit="validateData" action="javascript:void(0);">
            <input-vue @valueChange="setUsername" :title="lang.username_tip" :placeholder="lang.username" maxim="24"></input-vue>
            <input-vue @valueChange="setPassword" type="password" :title="lang.password_tip" :placeholder="lang.password" minim="8" maxim="32"></input-vue>
            <input-vue @valueChange="setEmail" type="email" :title="lang.email_tip" :placeholder="lang.email" maxim="256"></input-vue>
            <p v-if="!success">{{error}}</p>
            <button-vue>{{lang.sign_up}}</button-vue>
        </form>
        <div class="registered" v-if="success">{{lang.success_1}}<br>{{lang.success_2}}<button-vue destination="./">{{lang.return}}</button-vue>
        </div>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'

    import connect from "../js/utils/connectAxios.js"
    import ConfigVars from "../js/utils/ConfigVars.js"
    import createLang from "../js/translate/createLang.js"


    export default {
        components: {
            ButtonVue,
            InputVue
        },
        data(){
            return {
                lang: createLang("register"),
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
                const response = await connect(ConfigVars.HOSTNAME + ConfigVars.API_PREFIX + "/rls/register",{ 
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