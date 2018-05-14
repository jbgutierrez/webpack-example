##
# graph-cluster-name: core
##
MODULE_NAME = 'ajax'
console = require('logger').for(MODULE_NAME)
console.log 'load'

proxy = require 'proxy'

module.exports =
  request: 0
  get: (url, success) ->
    request = "get-#{@request++}"
    console.log "#{request} requesting #{url}..."
    proxied = proxy.proxy request, (data) ->
      console.log "#{request} receiving #{url}..."
      data or= "#{request} #{new Date}"
      success data
    if !/mock/.test url
      fetch(url).then((response) ->
        if response.status isnt 200
          console.log "#{request} Looks like there was a problem. Status Code: #{response.status}"
          return
        response.json().then proxied
      ).catch (err) ->
        window.console.log 'Fetch Error :-S', err
    else
      setTimeout proxied, Math.random() * 1000
