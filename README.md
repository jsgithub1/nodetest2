# Tutorial: nodetest2

This is a demo app that includes a basic Express app with MongoDB backend.  This fork adds support for running the entire setup under docker using docker-compose for container orchestration.  It also removes the use of pm2 and config.  A single image newrelic/nodetest is used/shared by all 3 containers.

## Running and Testing

Notes: 
   * You must have docker (and docker-compose) installed and configured on your system.  
   * You need to set the NEW_RELIC_LICENSE_KEY environment variable to your New Relic license key before running the command below.

`$ docker-compose up --build`

This will start 3 containers.  One running mongodb v3.3, one running the nodetest API app, and one running the nodetest Web app.  The web app is available at http://localhost:3000

`$ docker-compose -f docker-compose.load.yml up --build`

This will start 4 containers.   One running mongodb v3.3, one running the nodetest API app, one running the nodtest Web app, and one running the nodetest load generator to drive traffic to the web app.

## Overview

Primary libraries used:
* express - for web and api framework
* jade - UI templates
* mongodb - native db calls
* request - api client calls to backends
 
Testing via:
* mocha - test framework
* superagent - HTTP testing tools
* faker - generate fake test data

Monitoring via:
* morgan - logging
* newrelic - performance monitoring
