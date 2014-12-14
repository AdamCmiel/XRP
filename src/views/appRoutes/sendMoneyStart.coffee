SendMoneyStart = require "../content/static/sentMoneyStart"
# Prototype method for AppController

sendMoneyStart = ->
    view = @views["sendMoneyStart"] ||= new SendMoneyStart

module.exports = sendMoneyStart
