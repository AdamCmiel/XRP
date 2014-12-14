Home = require "../dynamic/Home"
# Prototype method for AppController

home = (isDrawerOpen) ->
    if isDrawerOpen then @openDrawer() else @closeDrawer()
    @show @views["home"] ||= new Home

module.exports = home
