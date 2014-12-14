XView = require "../XView"

Contact  = require "../../models/contact"
Account  = require "../../models/account"
Wallet   = require "../../models/wallet"
Contacts = require "../../collections/contacts"

class Content extends XView
    constructor: ->
        super
        window.Contact = Contact
        window.Account = Account
        window.Wallet = Wallet
        window.Contacts = Contacts

Content.DEFAULT_OPTIONS =
    layout: null

module.exports = Content

