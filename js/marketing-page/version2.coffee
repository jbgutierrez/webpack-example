MODULE_NAME = "version2"
console = require('logger').for(MODULE_NAME)
console.log "load"

module.exports =
  style: require 'marketing-page/version2.useable.scss'
  name: 'version two'
