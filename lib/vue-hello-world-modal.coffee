compile = null
load = null

module.exports =
class VueHelloWorldView
  comps: null
  modalPanel: null
  constructor: (serializedState) ->

  load: (reload) ->
    load ?= require "atom-vue-component-loader"
    @comps = load ["hello-world"], {cwd: "./../components_compiled/", reload: reload}
    @element = document.createElement('div')
    @element.classList.add('hello-world')
    @comps.helloWorld.$mount(@element)


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @comps?.halloWorld?.$destroy true
    @modalPanel?.destroy()

  reload: =>
    try
      compile ?= require("atom-vue-component-compiler")(packageName: "vue-hello-world")
    catch
      throw new Error "atom-vue-component-compiler
        required for reloading components"
    return compile ["hello-world"]
      .then =>
        @load(true)
      .catch (e) ->
        console.log e
        console.log e.stack


  toggle: =>
    unless @comps?
      @load()
    unless @modalPanel?
      @modalPanel = atom.workspace.addModalPanel
        item: @element, visible: false
    if @modalPanel.visible
      @modalPanel.hide()
    else
      @modalPanel.show()