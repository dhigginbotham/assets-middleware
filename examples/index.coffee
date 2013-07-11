asset = require "./"

middle = {}

middle.embed = (req, res, next) ->

  scripts = [
    # css for app
    {src: '/stylesheets/normalize.css', name: 'normalize', where: 'head', uri: null, type: 'css', exclude: null}
    {src: '/stylesheets/app.css', name: 'app', where: 'head', uri: null, type: 'css', exclude: null}
    {src: '/stylesheets/custom.css', name: 'custom', where: 'head', uri: null, type: 'css', exclude: null}
    {src: '//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css', name: 'font-awesome.css', where: 'head', uri: null, type: 'css', exclude: null}

    # footer scripts for app
    {src: '/javascripts/vendor/custom.modernizr.js', name: 'custom.modernizr', where: 'head', uri: null, type: 'js', exclude: null}
    {src: '//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', name: 'jquery.js', where: 'head', uri: null, type: 'js', exclude: null}
    {src: 'https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js', name: 'angular.min', where: 'foot', uri: '/dashboard/make/:cid', type: 'js', exclude: null}
    {src: 'https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js', name: 'angular-resource.min', where: 'foot', uri: '/dashboard/make/:cid', type: 'js', exclude: null}
    {src: '/lib/app.js', name: 'app', where: 'foot', uri: '/dashboard/make/:cid', type: 'js', exclude: null}
    # {src: '/lib/controllers.js', name: 'controllers', where: 'foot', uri: '/dashboard/make/:cid', type: 'js', exclude: null}
    # {src: '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.4.4/underscore-min.js', name: 'underscore-min', where: 'foot', uri: null, type: 'js', exclude: null}
    {src: '/javascripts/vendor/chart.min.js', name: 'chart.min.js', where: 'head', uri: null, type: 'js', exclude: null}
    # {src: 'http://cdn.jsdelivr.net/restangular/0.6.1/restangular.min.js', name: 'restangular.min', where: 'foot', uri: null, type: 'js', exclude: null}
    # {src: '/javascripts/vendor/coffeescript.js', name: 'coffeescript', where: 'foot', uri: null, type: 'js', exclude: null}
    {src: '//cdnjs.cloudflare.com/ajax/libs/foundation/4.1.6/js/foundation.min.js', name: 'foundation.min', where: 'foot', uri: null, type: 'js', exclude: null}
    # {src: '/lib/app.js', name: 'dashboard.app', where: 'foot', uri: null, type: 'js', exclude: null}
  ]

  opts = 
    assets: scripts

  assets = new asset req, opts

  assets.make (embed) ->
    res.locals.assets = embed
    next()

module.exports = middle