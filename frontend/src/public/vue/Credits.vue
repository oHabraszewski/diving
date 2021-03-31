<template>
    <div class="credits center-container" >
        <h1>Credits</h1>
        <list-vue :items="items"></list-vue>
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'
    import LinkVue from './components/Link.vue'  
    import CheckVue from './components/Check.vue'
    import ListVue from './components/List.vue'

    export default {
        data() {
            return {
                items: [
                    "Oskar",
                    "Kamil",
                    "Aleksander",
                    "Jan"
                ]
            }
        },
        mounted(){
        },
        methods: {
            setUsername(value){
                this.username = value;
            }
        },
        components: {
            ButtonVue,
            InputVue,
            LinkVue,
            CheckVue,
            ListVue
        }
    }
</script>
<style lang="scss" scoped>
    @import '../scss/variables';
</style>
