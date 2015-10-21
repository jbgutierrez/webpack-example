# $version: 1.2@cef630
# $author: jbgutierrez
# $updated: 2015-10-21T20:15:48.142Z
require 'helpers'
require 'lookbook-configuration'
video = require 'video'
console.log "lookbook-page"

module.exports =
  init = ->
    console.log "lookbook-page init"
    video.setup()
