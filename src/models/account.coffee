Backbone = require "backbone"
XRPLib = require "xrp-app-lib"

Account = Backbone.Model.extend
    defaults:
        account: null

    updateBalance: ->
        XRPLib.updateBalance @get @walletType()
              .then => @

    walletType: ->
        "account"

module.exports = Account

