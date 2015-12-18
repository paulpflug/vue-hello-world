// out: ../components_compiled/

<template>
  <h1 v-for="hello in hellos">Hello {{hello}}!</h1>
  <input v-model="input" @keyup.enter="add" placeholder="whom to greet" autocomplete="off"></input>
  <br>
  <some-comp></some-comp>
</template>

<script lang="coffee">
module.exports =
  el: "#hello-world"
  components:
    "some-comp": require "./some-comp"
  data: ->
    input: ""
    hellos: ["World"]
    log: ->
  methods:
    add: ->
      @log "adding #{@input}"
      @hellos.push @input
      @input = ""
  compiled: ->
    @log "compiled"
</script>
