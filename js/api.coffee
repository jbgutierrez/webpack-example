##
# graph-cluster-name: core
##
console = require('logger').for('api')
console.log "load"

helpers = require 'helpers'

module.exports =
  request: 0
  ajax: (success) ->
    request = "ajax-#{@request++}"
    console.log "#{request} requesting ..."
    proxied = helpers.proxy request, ->
      console.log "#{request} receiving ..."
      success()
    setTimeout proxied, 1000
