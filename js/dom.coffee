##
# graph-cluster-name: core
##
MODULE_NAME = 'dom'
console = require('logger').for(MODULE_NAME)
console.log 'load'

module.exports =
  appendTo: (parent, html) ->
    div = document.createElement 'div'
    div.innerHTML = html
    for node in div.childNodes when node
      parent.appendChild node
