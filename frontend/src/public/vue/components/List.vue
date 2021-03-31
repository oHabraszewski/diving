<template>
    <div class="list-container">
        Developers
        <ul>
            <Element v-for="item in items">{{item}}</Element>
        </ul>
        <br>
        of course it's not final
    </div>
</template>
<script>
    import Element from "./Element.vue"

    export default {
        props: ["items"],
        components: {
            Element
        }
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/variables';
    
    
</style>
