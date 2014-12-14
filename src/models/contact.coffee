Backbone = require "backbone"
ContactsLib = require "../lib/contacts.lib.coffee"

Contact = Backbone.Model.extend
    defaults:
        id: 0
        name: ""
        email: ""
        account: null

    sync: (method, _, options) ->
        if method is "read"
            ContactsLib.find id.toString()
                .then (record) ->
                    log record
                    #call options.success with updated attributes
                .catch (failure) ->
                    @destroy()

module.exports = Contact

