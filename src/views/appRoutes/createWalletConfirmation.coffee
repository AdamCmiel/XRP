CreateWalletConfirmation = require "../static/CreateWalletConfirmation"

# Prototype method for AppController
createWalletConfirmation = ->
    @show @views["createWalletConfirmation"] ||= new CreateWalletConfirmation

module.exports = createWalletConfirmation
