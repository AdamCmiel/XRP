Engine = require 'famous/core/Engine'
Surface = require 'famous/core/Surface'

# Bootstrap Backbone
Backbone = require "backbone"
$ = require "jquery"
Backbone.$ = $
Backbone.LocalStorage = require "backbone.localstorage"

start = ->
    mainContext = Engine.createContext()
    mainContext.setPerspective 1000
    surface = new Surface
        size: [200, 200]
        content: 'click me!'
        properties: backgroundColor: 'red'

    scanBarcode = ->
        success = (message) ->
            console.log message
            surface.setContent message.text
        failure = (message) ->
            console.log message
            surface.setContent JSON.stringify message
        cordova.plugins.barcodeScanner.scan success, failure

    surface.on 'click', scanBarcode
    mainContext.add surface

document.addEventListener "deviceready", start, false
