# $version: 1.1@841f21
# $author: jbgutierrez
# $updated: 2015-04-09T23:34:04.203Z
require 'helpers'
require 'lookbook-configuration'
video = require 'video'
console.log "lookbook-page"

module.exports = ->
  console.log "lookbook-page init"
  video.setup()
