# graph-cluster: entry
MODULE_NAME = "marketing-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

api = require 'api'

helpers = require 'helpers'
{ Video } = require 'video.es6'

require 'marketing-page.scss'

if helpers.adminMode
  require.ensure [], ->
    require 'admin-helpers'

module.exports =
  init: ->
    console.log "init"

    api.ajax ->

      video = new Video "video.mp4"
      video.play()
      console.log "... rendering content"
