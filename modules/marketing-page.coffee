# $version: 1.0@689590
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:23.836Z
# graph-cluster: entry
MODULE_NAME = "marketing-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

api = require 'api'

helpers = require 'helpers'
video = require 'video'

if helpers.adminMode
  require.ensure [], ->
    require 'admin-helpers'

module.exports =
  init: ->
    console.log "init"

    api.ajax ->

      video.setup()
      console.log "... rendering content"
