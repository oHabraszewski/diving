<template>
    <div class="technical center horizontal" >
        <h1>Technical</h1>
        <article-vue :key="text" v-for="text in texts" :name=text.name>{{text.content}}</article-vue>
    </div>
</template>
<script>
    import ArticleVue from './components/Article.vue'

    import content from '../../assets/json/technical.json'

    export default {
        data() {
            return {
                texts: content
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
