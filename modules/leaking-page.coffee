# $version: 1.0@2c7e96
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:18.841Z
# graph-cluster: entry
MODULE_NAME = "leaking-page"
console = require('logger').for(MODULE_NAME)
console.log "load"
helpers = require 'helpers'
Leaker = require 'leaker'
Delegate = require('dom-delegate/lib/delegate.js')

main = document.getElementById 'main'

module.exports =
  init: ->
    console.log "init"

    helpers.appendTo main, """
      <div style="position: absolute; left: 0; top: 0">
        <button data-leaker-method='createObjects'>leak scattered objects</button>
        <button data-leaker-method='createNodes'>leak nodes</button>
        <button data-leaker-method='createClosures'>leak closure</button>
      </div>
    """

    leaker = new Leaker
    dd = new Delegate main
    dd.on 'click', '[data-leaker-method]', ->
      method = @attributes['data-leaker-method'].value
      console.log @innerHTML
      leaker[method]()
