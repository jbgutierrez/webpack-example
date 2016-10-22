MODULE_NAME = "content1"
console = require('logger').for(MODULE_NAME)
console.log "load"
{ Video } = require 'video.es6'

module.exports =
  name: 'content one'
  style: require './index.useable.scss'
  init: ->
    console.log '... init'
    video = new Video "video.mp4"
    video.play()
