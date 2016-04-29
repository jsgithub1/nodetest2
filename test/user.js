var supertest = require('supertest');

var mongo = require('mongodb');
var monk = require('monk');
var db = monk('localhost:27017/nodetest2');

describe('user tests', function() {
  var server;
  before(function() {
    server = require('../bin/www');
  });
  after(function() {
    server.close();
  });
  it('adds a user', function testAdd(done) {
    supertest(server)
      .post('/user/add')
      .field('fname', 'Node')
      .field('lname', 'Js')
      .field('userName', 'booyah')
      .field('userEmail', 'booyah@gmail.com')
      .field('addstreet', '100 Sunset Blvd')
      .field('addcity', 'Beverly Hills')
      .field('addstate', 'CA')
      .field('addzip', '90210')
      .expect(302, done);
  });
  it('gets the user list', function testList(done) {
    supertest(server)
      .get('/user/list')
      .expect(200, done);
  });
});