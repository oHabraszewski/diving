<template>
    <div class="buttonContainer">
        <button v-on:click="changeDir" class="button">{{text}}</button>
    </div>
</template>
<script>
    export default {
        props: ['text','destination'],
        methods: {
            changeDir(){
                setTimeout(()=>{
                    if(this.destination != undefined){
                        location.href = this.destination
                    }
                },300)
            }
        }
    }
</script>
<style lang="scss" scoped>
    @keyframes squeeze {
        0% { 
            border-radius: 12px;
            width: 350px;
        } 
        50% { border-radius: 4px;
            width: 310px; 
        }
        100% { border-radius: 12px;
            width: 350px;
        } 
    } 
    .buttonContainer{
        width: 350px;
        height: 56px;
    }
    .button {
        position: absolute;
        left: 175px;
        transform: translate(-50%, 0%);
        background: rgba($color: #367169, $alpha: 0.6);
        margin: 2px;
        border-radius: 12px;
        border: solid #103131 3px;
        width: 350px;
        height: 56px;
        padding: 0 3px 0 3px;
    }
    .button:hover {
        cursor: pointer;
    }
    .button:focus{
        animation: squeeze 0.4s ease-in-out;
        animation-iteration-count: 1;
        
    } 
</style>
