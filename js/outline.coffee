##
# graph-cluster-name: entry-point
##
MODULE_NAME = "outline"
console = require('logger').for(MODULE_NAME)
console.log "load"

require 'outline.scss'

window.addEventListener 'resized', ->
  console.log 'resized'
