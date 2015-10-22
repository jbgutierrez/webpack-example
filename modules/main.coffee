# $version: 1.0@c12243
# $author: jbgutierrez
# $updated: 2015-10-23T05:33:22.550Z
require 'globals'
console = require('logger')
console.log "load"

Router = require 'router'

title   = document.getElementById 'title'
main    = document.getElementById 'main'
spinner = document.getElementById 'spinner'

show = (el) -> el.style.display = 'block'
hide = (el) -> el.style.display = 'none'

navigate = (delay) ->
  show spinner
  page = location.hash.substring(1) || 'marketing-page'
  console.log "... requesting #{page}"

  success = ->
    hide spinner
    hide main
    main.innerHTML = ""
    console.log "... receiving data for #{page}"
    title.innerText = document.title = page
    Router.init page
    console.log "... showing #{page}"
    show main

  setTimeout success, 500

navigate()
window.onhashchange = navigate
