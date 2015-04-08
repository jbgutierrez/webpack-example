require 'helpers'
require 'product-helpers'
console.log "product-page"

if ENV is "desktop"
  require.ensure [], ->
    require 'admin-helpers'

module.exports = ->
  console.log "product-page init"
