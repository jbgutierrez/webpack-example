##
# graph-cluster-name: renderer
##
module.exports =
  'leaking-renderer': (callback) ->
    moduleName = 'leaking-renderer'
    fn = => require.ensure [], => callback require 'leaking-renderer'

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
  'collage-renderer': -> require 'collage-renderer'
  'empty-renderer': -> require 'empty-renderer'
