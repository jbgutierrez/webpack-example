# $version: 1.0@7f3582
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:26.417Z
MODULE_NAME = "router"
console = require('logger').for('router', '#dff0d8')
console.log "load"
configs = require 'category-configs'
helpers = require 'helpers'
g = require 'globals'

Router =
  init: (page) ->
    g.request++
    @dispose()
    window.gc?()
    console.log "init"
    modules = [
      'layout'
      'outline'
      page
    ]
    window.gc?()

    document.getElementById('main').style['border-color'] = '#'+Math.floor(Math.random()*16777215).toString(16)

    @load module, @request for module in modules

  dispose: ->
    keys = Object.keys(@loaded)
    return unless keys.length
    console.warn "requesting disposal #{keys}"
    for moduleName, module in @loaded
      if module.dispose
        module.dispose()
      else
        console.error "#{moduleName} not disposable"

    @loaded = {}
  loaded: {}
  load: (module, request, moduleName=module) ->
    if typeof module is 'string'
      module =
        switch module
          when 'layout'           then require 'layout'
          when 'outline'          then require 'outline' if ENV is 'desktop'
          when 'front-page'       then require 'front-page'
          when 'marketing-page'   then require 'marketing-page'

          when 'leaking-page'
            fn = =>
              require.ensure [], =>
                @load (require 'leaking-page'), request, moduleName
            if @leakingPageRequested
              fn()
            else
              @leakingPageRequested = true
              delay = 0
              console.log "retrieving source for #{moduleName} in #{delay}ms"
              console.log "please, throattle your connection with Chrome Tools"
              helpers.setTimeout ->
                console.log "receiving source for #{moduleName}"
                fn()
              , delay

    return unless module and module.init

    @loaded[moduleName] = module
    module.init()

module.exports = Router
