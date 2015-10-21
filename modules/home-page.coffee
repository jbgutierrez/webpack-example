require 'helpers'
console.log "home-page"
$ = require 'jquery'

if ENV is "desktop"
  require.ensure [], ->
# $version: 1.2@e3a39b
# $author: jbgutierrez
# $updated: 2015-10-21T20:15:08.117Z
    require 'admin-helpers'

module.exports =
  init: ->
    console.log "home-page init"
