import "./public/scss/main.scss"

import * as Vue from "vue"
import Technical from "./public/vue/Technical.vue"

const App = {
    components: {
        Technical
    }
}
  
Vue.createApp(App).mount('#app')