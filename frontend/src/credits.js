import "./public/scss/main.scss"

import * as Vue from "vue"
import Credits from "./public/vue/Credits.vue"

const App = {
    components: {
        Credits
    }
}
  
Vue.createApp(App).mount('#app')