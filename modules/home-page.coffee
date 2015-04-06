require './helpers.coffee'
console.log "home-page.coffee"

if ENV is "desktop"
  require.ensure [], ->
    require './admin-helpers.coffee'

module.exports = ->
  console.log "home-page.coffee init"
