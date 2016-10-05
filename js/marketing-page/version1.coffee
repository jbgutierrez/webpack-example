MODULE_NAME = "version1"
console = require('logger').for(MODULE_NAME)
console.log "load"
{ Video } = require 'video.es6'

module.exports =
  name: 'version one'
  init: ->
    video = new Video "video.mp4"
    video.play()
