##
# graph-cluster-name: versions
##
MODULE_NAME = "version1"
console = require('logger').for(MODULE_NAME)
console.log "load"
{ Video } = require 'video.es6'

module.exports =
  name: 'version one'
  style: require 'marketing-page/version1.useable.scss'
  init: ->
    video = new Video "video.mp4"
    video.play()
