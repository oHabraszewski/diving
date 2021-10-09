<template>
    <div class="select-container">
        <select class="input select" name="language" v-model="value">
            <option value="EN">English</option>
            <option value="PL">Polski</option>
        </select>
    </div>
</template>
<script>
    export default {
        props: ["title", "value"],
        watch: {
            value(o, n){
                localStorage.setItem("lang", this.value)
                this.$emit("valueChange", this.value)
            }
        },
        mounted(){
            const lang = localStorage.getItem("lang")
            this.value = lang;
        }
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/main';
    @import '../../scss/variables';
    
    @keyframes focusy {
        0% { border-radius: $border-rad;} 
        50% { border-radius: 24px; }
        100% { border-radius: $border-rad;} 
    }

    .select {
        width: 160px;
        height: 52px;

        *{
            background-color: #4a7c92;
        }
    }

    .input:-moz-ui-invalid {
        box-shadow: none;
    }
    .show-button {
        position: absolute;
        right: 0px;
        width: 56px;
        height: 56px;
        background: rgba($color: $light-back, $alpha: 0.6);
        margin: 2px;
        border-radius: 0px 12px 12px 0px;
        border: solid $accent 3px;
        padding: 0 3px 0 3px;
    }
</style>
