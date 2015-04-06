console.log "modules/router.coffee"

route = ->
  switch location.hash
    when '#product-page'
      require.ensure [], -> require './product-page.coffee'
    else
      require './home-page.coffee'

      if ENV is "desktop"
        require "./desktop-patches.coffee"

  require './layout.coffee'


route()
window.onhashchange = route

