# $version: 1.0@36e65a
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:17.553Z
MODULE_NAME = "leaker"
console = require('logger').for(MODULE_NAME)
console.log "load"

main = document.getElementById 'main'

createString = ->
  new Array(1e6).join('x')

class ScatteredObject
  initialize: (@name) ->

createNodes = ->
  i = 100
  fragment = document.createDocumentFragment()
  while i > 0
    div = document.createElement('div')
    textNode = document.createTextNode(i + ' - ' + (new Date).toTimeString())
    div.appendChild textNode
    fragment.appendChild div
    i--
  fragment

createClosure = ->
  largeString = createString()
  -> largeString

class Leaker
  constructor: (@js=true, @dom = true) ->
    @leaks = []
  leak: (item) ->
    if @js
      @leaks.push item

    if @dom
      main.addEventListener 'click', item if typeof item is 'function'
      main.appendChild item if item.tagName

  createClosure: ->
    @leak createClosure()

  createNodes: ->
    @leak createNodes()

  createObject: ->
    @leak new ScatteredObject createString()

module.exports = Leaker
