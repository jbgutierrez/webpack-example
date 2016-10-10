##
# graph-cluster-name: entry-point
##
MODULE_NAME = "marketing-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

api = require 'api'
g = require 'globals'

helpers = require 'helpers'

require 'marketing-page.scss'

if helpers.adminMode
  require.ensure [], -> require 'admin-helpers'

module.exports =
  init: (data) ->
    console.log "init"
    api.ajax =>
      console.log "... rendering content #{data.name}"
      data.init?()
      if style = data.style
        console.log 'adding <style>'
        style.use()
        @dispose = ->
          console.log 'disposing <style>'
          style.unuse()
