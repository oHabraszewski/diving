<template>
    <div>
        <a class="link" v-on:click="changeDir"><slot></slot></a>
    </div>
</template>
<script>
    export default {
        props: ['destination'],
        methods: {
            changeDir(){
                if(this.destination != undefined){
                    location.href = this.destination
                }
            }
        }
    }
</script>
<style lang="scss" scoped>
    .link {
        font-size: 24px;
        text-decoration-line: underline;
    }
    .link:hover {
        cursor: pointer;
    }
</style>
