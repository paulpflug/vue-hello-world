<template>
  <h1 v-repeat="hello : hellos">Hello {{hello}}!</h1>
  <input v-model="input" v-on="keyup:add | key 'enter'" placeholder="whom to greet" autocomplete="off"></input>
  <br>
  <some-comp></some-comp>
</template>

<script lang="coffee">
module.exports =
  data: ->
    input: ""
    hellos: ["World"]
  methods:
    add: ->
      @log "adding #{@input}"
      @hellos.push @input
      @input = ""
  compiled: ->
    @log "compiled"
</script>
