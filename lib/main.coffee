
pkgName = "vue-hello-world"

module.exports = new class Main
  vueHelloWorld: null
  config:
    debug:
      type: "integer"
      default: 0
      minimum: 0
  logger: -> ->
  log: ->
  consumeDebug: (debugSetup) =>
    @logger = debugSetup(pkg: pkgName)
    @log = @logger "main"
    @log "debug service consumed", 2
  consumeAutoreload: (reloader) =>
    reloader(pkg:pkgName)
    @log "autoreload service consumed", 2
  activate: (state) =>
    VueHelloWorld = require "./#{pkgName}"
    setTimeout (=>
      @vueHelloWorld = new VueHelloWorld(@logger, state.vueHelloWorldState)
      ),100

  serialize: ->
    vueHelloWorldState: @vueHelloWorld.serialize()

  deactivate: ->
    @log "deactivating"
    @vueHelloWorld?.destroy()
    @vueHelloWorld = null
