##
# graph-cluster-name: core
##
if window.location.hostname is 'localhost'
  __webpack_require__.p = "/"

MODULE_NAME = 'mapper'
console = require('logger').for(MODULE_NAME, '#dff0d8')
g = require 'globals'
proxy = require 'proxy'
g = require 'globals'
ajax = require 'ajax'
# Ex:
# require.ensure [], -> require 'content1'
# require.ensure [], -> require 'content2'
renderers = require 'renderers'
Delegate = require('dom-delegate/lib/delegate.js')

console.log 'load'

module.exports =
  map: (page) ->
    g.request++
    document.getElementById('req-count').innerHTML = g.request
    @dispose()
    proxy.disposeFns()
    window.gc?()
    console.log "map"

    document.documentElement.id = page
    document.getElementById('main').style['border-color'] = '#'+Math.floor(Math.random()*16777215).toString(16)

    ajax.get  "contents/#{page}-page.json", (config) =>
      loadEnhacements = new Promise(
        (resolve, reject) ->
          if config.enhacements
            lazy = require "bundle!../contents/#{config.enhacements}/index.coffee"
            console.log msg = "retrieving enhacements #{config.enhacements} for #{page}"
            lazy proxy.proxy msg, (data) => resolve data
          else
            resolve()
      )

      loadData = new Promise(
        (resolve, reject) ->
          if config.data
            console.log "requesting remote data for #{page}"
            ajax.get "mock/#{page}-data.json", resolve
          else
            resolve()
      )

      Promise.all([loadEnhacements, loadData]).then ([enhacements, data]) =>
        config.enhacements = enhacements
        config.data = data
        @load config.module, config

  load: (moduleName, config) ->
    load = renderers[moduleName]
    switch
      when not load
        console.error "missing #{moduleName} module"
      when load.length # a function with arity will be expected to callback when ready
        load proxy.proxy "retrieving #{moduleName}", (module) =>
          @init moduleName, config, module
      else
        @init moduleName, config, load()

  initiated: []
  init: (moduleName, config, module) ->
    if module.init
      module.init config, config.enhacements
    else
      instance = new module config, config.enhacements
    initiated = name: moduleName, instance: instance || module
    @initiated.push initiated

  dispose: ->
    return unless @initiated.length
    keys = (module.name for module in @initiated)
    console.warn "previous #{keys} will be disposed"
    while module = @initiated.pop()
      module.instance.dispose?()
