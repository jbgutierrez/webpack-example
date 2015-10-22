# $version: 1.0@2c7e96
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:18.841Z
# graph-cluster: entry
MODULE_NAME = "leaking-page"
console = require('logger').for(MODULE_NAME)
console.log "load"
helpers = require 'helpers'
leaker = require 'leaker'

module.exports =
  init: ->
    console.log "init"
