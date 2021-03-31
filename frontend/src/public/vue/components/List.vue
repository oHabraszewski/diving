<template>
    <div class="list-container">
        Developers
        <ul>
            <element-vue v-for="item in items">{{item}}</element-vue>
        </ul>
        <br>
        of course it's not final
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
    
    
</style>
