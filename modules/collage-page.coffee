require 'helpers'
# $version: 1.1@2f16d1
# $author: jbgutierrez
# $updated: 2015-10-20T19:57:54.542Z
require 'lookbook-configuration'
video = require 'video'
console.log "lookbook-page"

module.exports = ->
  console.log "lookbook-page init"
  video.setup()
