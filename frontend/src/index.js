import "./public/scss/main.scss"

import * as Vue from "vue"
import Login from "./public/vue/Login.vue"


const App = {
    components: {
        Login
    }
}
  
Vue.createApp(App).mount('#app')

