# $version: 1.0@20b338
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:20.112Z

main = document.getElementById 'main'
log = (name, msg, bg) ->
  msg = "#{name}: #{msg}"
  console.log msg
  div = document.createElement 'div'
  div.style['background-color'] = bg
  textNode = document.createTextNode msg
  div.appendChild textNode
  main.appendChild div

class Logger
  constructor: (@name, @color='#d9edf7') ->
  log: (msg) -> log @name, msg, @color
  warn: (msg) -> log @name, msg, '#fcf8e3'
  error: (msg) -> log @name, msg, '#f2dede'
  for: (name, color) -> new Logger name, color

module.exports = new Logger 'global', '#dff0d8'
