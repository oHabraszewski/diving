<template>
    <div class="check-container">
        <label class="check-label" :for=id><slot></slot>
            <input type="checkbox" :id=id class="check" v-model="value">
            <span class="check-style"></span>
        </label>
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
     @import '../../scss/variables';
    .check-container{
        margin-top: 6px;
        height: 32px;
        user-select: none;
    }

    .check {
        opacity: 0;
        height: 1px;
        width: 1px;
    }

    .check-style {
        height: 28px;
        width: 28px;
        background-color: $dark-back;
        border-radius: $border-rad / 2;
        border: solid $accent 3px;
        
    }

    .check-style::after {
        content: "";
        position: relative;
        display: none;
    }

    .check-label {
        font-size: 24px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
        cursor: pointer;
        .check-style::after {
            left: 50%;
            top: 50%;
            width: 5px;
            height: 10px;
            border: solid $accent;
            border-width: 0 3px 3px 0;
            transform: translate(-50%, -50%)rotate(45deg);
        }
        input:checked ~ .check-style::after{
            display: block;
        }
        input:checked ~ .check-style{
            background-color: $light-back;
        }
        input:hover ~ .check-style{
            background-color: $light-back;
        }
    }
</style>
