// Generated by CoffeeScript 1.9.3
(function() {
  var Hapi, server;

  Hapi = require('hapi');

  server = new Hapi.Server();

  server.connection({
    host: '127.0.0.1',
    port: 3498
  });

  server.route({
    method: 'GET',
    path: '/hello',
    handler: function(request, reply) {
      return reply({
        "statusCode": 200
      });
    }
  });

  server.route({
    method: 'GET',
    path: '/latest',
    handler: function(request, reply) {
      console.log('Getting latest', request.params);
      return reply(200);
    }
  });

  server.start(function(err) {
    return console.log('error:', err);
  });

}).call(this);