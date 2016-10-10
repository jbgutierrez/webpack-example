##
# graph-cluster-name: entry-point
##
MODULE_NAME = "leaking-page"
console = require('logger').for(MODULE_NAME)
console.log "load"
helpers = require 'helpers'
Leaker = require 'leaker'

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
    helpers.on 'click', '[data-leaker-method]', ->
      method = @attributes['data-leaker-method'].value
      console.log @innerHTML
      leaker[method]()
