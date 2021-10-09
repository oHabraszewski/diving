<template>
    <div class="button-container">
        <button v-on:click="changeDir" class="button">
            <slot></slot>
        </button>
    </div>
</template>
<script>
    export default {
        props: ['destination'],
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
    @import '../../scss/variables';

    @keyframes squeeze {
        0% { 
            border-radius: $border-rad;
            width: 360px;
        } 
        50% { border-radius: 4px;
            width: 320px; 
        }
        100% { border-radius: $border-rad;
            width: 360px;
        } 
    } 
    .button-container{
        width: 360px;
        height: 60px;
    }
    .button {
        position: absolute;
        left: 180px;
        transform: translate(-50%, 0%);
        background: rgba($color: $light-back, $alpha: 0.6);
        margin: 2px;
        border-radius: $border-rad;
        border: solid $accent 3px;
        width: 360px;
        height: 60px;
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
