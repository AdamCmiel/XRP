XView = require "./XView"
Surface = require "famous/core/Surface"
DrawerLayout = require "./drawer/DrawerLayout"
TouchSync = require "famous/inputs/TouchSync"
Drawer = require "./drawer/Drawer"
Content = require "./content/Content"
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
        window.AppController = @
        window.router = router
        window.routes = routes

        @add new Surface
            size: [500, 500]
            properties: backgroundColor: "red"

        layout = @layout = new DrawerLayout @options.layout
        layout.drawer = drawer = new Drawer
        layout.content = content = @content = new Content

        sync = new TouchSync @options.sync
 
        content.pipe sync
        sync.pipe layout
 
        @add layout
 
        for route, routeWithoutParams of routes
            router.route route, routeWithoutParams, getCallbackForRoute.call @, routeWithoutParams
 
        @oldSubTree = null
        @currentSubTree = null
        @views = {}

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

# Push the current subtree to the old subtree, show the old
# subtree in anticipation of the new
AppController::rotateSubTree = ->
    @oldSubTree = @currentSubTree
    @content.show @oldSubtree, transition: no

AppController::show = (subtree) ->
    @rotateSubTree()
    @oldSubTree.end()
    @currentSubTree = subtree
    @content.show @currentSubTree, transition: yes
    subtree.start()

AppController::openDrawer = (options) ->
    @_moveDrawer "open", options

AppController::closeDrawer = (options) ->
    @_moveDrawer "close", options

AppController::toggleDrawer = (options) ->
    @_moveDrawer "toggle", options

AppController::_moveDrawer = (method, options = {}) ->
    switch options.transition
        when no        then transition = undefined
        when undefined then transition = @options.layout.transition
        else                transition = options.transition
    @layout[method] transition

AppController::showWallet = (url) ->
    alert "Implement this"

# Set up prototype methods for route responses
for _, route of routes
    console.log "Routing:", _, route, "./appRoutes/#{route}"
    AppController::[route] = require "./appRoutes/#{route}"

###*
 * @exports App
###
module.exports = AppController

