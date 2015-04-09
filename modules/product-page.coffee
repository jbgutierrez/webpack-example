# $version: 1.1@0a23d0
# $author: jbgutierrez
# $updated: 2015-04-09T23:34:10.040Z
require 'helpers'
require 'product-helpers'
console.log "product-page"

if ENV is "desktop"
  require.ensure [], ->
    require 'admin-helpers'

module.exports = ->
  console.log "product-page init"
