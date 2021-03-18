<template>
    <div>
        <label class="checkLabel" :for=id>{{text}}</label><input type="checkbox" :id=id class="check" v-model="value">
    </div>
</template>
<script>
    export default {
        props: ['text', 'id', 'value'],
        methods: {
        },
        watch: {
            value(o, n){
                this.$emit("valueChange", this.value)
            }
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
