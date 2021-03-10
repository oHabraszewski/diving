<template>
    <div>
        <a class="link" v-on:click="changeDir">{{text}}</a>
    </div>
</template>
<script>
    export default {
        props: ['text','destination'],
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
    // .buttonContainer{
    //     width: 350px;
    //     height: 56px;
    // }
    .link {
        font-size: 24px;
    }
    .link:hover {
        cursor: pointer;
    }
    // .button:focus{
    //     animation: squeeze 0.4s ease-in-out;
    //     animation-iteration-count: 1;
        
    // } 
</style>
