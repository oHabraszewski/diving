<template>
    <div class="input-container">
        <select name="language" v-model="value">
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
    @import '../../scss/variables';
    
    @keyframes focusy {
        0% { border-radius: $border-rad;} 
        50% { border-radius: 24px; }
        100% { border-radius: $border-rad;} 
    }
    .input {
        background: rgba($color: $dark-back, $alpha: 0.6);
        margin: 2px;
        border-radius: $border-rad;
        border: solid $accent 3px;
        width: 350px;
        height: 56px;
        padding: 0 10px 0 10px;
    }
    .input:focus{
        animation: focusy 1.25s ease-in-out;
        animation-iteration-count: infinite;
    }
    .input::placeholder {
        color: $tip;
        @-moz-document url-prefix() {
            opacity: 1;
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
