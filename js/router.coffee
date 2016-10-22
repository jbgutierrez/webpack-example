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
routes = require 'routes'
configs = require 'config'

Router =
  route: (page) ->
    g.request++
    @dispose()
    helpers.disposeFns()
    window.gc?()
    console.log "route"

    document.documentElement.id = page
    document.getElementById('main').style['border-color'] = '#'+Math.floor(Math.random()*16777215).toString(16)

    for module, route of routes
      load = route.test
      load = load page if typeof load is 'function'
      @load module if load
    @load config.module, config for config in configs[page] or []
  initiated: {}
  load: (moduleName, config) ->
    load = routes[moduleName].load
    if load.length # a function with arity will be expected to callback when ready
      load helpers.proxy "retrieving #{moduleName}", (module) =>
        @init moduleName, config, module
    else
      @init moduleName, config, load()

  init: (moduleName, config, module) ->
    return unless module and module.init
    @initiated[moduleName] = module
    module.init config
  dispose: ->
    keys = Object.keys @initiated
    return unless keys.length
    console.warn "requesting disposal #{keys}"
    for moduleName, module of @initiated
      if module.dispose
        module.dispose()
      else
        console.error "#{moduleName} not disposable"
    @initiated = {}

module.exports = Router
