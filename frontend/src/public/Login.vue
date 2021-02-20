<template>
    <div id="app">
        <p>Your nickname is: {{nickname}}</p>
        <input v-model="nickname"/><br>
        <a href="/game"><button>Play</button></a>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                nickname: 'Unnamed'
            }
        }
    }
</script>
