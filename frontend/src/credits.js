import "./scss/main.scss"

import * as Vue from "vue"
import Credits from "./vue/Credits.vue"

const App = {
    components: {
        Credits
    }
}
  
Vue.createApp(App).mount('#app')