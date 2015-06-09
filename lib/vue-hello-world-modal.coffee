compile = null
load = null
packageName = "vue-hello-world"
depTree =
  "hello-world":
    "some-comp": null

module.exports =
class VueHelloWorldView
  comps: null
  modalPanel: null
  constructor: (serializedState) ->

  load: (reload) ->
    unless @element?
      @element = document.createElement('div')
      @element.classList.add('hello-world')
    unless @comps?
      load ?= require "atom-vue-component-loader"
      @comps = load depTree,
        cwd: "#{atom.packages.resolvePackagePath(packageName)}/components_compiled/"
        reload: reload
      @comps["hello-world"].$mount(@element)


  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @comps?.halloWorld?.$destroy true
    @modalPanel?.destroy()

  reload: =>
    try
      compile ?= require("atom-vue-component-compiler")(packageName: packageName)
    catch
      throw new Error "atom-vue-component-compiler
        required for reloading components"
    return compile ["hello-world","some-comp"]
      .then =>
        @load(true)
      .catch (e) ->
        console.log e
        console.log e.stack


  toggle: =>
    unless @element? or @comps?
      try
        @load()
      catch
        @reload()
        try
          @load()
        catch
          console.log "drawing failed"
    unless @modalPanel?
      @modalPanel = atom.workspace.addModalPanel
        item: @element, visible: false
    if @modalPanel.visible
      @modalPanel.hide()
    else
      @modalPanel.show()
