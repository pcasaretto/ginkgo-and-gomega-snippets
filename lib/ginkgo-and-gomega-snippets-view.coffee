{View} = require 'atom'

module.exports =
class GinkgoAndGomegaSnippetsView extends View
  @content: ->
    @div class: 'ginkgo-and-gomega-snippets overlay from-top', =>
      @div "The GinkgoAndGomegaSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "ginkgo-and-gomega-snippets:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "GinkgoAndGomegaSnippetsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
