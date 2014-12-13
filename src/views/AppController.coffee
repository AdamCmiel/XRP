XView = require "./XView"
Surface = require "famous/core/Surface"
DrawerLayout = require "../famousInternal/DrawerLayout"
TouchSync = require "famous/inputs/TouchSync"
Drawer = require "drawer/Drawer"
Content = require "content/Content"
router = require "../Router"
routes = require "../routes"

# Helper for attaching routes to Controller
getCallbackForRoute = (route) ->
    @[routes[route]].bind @

###*
 * Top Level App Controller
 * @class App
 * @extends XView
###

class AppController extends XView
  
  constructor: ->
    super
    layout = @layout = new DrawerLayout @options.layout
    layout.drawer = drawer = new Drawer
    layout.content = content = @content = new Content

    sync = new TouchSync @options.sync

    content.pipe sync
    sync.pipe layout

    @add layout

    @subscribe content
    @subscribe drawer
    @_eventInput.on "toggleMenu", =>
      layout.toggle @options.layout.transition

    @_eventInput.on "closeMenu", ->
      layout.close()

    for route, routeWithoutParams of routes
        router.on route, getCallbackForRoute routeWithoutParams

AppController.DEFAULT_OPTIONS =
  layout:
    drawerLength: 260
    positionThreshold: 180
    velocityThreshold: 0.1
    transition:
      method: "spring"
      period: 450
      dampingRatio: 0.6
  sync:
    direction: TouchSync.DIRECTION_X

# Set up prototype methods for route responses
for _, route of routes
    AppController::[route] = require "./appRoutes/#{route}"

###*
 * @exports App
###
module.exports = AppController

