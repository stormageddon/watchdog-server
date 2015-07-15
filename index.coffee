Hapi = require('hapi')

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
    console.log 'Getting latest', request.params
    reply(200)
    #reply({statusCode: 200, body: { url: "http://mycompany.com/myapp/releases/myrelease", name: "My release name", notes: "Release Notes", pub_date: Date.now()}})
})

server.start (err)->
  console.log 'error:',err
