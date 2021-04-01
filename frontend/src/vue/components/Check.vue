<template>
    <div class="check-container">
        <label class="check-label" :for=id><slot></slot></label><input type="checkbox" :id=id class="check" v-model="value">
    </div>
</template>
<script>
    export default {
        props: ['id', 'value'],
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
    .check-container{
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 32px;
    }
    .check-label {
        font-size: 24px;
    }
    .check {
        height: 20px;
        width: 20px;
    }
</style>
