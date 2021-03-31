<template>
    <div class="list-container">
        <ul>
            <li v-for="item in items">

            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        props: ["items"],
    }
</script>
<style lang="scss" scoped>
    @import '../scss/variables';
    
    
</style>
