##
# graph-cluster-name: entry-point-versions
##
# Ex:
# require.ensure [], -> require 'content1'
# require.ensure [], -> require 'content2'
module.exports =
  'content1-page': [
    {
      module: 'collage-page'
      enhacements: 'content1'
    }
  ]
  'content2-page': [
    {
      module: 'collage-page'
      enhacements: 'content2'
    }
  ]
