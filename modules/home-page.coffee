require 'helpers'
console.log "home-page"
$ = require 'jquery'

if ENV is "desktop"
  require.ensure [], ->
# $version: 1.1@9fd28e
# $author: jbgutierrez
# $updated: 2015-04-09T23:33:58.362Z
    require 'admin-helpers'

module.exports = ->
  console.log "home-page init"
