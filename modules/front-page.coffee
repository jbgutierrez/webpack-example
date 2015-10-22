# $version: 1.0@cabfe2
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:09.447Z
# graph-cluster: entry
MODULE_NAME = "front-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

helpers = require 'helpers'
api = require 'api'

module.exports =
  init: ->
    console.log "init"
