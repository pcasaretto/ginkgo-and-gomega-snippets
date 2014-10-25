GinkgoAndGomegaSnippetsView = require './ginkgo-and-gomega-snippets-view'

module.exports =
  ginkgoAndGomegaSnippetsView: null

  activate: (state) ->
    @ginkgoAndGomegaSnippetsView = new GinkgoAndGomegaSnippetsView(state.ginkgoAndGomegaSnippetsViewState)

  deactivate: ->
    @ginkgoAndGomegaSnippetsView.destroy()

  serialize: ->
    ginkgoAndGomegaSnippetsViewState: @ginkgoAndGomegaSnippetsView.serialize()
