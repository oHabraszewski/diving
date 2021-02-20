<template>
    <div id="app">
        <p>Your nickname is: {{nickname}}</p>
        <p>Last played world: {{world_id}}</p>

        <input class="input" v-model="nickname"/><br>
        <input class="input" v-model="world_id"/><br>
        <a href="/game"><button class="button">Play</button></a>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                nickname: 'Unnamed',
                world_id: 'FabulousTigerWritingNervously'
            }
        }
    }
</script>
