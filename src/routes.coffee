pages = require "./pages"
stripParams = (path) -> path.replace /\/.+/g, ""
module.exports[route] = stripParams route  for route of pages

