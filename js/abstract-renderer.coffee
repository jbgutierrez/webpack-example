##
# graph-cluster-name: renderer
##
MODULE_NAME = 'abstract-renderer'
console = require('logger').for(MODULE_NAME)
console.log 'load'

class AbstractRenderer
  constructor: (@config, @enhacements) ->
    @applyCSSEnhancements()
    @render()
    @applyJsEnhancements()

  applyCSSEnhancements: ->
    @style = @enhacements?.style
    return unless @style
    console.log '... enhancing <style>'
    @style.use()

  render: ->
    throw "This is a template method to be implemented by concrete classes"

  applyJsEnhancements: ->
    return unless @enhacements?.init
    console.log "... enhancing content"
    @enhacements.init()

  dispose: ->
    if @style
      console.log 'disposing enhanced <style>'
      @style.unuse()
    @enhacements?.dispose?()

module.exports = AbstractRenderer
