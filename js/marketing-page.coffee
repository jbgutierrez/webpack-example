# graph-cluster: entry
MODULE_NAME = "marketing-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

api = require 'api'
g = require 'globals'

helpers = require 'helpers'

require 'marketing-page.scss'

if helpers.adminMode
  require.ensure [], -> require 'admin-helpers'

render = ->
  require.ensure [], ->
    version = if g.request is 1 then "version1" else "version2"
    # require.ensure [], -> require 'marketing-page/version1'
    # require.ensure [], -> require 'marketing-page/version2'
    data = require "./marketing-page/#{version}.coffee"
    console.log "... rendering content #{data.name}"
    data.init?()

module.exports =
  init: ->
    console.log "init"
    api.ajax render
