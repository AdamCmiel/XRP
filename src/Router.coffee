Backbone = require "backbone"
$ = require "jquery"
Backbone.$ = $
window.__bb = Backbone

class Router extends Backbone.Router

  constructor: ->
    super
    Backbone.history.start()
    log "Router created"

  # Add trigger: true to all routes
  navigate: (path) -> super path, trigger: true

module.exports = new Router

