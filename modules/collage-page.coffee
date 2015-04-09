require 'helpers'
# $version: 1.1@67f3e2
# $author: jbgutierrez
# $updated: 2015-04-09T23:33:52.497Z
require 'lookbook-configuration'
video = require 'video'
console.log "lookbook-page"

module.exports = ->
  console.log "lookbook-page init"
  video.setup()
