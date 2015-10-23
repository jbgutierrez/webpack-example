# $version: 1.0@fa5c27
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:15.046Z
console = require('logger').for('helpers')
console.log "load"
g = require 'globals'

module.exports =
  appendTo: (parent, html) ->
    div = document.createElement 'div'
    div.innerHTML = html
    for node in div.childNodes when node
      parent.appendChild node
  setTimeout: (fn, delay) ->
    proxied = @proxy(fn, null, false)
    setTimeout proxied, delay
  fns: []
  proxy: (fn, name="unnamed", disposable=true) ->
    request = g.request
    proxied = (args...) ->
      if request is g.request
        fn.apply this, args...
      else
        console.error "canceling callback (request-#{request} [#{name}])" unless disposable
        fn = null
    @fns.push proxied if disposable
    proxied
  disposeFns: ->
    return unless length = @fns.length
    console.log "removing proxied functions (total: #{length})"
    fn() while fn = @fns.pop()
