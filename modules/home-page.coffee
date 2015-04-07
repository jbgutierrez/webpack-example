require './helpers'
console.log "home-page"
$ = require 'jquery'

if ENV is "desktop"
  require.ensure [], ->
    require './admin-helpers'

module.exports = ->
  console.log "home-page init"
