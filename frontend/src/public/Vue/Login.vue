<template>
    <div id="app">
        <p>Your nickname is: {{nickname}}</p>
        <p>Last played world: {{world_id}}</p>
        
        <input v-model="nickname"/><br>
        <input v-model="world_id"/><br>
        <a href="/game"><button>Play</button></a>
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
