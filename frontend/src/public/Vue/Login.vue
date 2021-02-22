<template>
    <div class="login">
        <!-- <p>Last played world: {{world_id}}</p> -->

        <!--<input class="input" v-model="nickname"/><br>-->
        <input class="input" v-model="world_id"/><br>
        <Button destination="/game"></Button>
    </div>
</template>
<script>
    import Button from './Button.vue'

    export default {
        props: ['nickname'],
        data() {
            return {
                world_id: 'FabulousTigerWritingNervously'
            }
        },
        components: {
            Button
        }
    }
</script>
<style lang="scss" scoped>
    .login {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
    .input {
        margin: 2px;
        border-radius: 5px;
        border: solid #aaa 2px;
        width: 200px;
        height: 30px;
        padding: 0 3px 0 3px;
    }
</style>
