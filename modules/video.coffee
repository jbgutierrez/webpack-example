MODULE_NAME = "video"
console = require('logger').for(MODULE_NAME)
console.log "load"

require "video.scss"

module.exports =
  setup: ->
    console.log "setup"
