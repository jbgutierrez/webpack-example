# $version: 1.2@78a30b
# $author: jbgutierrez
# $updated: 2015-10-21T20:15:28.084Z
require 'helpers'
require 'product-helpers'
console.log "product-page"

if ENV is "desktop"
  require.ensure [], ->
    require 'admin-helpers'

module.exports =
  init = ->
    console.log "product-page init"
