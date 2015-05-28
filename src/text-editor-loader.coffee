module.exports =
class TextEditorLoader
  constructor: (@editor) ->
    @loadDisposable = @editor.onDidLoad => @finishLoading()

  finishLoading: ->
    console.log "finish loading"
    @loadDisposable.dispose()
    atom.workspace.paneForItem(this).replaceItem(this, @editor)

  getTitle: ->
    @editor.getTitle()

atom.views.addViewProvider TextEditorLoader, (loader) ->
  node = document.createElement("div")
  node.textContent = "Loading #{loader.getTitle()}..."
  node
