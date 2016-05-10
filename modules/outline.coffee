# $version: 1.0@63cb27
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:25.092Z
MODULE_NAME = "outline"
console = require('logger').for(MODULE_NAME)
console.log "load/init/¿eligible?"

require 'outline.scss'

window.addEventListener 'resized', ->
  console.log 'resized'
