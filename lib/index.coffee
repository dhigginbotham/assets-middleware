_ = require "underscore"

assets = (req, opts) ->

  @route = req.route.path

  @embed = {}
  @embed.head = {}
  @embed.head.js = []
  @embed.head.css = []
  @embed.foot = {}
  @embed.foot.js = []
  @embed.foot.css = []

  @_url = req.url
  @_routes = []

  if opts? then _.extend @, opts

  @

assets::make = () ->
  
  self = @
  
  for asset in @assets
    do (asset) ->
      if (self.embed.head[asset.type] or self.embed.foot[asset.type]) and 
        (asset.uri == self.route or asset.uri == null) and 
        (asset.exclude != self.route or asset.exclude != self._url)
          self.embed[asset.where][asset.type].push asset

module.exports = assets