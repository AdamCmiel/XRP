#Shim console.log in development to improve performance and disable logs in production

module.exports = (environment) ->
  return if environment is "debug" then -> console.log.apply console, arguments else ->
