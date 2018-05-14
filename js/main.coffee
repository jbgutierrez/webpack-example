##
# graph-cluster-name: core
##
require 'globals'
console = require('logger')
mapper = require 'mapper'

console.log "load"

require 'main.scss'
window.__contentsHandler = (page) ->
  mapper.map page
