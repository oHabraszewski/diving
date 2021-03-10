<template>
    <div class="login">
        <h1>Diving</h1>
        <Input title="Type world name" placeholder="World name" :default=world_id></Input>
        <Button text="Play" destination="/game"></Button>
    </div>
</template>
<script>
    import Button from './Button.vue'
    import Input from './Input.vue'

    export default {
        props: ['nickname'],
        data() {
            return {
                world_id: 'FabulousTigerWritingNervously'
            }
        },
        components: {
            Button,
            Input
        }
    }
</script>
<style lang="scss" scoped>
    h1 {
        font-size: 75px;
        text-shadow: 3px 3px#266159;
    }
    .login {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>
