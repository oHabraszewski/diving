import "./scss/main.scss"

import * as Vue from "vue"
import Vuex from 'vuex'
import Register from "./vue/Register.vue"

const App = {
    components: {
        Register
    }
}
  
Vue.createApp(App).mount('#app')