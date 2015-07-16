Hapi = require('hapi')
config = require('./config.js')

# Create a server with a host and port
server = new Hapi.Server()
server.connection({
  host: '127.0.0.1'
  port: 3498
})

# Add a route

server.route({
  method: 'GET'
  path: '/hello'
  handler: (request, reply)->
    reply({"statusCode": 200})
})

server.route({
  method: 'GET'
  path: '/latest'
  handler: (request, reply)->
    console.log('config',config)
    console.log 'Getting latest', request.query.version, config.latestVersion, request.query.version isnt config.latestVersion

    reply({"url": "https://twitch-watchdog.s3-us-west-2.amazonaws.com/Watchdog.zip"}) if request.query.version isnt config.latestVersion
    reply(204) if request.query.version is config.latestVersion
    #reply({statusCode: 200, body: { url: "http://mycompany.com/myapp/releases/myrelease", name: "My release name", notes: "Release Notes", pub_date: Date.now()}})
})

server.start (err)->
  console.log 'error:',err
