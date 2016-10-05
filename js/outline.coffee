##
# graph-cluster-name: static-entry
##
MODULE_NAME = "outline"
console = require('logger').for(MODULE_NAME)
console.log "load/init/¿eligible?"

require 'outline.scss'

window.addEventListener 'resized', ->
  console.log 'resized'
