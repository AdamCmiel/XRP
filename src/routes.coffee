routes = require './routes.json'
stripParams = (path) -> path.replace /\/.+/g, ""
module.exports[route] = stripParams route  for route of routes

