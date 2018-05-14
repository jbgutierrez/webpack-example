##
# graph-cluster-name: entry-point
##
MODULE_NAME = 'content1-enhancement'
console = require('logger').for(MODULE_NAME)
console.log 'load'

module.exports =
  name: 'content one'
  style: require './index.useable.scss'
