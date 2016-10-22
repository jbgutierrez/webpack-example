##
# graph-cluster-name: entry-point
##
MODULE_NAME = "collage-page"
console = require('logger').for(MODULE_NAME)
console.log "load"

api = require 'api'
g = require 'globals'

helpers = require 'helpers'

require 'collage-page.scss'

if helpers.adminMode
  require.ensure [], -> require 'admin-helpers'

module.exports =
  init: (config) ->
    @config = config
    loadEnhacements = new Promise(
      (resolve, reject) ->
        if config.enhacements
          lazy = require "bundle!../contents/#{config.enhacements}/index.coffee"
          lazy helpers.proxy "retrieving enhacements #{config.enhacements}", (data) => resolve data
        else
          resolve()
    )

    loadMetadata = new Promise (r) -> api.ajax r
    loadData = new Promise (r) -> api.ajax r

    Promise.all([loadEnhacements, loadMetadata, loadData]).then ([@enhacements, @metadata, @data]) =>
      console.log '... ready!'
      @load()
      @enhance()

  load: ->
    console.log "... rendering content"

  enhance: ->
    return unless @enhacements
    console.log "... enhancing content with #{@enhacements.name}"
    if style = @enhacements.style
      console.log '... adding <style>'
      style.use()
      @dispose = ->
        console.log 'disposing <style>'
        style.unuse()
    @enhacements.init?()
