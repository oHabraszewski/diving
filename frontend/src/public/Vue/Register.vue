<template>
    <div class="register">
        <h1>Register</h1>
        <Input @valueChange="setUsername" title="Username" placeholder="Username"></Input>
        <Input @valueChange="setPassword" type="password" title="Password" placeholder="Password"></Input>
        <Input @valueChange="setEmail" type="email" title="Email" placeholder="Email"></Input>
        <p>{{test}}</p>
        <Button @click="send"></Button>
    </div>
</template>
<script>
    import Button from './Button.vue'
    import Input from './Input.vue'
    import axios from 'axios'

    export default {
        components: {
            Button,
            Input
        },
        data(){
            return {
                test: "",
                username: "",
                password: "",
                email: ""
            }
        },
        methods: {
            setUsername(value){
                this.username=value
            },
            setPassword(value){
                this.password=value
            },
            setEmail(value){
                this.email=value
            },
            send(){
                this.test = this.username + this.password + this.email //Placeholder test function
            }
        }
    }
</script>
<style lang="scss" scoped>
    h1 {
        font-size: 75px;
        text-shadow: 3px 3px#266159;
        margin-bottom: 10px;
    }
    .register {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }
</style>