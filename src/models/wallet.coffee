Account = require "./account"
XRP = require "xrp-app-lib"

Wallet = Account.extend
    defaults:
        wallet: null

#    walletType: ->
#        "wallet"
#
#    payTo: (account, amount) ->
#        XRP.sendPayment from: @get("wallet"), to: account, amount: amount

module.exports = Wallet

