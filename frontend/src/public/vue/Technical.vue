<template>
    <div class="technical center-container" >
        <h1>Technical</h1>
        <article-vue name="Client">{{texts.client}}</article-vue>
        <article-vue name="Game">{{texts.game}}</article-vue>
        <article-vue name="Server">{{texts.server}}</article-vue>
        <article-vue name="Data transfer">{{texts.data_transfer}}</article-vue>
    </div>
</template>
<script>
    import ArticleVue from './components/Article.vue'
    import InputVue from './components/Input.vue'
    import LinkVue from './components/Link.vue'  
    import CheckVue from './components/Check.vue'

    export default {
        data() {
            return {
                texts: { //TODO: Read from JSON
                    client: "Some nerdy stuff about client development.",
                    game: "Some nerdy stuff about game development.",
                    server: "Some nerdy stuff about server development.",
                    data_transfer: "Some nerdy stuff about data transfer solutions."
                }
            }
        },
        mounted(){
        },
        methods: {
            setUsername(value){
                this.username = value;
            },
        },
        components: {
            ArticleVue,
            InputVue,
            LinkVue,
            CheckVue
        }
    }
</script>
<style lang="scss" scoped>
    @import '../scss/variables';
</style>
