##
# graph-cluster-name: core
##
console = require('logger').for('helpers')
console.log "load"
g = require 'globals'
Delegate = require('dom-delegate/lib/delegate.js')

main = document.getElementById 'main'

module.exports =
  appendTo: (parent, html) ->
    div = document.createElement 'div'
    div.innerHTML = html
    for node in div.childNodes when node
      parent.appendChild node
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
