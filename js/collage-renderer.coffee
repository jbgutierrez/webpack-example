##
# graph-cluster-name: renderer
##
MODULE_NAME = 'collage-renderer'
console = require('logger').for(MODULE_NAME)
AbstractRenderer = require 'abstract-renderer'
console.log 'load'

require 'collage-renderer.scss'
class CollageRenderer extends AbstractRenderer
  render: ->
    console.log "... rendering content"

module.exports = CollageRenderer
