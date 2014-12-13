Engine = require 'famous/core/Engine'

# Register Spring Transition
Transitionable = require "famous/transitions/Transitionable"
SpringTransition = require "famous/transitions/SpringTransition"
Transitionable.registerMethod "spring", SpringTransition

# Set debug or production environment
environment = "debug"
window.log = require("./log")(environment)

# Create context and set Perspective
start = ->
    mainContext = Engine.createContext()
    mainContext.setPerspective 800

# Add app to the mainContext
    AppController = require "./views/AppController"
    mainContext.add new AppController

document.addEventListener "deviceready", start, false

