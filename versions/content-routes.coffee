##
# graph-cluster-name: entry-point-versions
##
# Ex:
# require.ensure [], -> require 'marketing-page/version1'
# require.ensure [], -> require 'marketing-page/version2'
module.exports =
  'marketing-page-v1': [
    {
      module: 'marketing-page'
      version: 'version1'
    }
  ]
  'marketing-page-v2': [
    {
      module: 'marketing-page'
      version: 'version2'
    }
  ]
