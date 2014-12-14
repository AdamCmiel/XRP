AddContactStart = require "../static/AddContactStart"

# Prototype method for AppController
addContactStart = ->
    @show @views["addContactStart"] ||= new AddContactStart

module.exports = addContactStart
