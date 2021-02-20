<template>
    <div>
        <a v-bind:href=destination><button class="button"> Play as {{text}}</button></a>
    </div>
</template>
<script>
    import "../scss/button.scss"

    export default {
        props: ['text','destination']
    }
</script>
