<template>
  <h1 v-repeat="hello : hellos">Hello {{hello}}!</h1>
  <input v-model="input" v-on="keyup:add | key enter" placeholder="whom to greet" autocomplete="off"></input>

</template>

<script lang="coffee">
module.exports =

  data: ->
    input: ""
    hellos: ["World"]
  methods:
    add: ->
      @hellos.push @input
      @input = ""
</script>
