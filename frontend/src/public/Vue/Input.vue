<template>
    <div class="inputContainer">
        <input :title=title class="input" :placeholder=placeholder v-model="default"/><br>
    </div>
</template>
<script>
    export default {
        props: ['placeholder', "title", "default"],
    }
</script>
<style lang="scss" scoped>
    @keyframes focusy {
        0% { border-radius: 12px;} 
        50% { border-radius: 24px; }
        100% { border-radius: 12px;} 
    }
    .input {
        background: rgba($color: #266159, $alpha: 0.6);
        margin: 2px;
        border-radius: 12px;
        border: solid #103131 3px;
        width: 320px;
        height: 52px;
        padding: 0 10px 0 10px;
    }
    .input:focus{
        animation: focusy 1.25s ease-in-out;
        animation-iteration-count: infinite;
    }
    .input::placeholder {
        color: #163636
    }
</style>
