##
# graph-cluster-name: core
##
MODULE_NAME = 'proxy'
console = require('logger').for(MODULE_NAME)
g = require 'globals'
Delegate = require('dom-delegate/lib/delegate.js')

console.log 'load'
main = document.getElementById 'main'

module.exports =
  fns: []
  # .on(eventType[, selector], handler[, useCapture])
  on: (args...) ->
    if typeof (handler = args[idx = 1]) isnt 'function'
      handler = args[idx = 2]
    args[idx] = @proxy 'event', handler
    @delegate.on args...
  proxy: (name, fn, disposable=true) ->
    request = g.request
    proxied = (args...) ->
      if request is g.request
        fn.apply this, args
      else
        console.error "canceling callback (request-#{request} [#{name}])" unless disposable
        fn = null
    @fns.push proxied if disposable
    proxied
  disposeFns: ->
    @delegate?.destroy()
    @delegate = new Delegate main
    return unless length = @fns.length
    console.log "removing proxied functions (total: #{length})"
    fn() while fn = @fns.pop()
