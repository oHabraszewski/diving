<template>
    <div class="credits center horizontal" >
        <h1>Credits</h1>
        <h2>Client development</h2>
        <list-vue :items="items"></list-vue>
        <br>
        <h2>Game development</h2>
        <list-vue :items="items"></list-vue>
        <br>
        <h2>Server development</h2>
        <list-vue :items="items"></list-vue>
        <br>
        of course it's not final
    </div>
</template>
<script>
    import ButtonVue from './components/Button.vue'
    import InputVue from './components/Input.vue'
    import LinkVue from './components/Link.vue'  
    import CheckVue from './components/Check.vue'
    import ListVue from './components/List.vue'

    import credits from '../../assets/json/credits.json'

    export default {
        data() {
            return {
                items: credits
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

    .credits {
        width: 60vw;
        top: 10%;
    }
</style>
