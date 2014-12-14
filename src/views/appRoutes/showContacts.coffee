ShowContacts = require "../content/dynamic/ShowContactsWithWallets"
# Prototype method for AppController

showContacts = ->
    view = @views["showContacts"] ||= new ShowContacts
    view.render @contacts

module.exports = showContacts

