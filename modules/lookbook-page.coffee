require './helpers.coffee'
require './lookbook-configuration.coffee'
video = require './video.coffee'
console.log "lookbook-page.coffee"

module.exports = ->
  console.log "lookbook-page.coffee init"
  video.setup()
