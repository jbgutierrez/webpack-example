##
# graph-cluster-name: entry-point
##
MODULE_NAME = "front-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

helpers = require 'helpers'
api = require 'api'

module.exports =
  init: ->
    console.log "init"
