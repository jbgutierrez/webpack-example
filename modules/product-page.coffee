# $version: 1.1@58319e
# $author: jbgutierrez
# $updated: 2015-10-20T19:58:51.106Z
require 'helpers'
require 'product-helpers'
console.log "product-page"

if ENV is "desktop"
  require.ensure [], ->
    require 'admin-helpers'

module.exports = ->
  console.log "product-page init"
