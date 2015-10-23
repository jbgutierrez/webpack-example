# $version: 1.0@fa5c27
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:15.046Z
console = require('logger').for('helpers')
console.log "load"

module.exports =
  appendTo: (parent, html) ->
    div = document.createElement 'div'
    div.innerHTML = html
    for node in div.childNodes when node
      parent.appendChild node
