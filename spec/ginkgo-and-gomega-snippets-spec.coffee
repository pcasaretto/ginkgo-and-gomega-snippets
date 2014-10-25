{WorkspaceView} = require 'atom'
GinkgoAndGomegaSnippets = require '../lib/ginkgo-and-gomega-snippets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "GinkgoAndGomegaSnippets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('ginkgo-and-gomega-snippets')

  describe "when the ginkgo-and-gomega-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.ginkgo-and-gomega-snippets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'ginkgo-and-gomega-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.ginkgo-and-gomega-snippets')).toExist()
        atom.workspaceView.trigger 'ginkgo-and-gomega-snippets:toggle'
        expect(atom.workspaceView.find('.ginkgo-and-gomega-snippets')).not.toExist()
