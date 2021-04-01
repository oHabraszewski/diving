<template>
    <div class="section-container">
        <article :id="id">
            <h2>{{name}}</h2>
            <p><slot></slot></p>
        </article>
        <br>
    </div>
</template>
<script>
    export default {
        data(){
            return {
                id: ""
            }
        },
        props: ["name"],
        mounted(){
            const nameArray = this.name.toLowerCase().split("")
            nameArray.forEach((element, index) => {
                if(element == " "){
                    nameArray[index] = "-"
                }
            });
            this.id = nameArray.join("");
        }
    }
</script>
<style lang="scss" scoped>
    @import '../../scss/variables';
    
    
</style>
