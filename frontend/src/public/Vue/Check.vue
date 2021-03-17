<template>
    <div>
        <label class="checkLabel" :for=id>{{text}}</label><input type="checkbox" :id=id class="check">
    </div>
</template>
<script>
    export default {
        props: ['text', 'id'],
        methods: {
        }
    }
</script>
<style lang="scss" scoped>
    .checkLabel {
        font-size: 24px;
    }
    .link:hover {
        cursor: pointer;
    }
</style>
