require 'helpers'
console.log "home-page"
$ = require 'jquery'

if ENV is "desktop"
  require.ensure [], ->
# $version: 1.1@79c97e
# $author: jbgutierrez
# $updated: 2015-10-20T19:57:59.175Z
    require 'admin-helpers'

module.exports = ->
  console.log "home-page init"
