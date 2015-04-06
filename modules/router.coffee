console.log "router.coffee"

route = ->
  require './layout.coffee'

  switch location.hash
    when '#category-page'
      require.ensure [], ->
        setup = require './category-page.coffee'
        setup()
    when '#product-page'
      require.ensure [], ->
        setup = require './product-page.coffee'
        setup()
    when '#lookbook-page'
      require.ensure [], ->
        setup = require './lookbook-page.coffee'
        setup()
    when '#collage-page'
      require.ensure [], ->
        setup = require './collage-page.coffee'
        setup()
    when '#corporative-page'
      require.ensure [], ->
        setup = require './corporative-page.coffee'
        setup()
    else
      setup = require './home-page.coffee'
      setup()

  if ENV is "desktop"
    require "./outline.coffee"

route()
window.onhashchange = route

