<template>
    <div class="technical center-container" >
        <h1>Technical</h1>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'
    import LinkVue from './components/Link.vue'  
    import CheckVue from './components/Check.vue'

    export default {
        data() {
            return {
                username: "",
                password: "",
                remember: false,
                success: false,
                error: "",
            }
        },
        mounted(){
        },
        methods: {
            setUsername(value){
                this.username = value;
            },
        },
        components: {
            ButtonVue,
            InputVue,
            LinkVue,
            CheckVue
        }
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/variables';
</style>
