VueHelloWorldModal = require './vue-hello-world-modal'
{CompositeDisposable, Directory} = require 'atom'
reload = null

module.exports = new class VueHelloWorld
  vueHelloWorldModal: null
  subscriptions: null

  activate: (state) ->
    @vueHelloWorldModal = new VueHelloWorldModal(state.vueHelloWorldModalState)

    # Events subscribed to in atom's system can be
    # easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable
    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'vue-hello-world:toggle': @toggle

    # Watches changes to redraw modal
    if atom.inDevMode()
      @redraw()
      rootDir = new Directory(atom.packages.resolvePackagePath("vue-hello-world"))
      @subscriptions.add rootDir.getSubdirectory("lib").onDidChange @redraw
      @subscriptions.add rootDir.getSubdirectory("components").onDidChange @redraw

  deactivate: ->
    @vueHelloWorldModal.destroy()
    @subscriptions.dispose()

  serialize: ->
    vueHelloWorldModalState: @vueHelloWorldModal.serialize()

  toggle: =>
    console.log 'VueHelloWorld was toggled!'
    @vueHelloWorldModal.toggle()

  redraw: =>
    try
      reload ?= require "simple-reload"
    catch
      console.log "simple-reload is missing - no reloading possible"
      return null
    console.log "reloading"
    state = @serialize()
    @vueHelloWorldModal.destroy()
    VueHelloWorldModal = reload './vue-hello-world-modal'
    @vueHelloWorldModal = new VueHelloWorldModal(state.vueHelloWorldModalState)
    @vueHelloWorldModal.reload()
