QR = require "../../QR.coffee"
# Prototype method for AppController

sendMoneyConfirmation = (fromWalletID, toWalletID) ->
    view = @views["sendMoneyConfirmation"] ||= new SendMoneyConfirmation
    view.render
        fromWallet: fromWalletID
        toWallet: toWalletID

    QR.render()

module.exports = sendMoneyConfirmation
