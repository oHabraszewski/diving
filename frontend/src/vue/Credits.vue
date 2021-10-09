<template>
    <div class="credits center horizontal" >
        <h1>{{header}}</h1>
        <article-vue :key="credit.name" v-for="credit in credits">
            <h2>{{credit.name}}</h2>
            <list-vue :items="credit.list"></list-vue>
        </article-vue>
    </div>
</template>
<script>
    import ListVue from './components/List.vue'
    import ElementVue from './components/Element.vue'
    import ArticleVue from './components/Article.vue'

    import createLang from "../js/translate/createLang.js"

    export default {
        data() {
            return {
                header: createLang("credits").header,
                credits: createLang("credits").texts
            }
        },
        components: {
            ArticleVue,
            ElementVue,
            ListVue
        }
    }
</script>
<style lang="scss" scoped>
    .credits {
        width: 70vw;
        top: 5%;
    }
</style>
