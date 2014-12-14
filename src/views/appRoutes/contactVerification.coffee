ContactVerification = require "../dynamic/ContactVerification"
# Prototype method for AppController

contactVerification = (contactID) ->
    view = @views["contactVerification"] ||= new ContactVerification
    view.showContact contactID
    @show view

module.exports = contactVerification

