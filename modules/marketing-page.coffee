MODULE_NAME = "marketing-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

api = require 'api'

helpers = require 'helpers'
video = require 'video'

require 'marketing-page.scss'

if helpers.adminMode
  require.ensure [], ->
    require 'admin-helpers'

module.exports =
  init: ->
    console.log "init"

    api.ajax ->

      video.setup()
      console.log "... rendering content"
