require './helpers.coffee'
require './product-helpers.coffee'
console.log "product-page.coffee"

if ENV is "desktop"
  require.ensure [], ->
    require './admin-helpers.coffee'

module.exports = ->
  console.log "product-page.coffee init"
