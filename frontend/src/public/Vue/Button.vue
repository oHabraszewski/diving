<template>
    <div class="buttonContainer">
        <button v-on:click="changeDir" class="button">Play</button>
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
            width: 320px;
        } 
        50% { border-radius: 4px;
            width: 280px; 
        }
        100% { border-radius: 12px;
            width: 320px;
        } 
    } 
    .buttonContainer{
        width: 320px;
        height: 52px;
    }
    .button {
        position: absolute;
        left: 160px;
        transform: translate(-50%, 0%);
        background: rgba($color: #367169, $alpha: 0.6);
        margin: 2px;
        border-radius: 12px;
        border: solid #103131 3px;
        width: 320px;
        height: 52px;
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
