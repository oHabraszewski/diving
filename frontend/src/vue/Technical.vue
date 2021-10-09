<template>
    <div class="technical center horizontal" >
        <h1>{{header}}</h1>
        <article-vue :key="text" v-for="text in texts" :name=text.name>{{text.content}}</article-vue>
    </div>
</template>
<script>
    import ArticleVue from './components/Article.vue'

    import createLang from "../js/translate/createLang.js"

    export default {
        data() {
            return {
                header: createLang("technical").header,
                texts: createLang("technical").texts
            }
        },
        components: {
            ArticleVue,
        }
    }
</script>
<style lang="scss" scoped>
    .technical {
        width: 70vw;
        top: 10%;
    }
</style>
