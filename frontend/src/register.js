import "./public/scss/main.scss"

import * as Vue from "vue"
import Vuex from 'vuex'
import Register from "./public/vue/Register.vue"

const App = {
    components: {
        Register
    }
}
  
Vue.createApp(App).mount('#app')