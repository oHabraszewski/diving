<template>
    <div class="input-container">
        <input :type=type :title=title class="input" :placeholder=placeholder :minlength=minim :maxlength=maxim v-model="value" required/><br>
    </div>
</template>
<script>
    export default {
        props: ["placeholder", "title", "value", "type", "minim", "maxim"],
        watch: {
            value(o, n){
                this.$emit("valueChange", this.value)
            }
        }
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/variables';
    
    @keyframes focusy {
        0% { border-radius: 12px;} 
        50% { border-radius: 24px; }
        100% { border-radius: 12px;} 
    }
    .input {
        background: rgba($color: $dark-back, $alpha: 0.6);
        margin: 2px;
        border-radius: 12px;
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
