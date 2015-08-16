VueHelloWorld = null
log = null
logger = null
reloader = null
compile = null

pkgName = "vue-hello-world"

module.exports = new class Main
  vueHelloWorld: null
  config:
    debug:
      type: "integer"
      default: 1
      minimum: 0
  activate: (state) ->
    # enables package reload in dev mode for changes in folders:
    # lib, styles and components
    if atom.inDevMode()
      setTimeout (->
        reloaderSettings = pkg:pkgName,folders:["lib","styles","components"]
        try
          reloader ?= require("atom-package-reloader")(reloaderSettings)
        ),500
    # enables the logger, which will be only active in dev mode
    unless log?
      logger ?= require("atom-simple-logger")(pkg:pkgName)
      log = logger("main")
      log "activating"
    # compiles the vue files to js / only in dev mode
    if atom.inDevMode()
      log "compiling components"
      try
        compile ?= require("atom-vue-component-compiler")(packageName: pkgName)
      if compile?
        @compiling = compile ["hello-world","some-comp"]
    # loades the components after they are compiled
    unless @vueHelloWorld?
      load = =>
        log "loading core"
        try
          VueHelloWorld ?= require "./#{pkgName}"
          @vueHelloWorld = new VueHelloWorld(logger,state.vueHelloWorldState)
        catch e
          log "loading core failed"
          log e.message if e?.message?
      if @compiling?
        @compiling.then load
      else
        load()
  serialize: ->
    vueHelloWorldState: @vueHelloWorld.serialize()

  deactivate: ->
    log "deactivating"
    @vueHelloWorld?.destroy()
    @vueHelloWorld = null
    if atom.inDevMode()
      reloader?.dispose()
      reloader = null
      log = null
      logger = null
      compile = null
      VueHelloWorld = null
