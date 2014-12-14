Backbone = require "backbone"
XRPLib = require "xrp-app-lib"
ContactsLib = require "../lib/contacts.lib.coffee"

Contact = Backbone.Model.extend
    defaults: ->
        id: 0
        name: ""
        email: ""
        account: null

    sync: (method, _, options) ->
        switch method
            when "read"
                ContactsLib.find id.toString()
                    .then (record) ->
                        log record
                        #call options.success with updated attributes
                    .catch (failure) ->
                        @destroy()

            else log "model called sync with method #{method}", model.toJSON()

module.exports = Contact

