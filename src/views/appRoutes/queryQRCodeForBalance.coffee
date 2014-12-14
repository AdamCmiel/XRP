QR = require "../../QR.coffee"
# Prototype method for AppController

queryQRCodeForBalance = ->
    # On failure will redirect to home view
    QR.scan (text) => @showWallet text

module.exports = queryQRCodeForBalance
