MODULE_NAME = "content2"
console = require('logger').for(MODULE_NAME)
console.log "load"

module.exports =
  style: require './index.useable.scss'
  name: 'content two'
