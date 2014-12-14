NewOpenSplash = require "../static/NewOpenSplash"

# Prototype method for AppController
newOpenSplash = ->
    @show @views["newOpenSplash"] ||= new NewOpenSplash

module.exports = newOpenSplash
