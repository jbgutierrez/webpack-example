require 'helpers'
require 'lookbook-configuration'
video = require 'video'
console.log "lookbook-page"

module.exports = ->
  console.log "lookbook-page init"
  video.setup()
