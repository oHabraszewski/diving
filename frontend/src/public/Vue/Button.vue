<template>
    <div>
        <a v-bind:href=destination><button class="button"> Play</button></a>
    </div>
</template>
<script>
    export default {
        props: ['text','destination']
    }
</script>
<style lang="scss" scoped>
    .button {
        margin: 2px;
        border-radius: 5px;
        border: solid #aaa 2px;
        background-color: #333335;
        width: 210px;
        height: 30px;
    }
    .button:hover {
        cursor: pointer;
    }
</style>
