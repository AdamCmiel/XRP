ImportWalletFromQRConfirmation = require "../static/ImportWalletFromQRConfirmation"

# Prototype method for AppController
importWalletFromQRConfirmation = ->
    @show @views["importWalletFromQRConfirmation"] ||= new ImportWalletFromQRConfirmation

module.exports = importWalletFromQRConfirmation
