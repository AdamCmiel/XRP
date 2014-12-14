OpenSplash = require "../static/OpenSplash"

# Prototype method for AppController
OpenSplash = ->
    @show @views["openSplash"] ||=  OpenSplash

module.exports = OpenSplash
