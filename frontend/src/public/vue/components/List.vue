<template>
    <div class="list-container">
        <ul>
            <element-vue v-for="item in items">{{item}}</element-vue>
        </ul>
    </div>
</template>
<script>
    import ElementVue from "./Element.vue"

    export default {
        props: ["items"],
        components: {
            ElementVue
        }
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/variables';
    .list-container ul {
        list-style: none;
    }
    
</style>
