load = null
path = require "path"
{CompositeDisposable} = require 'atom'

compTree = {
  "hello-world":
    "some-comp": null
}

module.exports = class VueHelloWorld
  element: null
  comps: null
  modalPanel: null
  log: null
  disposables: null
  constructor: (logger, state) ->
    @log = logger("core")
    unless @element?
      @log "creating root element"
      @element = document.createElement('div')
      @element.classList.add('hello-world')
    unless @disposables?
      @log "linking up the toggle command"
      @disposables = new CompositeDisposable
      @disposables.add atom.commands.add 'atom-workspace',
        'vue-hello-world:toggle': @toggle
    unless @comps?
      @log "loading the vue components"
      load ?= require "atom-vue-component-loader"
      @comps = load compTree,
        cwd: path.resolve path.dirname(module.filename), "../components_compiled/"
        debug: atom.inDevMode()
        reload: atom.inDevMode()
      @log "mounting app"
      @comps["hello-world"].log = logger("hello-world")
      @comps["hello-world"].$mount(@element)
    @log "loaded"
    @toggle()

  serialize: ->

  destroy: ->
    @log "destroying vue-hello-world"
    @comps?["hello-world"]?.$destroy true
    @comps?["hello-world"] = null
    @comps = null
    @modalPanel?.destroy()
    @disposables?.dispose()
    @disposables = null
    @element?.parentNode?.removeChild?(@element)
    @element = null
    @log = null

  toggle: =>
    if @element?
      unless @modalPanel?
        @log "creating modal panel"
        @modalPanel = atom.workspace.addModalPanel
          item: @element, visible: false
      @log "toggling visibility"
      if @modalPanel.visible
        @modalPanel.hide()
      else
        @modalPanel.show()
