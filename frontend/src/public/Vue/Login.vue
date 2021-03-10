<template>
    <div class="login">
        <div class="newlogin">
            <h1>Diving</h1>
            <form>
                <Input title="Type your username" placeholder="Username"></Input>
                <Input title="Type your password" placeholder="Password" type="password"></Input>
                <Button text="Play" destination="/game"></Button>
            </form>
            <Link text="Don't have an account?" destination="/register"></Link>
        </div>
    </div>
</template>
<script>
    import Button from './Button.vue'
    import Input from './Input.vue'
    import Link from './Link.vue'

    export default {
        props: ['nickname'],
        data() {
            return {
                world_id: 'FabulousTigerWritingNervously'
            }
        },
        components: {
            Button,
            Input,
            Link
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
