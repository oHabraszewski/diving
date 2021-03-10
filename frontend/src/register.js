import "./public/scss/main.scss"

import * as Vue from "vue"
import Vuex from 'vuex'
import Register from "./public/vue/Register.vue"
import VueCookies from 'vue3-cookies'

const App = {
    components: {
        Register
    }
}
  
Vue.createApp(App).use(VueCookies, {
    expireTimes: "3M",
    path: "/",
    domain: "",
    secure: true,
    sameSite: "None"
}).mount('#app')