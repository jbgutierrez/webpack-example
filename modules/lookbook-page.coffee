# $version: 1.1@e7f733
# $author: jbgutierrez
# $updated: 2015-10-20T19:58:15.267Z
require 'helpers'
require 'lookbook-configuration'
video = require 'video'
console.log "lookbook-page"

module.exports = ->
  console.log "lookbook-page init"
  video.setup()
