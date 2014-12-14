Contact = require "../models/contact"
Backbone = require "backbone"
Backbone.LocalStorage = require "backbone.localstorage"

Contacts = Backbone.Collection.extend
    model: Contact
    localStorage: new Backbone.LocalStorage "contacts"

module.exports = Contacts

