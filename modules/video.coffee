# $version: 1.0@3f231a
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:27.740Z
MODULE_NAME = "video"
console = require('logger').for(MODULE_NAME)
console.log "load"

require "video.scss"

module.exports =
  setup: ->
    console.log "setup"
