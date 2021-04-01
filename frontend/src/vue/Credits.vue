<template>
    <div class="credits center horizontal" >
        <h1>Credits</h1>
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

    import content from '../../assets/json/credits.json'

    export default {
        data() {
            return {
                credits: content
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
        width: 60vw;
        top: 10%;
    }
</style>
