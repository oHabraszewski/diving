<template>
    <div>
        <a id="github" class="social" href="https://github.com/oHabraszewski/sfn2021" :title="lang.github_tip" target="_blank"><img src="../../assets/img/github.png"></a>
        <a id="discord" class="social" href="https://discord.gg/B7V3cJrrd3" :title="lang.discord_tip" target="_blank"><img src="../../assets/img/discord_new.png"></a>
        <lang-select-vue @valueChange="updateLang" id="lang-select"></lang-select-vue>

        <div class="login center horizontal-vertical" >
            <h1>Diving</h1>
            <form @submit="sendData" action="javascript:void(0);" autocomplete="off">
                <input-vue @valueChange="setUsername" :title="lang.username_tip" :placeholder="lang.username" maxim="24" :value="username"></input-vue>
                <input-vue @valueChange="setPassword" :title="lang.password_tip" :placeholder="lang.password" type="password" maxim="32" :value="password"></input-vue>
                <button-vue>{{lang.play}}</button-vue>
                <check-vue @valueChange="setRemember" id="remember" :value="remember">{{lang.remember_me}}</check-vue>
            </form>
            <p v-if="!success">{{error}}</p>
            <button-vue destination="/game">Play without login</button-vue> <!--TODO: remove on production-->
            <link-vue destination="/register">{{lang.register}}</link-vue>
        </div>
        <div class="bottom">
            <link-vue destination="/credits">{{lang.credits}}</link-vue>
            <link-vue destination="/technical">{{lang.technical}}</link-vue>
        </div>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'
    import LinkVue from './components/Link.vue'  
    import CheckVue from './components/Check.vue'
    import LangSelectVue from './components/LanguageSelect.vue'

    import connect from "../js/utils/connectAxios.js"
    import ConfigVars from "../js/utils/ConfigVars.js"
    import createLang from "../js/translate/createLang.js"

    export default {
        data() {
            return {
                lang: createLang("index"),
                username: "",
                password: "",
                remember: false,
                success: false,
                error: "",
            }
        },
        mounted(){
            const username = localStorage.getItem("username")
            const key = localStorage.getItem("unique_key")
            if(username && key){
                setUsername(username)
                setPassword("password")
                setRemember(true);
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
            updateLang(value){
                this.lang = createLang("index")
            },
            changeDirectory(dir){
                location.href = dir;
            },
            clearLocalStorage(){
                localStorage.removeItem("username")
                localStorage.removeItem("unique_key")
            },
            async sendData(){
                const username = localStorage.getItem("username")
                const key = localStorage.getItem("unique_key")

                if(username && key){
                    console.debug("There is saved key, going directly into a game")
                    if(!this.remember){
                        this.clearLocalStorage()
                    }
                    this.changeDirectory("/game")
                }else{
                    console.debug("There is no key, connecting with server...")

                    let response = await connect(ConfigVars.HOSTNAME + ConfigVars.API_PREFIX + "/rls/login", {
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
                            storage.setItem("unique_key", response.data.token)

                            console.debug("Username: " + storage.getItem("username"))
                            console.debug("Key: " + storage.getItem("unique_key"))

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
            CheckVue,
            LangSelectVue
        }
    }
</script>
<style lang="scss" scoped>
   .social{
        position: absolute;
        left: 8px;
        width: 80px;
        height: 80px;
        img{
            width: 80px;
            height: 80px;
        }
   }
   #github{
       top: 8px;
   }
   #discord{
       top: 104px;
   }
   #lang-select{
       position:absolute;
       top: 8px;
       right: 8px;
   }
   .bottom {
        position: absolute;
        display: flex;
        flex-direction: row;
        bottom: 8px;
        left: 8px;
        div {
            margin: 0px 16px 4px 4px;
        }
   }
</style>
