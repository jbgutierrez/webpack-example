##
# graph-cluster-name: entry-point
##
module.exports =
  'layout':
    test: true
    load: -> require 'layout'
  'outline':
    test: true
    load: -> require 'outline' if ENV is 'desktop'
  'front-page':
    test: (page) -> page is 'front-page'
    load: -> require 'front-page'
  'collage-page':
    test: false
    load: -> require 'collage-page'
  'leaking-page':
    test: (page) -> page is 'leaking-page'
    load: (callback) ->
      moduleName = 'leaking-page'
      fn = => require.ensure [], => callback require 'leaking-page'

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
