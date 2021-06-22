var connect = require('connect');
var serveStatic = require('serve-static');
connect().use(serveStatic(__dirname + '/st-coverage')).listen(3003, function () {
  console.log('Server running on 3003...');
});