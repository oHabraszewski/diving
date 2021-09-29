<template>
    <li>
        <div class="element-container">
            <p><slot></slot></p>
        </div>
    </li> 
</template>
<script>
    export default {
        props: [],
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/variables';
    p {
        font-size: 34px;
    }
</style>
