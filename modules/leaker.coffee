# $version: 1.0@36e65a
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:17.553Z
MODULE_NAME = "leaker"
console = require('logger').for(MODULE_NAME)
console.log "load"

main = document.getElementById 'main'

class ScatteredObject
  initialize: (@name) ->

uuid = 0
class Leaker
  constructor: (@js=true, @dom=true) ->
    @name = new Array(1e7).join('x')
    @id = "leaker##{uuid++}"
    @leaks = []

  leak: (item) ->
    if @js
      @leaks.push item

    if @dom
      main.addEventListener 'click', item if typeof item is 'function'
      main.appendChild item if item.tagName

  createClosures: ->
    amount = 1e4
    while amount > 0
      @leak ((_) -> -> _) "#{@id} - #{amount} - #{name}"
      amount--

  createNodes: ->
    amount = i = 1e4
    fragment = document.createDocumentFragment()
    while i > 0
      div = document.createElement('div')
      textNode = document.createTextNode 'ghost'
      div.appendChild textNode
      div.style.display = 'none'
      @leak div
      i--
    div.style.display = 'block'
    div.innerHTML = "#{@id} - #{amount} nodes"

  createObjects: ->
    amount = 1e5
    while amount > 0
      @leak new ScatteredObject amount
      amount--

module.exports = Leaker
