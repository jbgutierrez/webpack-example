##
# graph-cluster-name: dynamic-entry
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
  init: ->
    console.log "init"
    version = if Math.round(Math.random()) then "version1" else "version2"
    api.ajax =>
      require.ensure [], =>
        # require.ensure [], -> require 'marketing-page/version1'
        # require.ensure [], -> require 'marketing-page/version2'
        data = require "./marketing-page/#{version}.coffee"
        console.log "... rendering content #{data.name}"
        data.init?()
        if style = data.style
          console.log 'adding <style>'
          style.use()
          @dispose = ->
            console.log 'disposing <style>'
            style.unuse()
