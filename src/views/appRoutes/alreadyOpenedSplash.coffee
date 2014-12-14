AlreadyOpenedSplash = require "../static/AlreadyOpenedSplash"

# Prototype method for AppController
alreadyOpenedSplash = ->
    @show @views["alreadyOpenedSplash"] ||= new AlreadyOpenedSplash

module.exports = alreadyOpenedSplash
