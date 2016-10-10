##
# graph-cluster-name: core
##
if window.location.hostname is 'localhost'
  __webpack_require__.p = "/"

MODULE_NAME = "router"
console = require('logger').for('router', '#dff0d8')
console.log "load"
helpers = require 'helpers'
g = require 'globals'
pageConfigs = require 'config'

Router =
  init: (page) ->
    g.request++
    request = g.request
    @dispose()
    helpers.disposeFns()
    window.gc?()
    console.log "init"
    modules = [
      'layout'
    ]
    modules = modules.concat [
      'outline'
    ] if ENV is 'desktop'
    window.gc?()

    document.documentElement.id = page
    document.getElementById('main').style['border-color'] = '#'+Math.floor(Math.random()*16777215).toString(16)

    @require module, request for module in modules

    pageConfig = pageConfigs[page] or [ module: page ]
    loadConfigurable = (config) => 
      if config.version
        lazy = require "bundle!../versions/#{config.module}/#{config.version}.coffee"
        # Ex:
        # require.ensure [], -> require 'marketing-page/version1'
        # require.ensure [], -> require 'marketing-page/version2'
        lazy (data) => @require config.module, request, data
      else
        @require config.module, request

    loadConfigurable config for config in pageConfig

  dispose: ->
    keys = Object.keys(@loaded)
    return unless keys.length
    console.warn "requesting disposal #{keys}"
    for moduleName, module of @loaded
      if module.dispose
        module.dispose()
      else
        console.error "#{moduleName} not disposable"

    @loaded = {}
  loaded: {}
  require: (moduleName, request, config) ->
    load = (module) => @load moduleName, request, config, module
    module = switch moduleName
      when 'marketing-page'   then load require 'marketing-page'
      when 'layout'           then load require 'layout'
      when 'outline'          then load require 'outline'
      when 'front-page'       then load require 'front-page'
      when 'leaking-page'
        fn = => require.ensure [], => load require 'leaking-page'

        if @leakingPageRequested
          fn()
        else
          @leakingPageRequested = true
          delay = 4000
          console.log "retrieving source for #{moduleName} in #{delay}ms"
          console.log "please, throattle your connection with Chrome Tools"
          proxied = ->
            console.log "receiving source for #{moduleName}"
            fn()
          setTimeout proxied, delay

  load: (moduleName, request, config, module) ->
    return unless module and module.init
    if request isnt g.request
      console.error "canceling #{moduleName} initialization"
    else
      @loaded[moduleName] = module
      module.init config

module.exports = Router
