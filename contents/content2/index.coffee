##
# graph-cluster-name: entry-point
##
MODULE_NAME = 'content2-enhancement'
console = require('logger').for(MODULE_NAME)
console.log 'load'
{ Video } = require 'video.es6'

module.exports =
  style: require './index.useable.scss'
  name: 'content two'
  init: ->
    console.log '... init'
    video = new Video "video.mp4"
    video.play()
  dispose: ->
    console.log '... stoping video gracefully'
    console.log '... avoiding memory leaks'
