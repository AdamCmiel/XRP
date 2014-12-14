AccountFocus = require "../content/dynamic/AccountFocus"
# Prototype method for AppController

accountFocus = (accountID) ->
    view = @views["accountFocus"] ||= new AccountFocus
    view.showAccount accountID
    @show view

module.exports = accountFocus
