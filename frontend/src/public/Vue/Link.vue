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
    // .link {
    //     position: absolute;
    //     left: 175px;
    //     transform: translate(-50%, 0%);
    //     background: rgba($color: #367169, $alpha: 0.6);
    //     margin: 2px;
    //     border-radius: 12px;
    //     border: solid #103131 3px;
    //     width: 350px;
    //     height: 56px;
    //     padding: 0 3px 0 3px;
    // }
    .link:hover {
        cursor: pointer;
    }
    // .button:focus{
    //     animation: squeeze 0.4s ease-in-out;
    //     animation-iteration-count: 1;
        
    // } 
</style>
