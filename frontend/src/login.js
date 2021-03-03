import "./public/scss/main.scss"

import * as Vue from "vue"
import Vuex from 'vuex'
import Register from "./public/vue/Register.vue"


// Vue.use(Vuex)

// const store = new Vuex.Store({
//   state: {
//     username: "",
//     password: "",
//     email: ""
//   }
// })

const App = {
    components: {
        Register
    }
}
  
Vue.createApp(App).mount('#app')