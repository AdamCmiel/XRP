# Bootstrap Backbone
Backbone = require "backbone"
$ = require "jquery"
Backbone.$ = $
Backbone.LocalStorage = require "backbone.localstorage"

routes = require "./routes"

class Router extends Backbone.Router

  constructor: ->
    super
    Backbone.history.start()
    log "Router created"

  routes: routes

  # Add trigger: true to all routes
  navigate: (path) -> super path, trigger: true

module.exports = router = new EBRouter

