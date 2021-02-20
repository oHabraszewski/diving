<template>
    <div>
        <p>Last played world: {{world_id}}</p>

        <input class="input" v-model="nickname"/><br>
        <input class="input" v-model="world_id"/><br>
        <Button :text=nickname destination="/game"></Button>
    </div>
</template>
<script>
    import "../scss/login.scss"
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
