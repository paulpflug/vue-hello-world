path = require "path"
{CompositeDisposable} = require 'atom'
Vue = require "../node_modules/vue/dist/vue.js"

module.exports = class VueHelloWorld
  constructor: (logger, state) ->
    @logger = logger
    @log = logger("core")
    @log "creating root element"
    @element = document.createElement('div')
    @element.setAttribute("id","hello-world")
    @log "linking up the toggle command"
    @disposables = new CompositeDisposable
    @disposables.add atom.commands.add 'atom-workspace',
      'vue-hello-world:toggle': @toggle
    @log "loaded"
    @toggle()

  serialize: ->

  destroy: ->
    @log "destroying vue-hello-world"
    @modalPanel?.destroy()
    @disposables?.dispose()
    @element?.parentNode?.removeChild?(@element)

  toggle: =>
    if @element?
      unless @modalPanel?
        @log "creating modal panel"
        @modalPanel = atom.workspace.addModalPanel
          item: @element, visible: false
        @log "loading the vue component"
        helloWorld = new Vue(require("./../components_compiled/hello-world.js"))
        helloWorld.log = @logger "hello-world component"
      @log "toggling visibility"
      if @modalPanel.visible
        @modalPanel.hide()
      else
        @modalPanel.show()
