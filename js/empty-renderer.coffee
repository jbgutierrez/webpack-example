##
# graph-cluster-name: renderer
##
MODULE_NAME = 'empty-renderer'
console = require('logger').for(MODULE_NAME)
AbstractRenderer = require 'abstract-renderer'
console.log 'load'

class EmptyRenderer extends AbstractRenderer
  render: ->
    console.log "... rendering content"

module.exports = EmptyRenderer
