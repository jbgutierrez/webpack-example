##
# graph-cluster-name: entry-point
##
MODULE_NAME = 'leaking-renderer'
console = require('logger').for(MODULE_NAME)
proxy = require 'proxy'
dom = require 'dom'
Leaker = require 'leaker'

console.log 'load'

module.exports =
  init: ->
    console.log "init"

    dom.appendTo main, """
      <div style="position: absolute; left: 0; top: 0">
        <button data-leaker-method='createObjects'>leak scattered objects</button>
        <button data-leaker-method='createNodes'>leak nodes</button>
        <button data-leaker-method='createClosures'>leak closure</button>
      </div>
    """

    leaker = new Leaker
    proxy.on 'click', '[data-leaker-method]', ->
      method = @attributes['data-leaker-method'].value
      console.log @innerHTML
      leaker[method]()
