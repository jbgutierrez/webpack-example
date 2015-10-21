# $version: 1.2@460bbb
# $author: jbgutierrez
# $updated: 2015-10-21T20:28:47.298Z
console.log 'router'

Router =
  init: ->
    @timestamp = +new Date
    modules = [
      'layout'
      location.hash.substring(1) or 'home-page'
      'outline'
    ]

    @load module, @timestamp for module in modules

  dispose: ->
    module.dispose?() for module in @loaded
    @loaded = []
  loaded: []
  load: (module, timestamp) ->
    if typeof module is 'string'
      module =
        switch module
          when 'category-page'    then require 'category-page'
          when 'collage-page'     then require 'collage-page'
          when 'corporative-page' then require 'corporative-page'
          when 'home-page'        then require 'home-page'
          when 'layout'           then require 'layout'
          when 'lookbook-page'    then require 'product-page'
          when 'outline'          then require 'outline' if ENV is 'desktop'
          when 'product-page'     then require 'product-page'

          when 'lazy-page'
            require.ensure [], =>
              deferred = => @load (require 'lazy-page'), timestamp
              setTimeout deferred, Math.random() * 5000

    return unless module

    if timestamp isnt @timestamp
      console.log "Canceling module initialization"
    else
      @loaded.push module
      module.init?()

Router.init()
window.onhashchange = ->
  Router.dispose()
  Router.init()
