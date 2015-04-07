require './helpers'
console.log "home-page"

if ENV is "desktop"
  require.ensure [], ->
    require './admin-helpers'

module.exports = ->
  console.log "home-page init"
