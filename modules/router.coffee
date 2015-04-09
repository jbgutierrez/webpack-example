# $version: 1.1@29531e
# $author: jbgutierrez
# $updated: 2015-04-09T23:34:11.507Z
console.log "router"

route = ->
  require 'layout'

  switch location.hash
    when '#category-page'
      require.ensure [], ->
        setup = require 'category-page'
        setup()
    when '#product-page'
      require.ensure [], ->
        setup = require 'product-page'
        setup()
    when '#lookbook-page'
      require.ensure [], ->
        setup = require 'lookbook-page'
        setup()
    when '#collage-page'
      require.ensure [], ->
        setup = require 'collage-page'
        setup()
    when '#corporative-page'
      require.ensure [], ->
        setup = require 'corporative-page'
        setup()
    else
      setup = require 'home-page'
      setup()

  if ENV is "desktop"
    require "./outline"

route()
window.onhashchange = route

