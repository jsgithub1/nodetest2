# Tutorial: nodetest2

This is a demo app that includes a basic Express app with MongoDB backend.  This fork adds support for running the entire setup under docker using docker-compose for container orchestration.  It also includes the pm2plugin for reporting process, memory, and CPU metrics. It creates 2 containers, 1 for the mongodb database and 1 for the web, api, and load test apps.

## Potential Future Enhancements

It would probably make sense to further refine the container architecture by splitting the web, api, and load test apps into separate linked containers.  The docker-prod.json could then be modified to only create 1 instance of each which would allow us to use the scaling capabilities within docker-compose to scale them independently while still retaining the ability to scale within a container using pm2.  It would also retain the monitoring provided by pm2 and the pm2plugin. 

## Running and Testing

Notes: 
   * You must have docker (and docker-compose) installed and configured on your system.  
   * You need to set the NEW_RELIC_LICENSE_KEY environment variable to your New Relic license key before running the command below.

`$ docker-compose up --build`

This will start a docker container running mongodb v3.3 and a separate container running 2 instances of the web and api apps in cluster mode along with the load generation app.

Once the app is running, you can issue pm2 commands via `docker exec` by obtaining the container id using `docker ps`.  For example:

```
$ docker exec 2008b4c72e76 pm2 list
┌──────────────┬────┬─────────┬─────┬────────┬─────────┬────────┬─────────────┬──────────┐
│ App name     │ id │ mode    │ pid │ status │ restart │ uptime │ memory      │ watching │
├──────────────┼────┼─────────┼─────┼────────┼─────────┼────────┼─────────────┼──────────┤
│ Express API  │ 0  │ cluster │ 26  │ online │ 0       │ 29m    │ 55.742 MB   │ disabled │
│ Express API  │ 1  │ cluster │ 32  │ online │ 0       │ 29m    │ 54.723 MB   │ disabled │
│ Express Web  │ 2  │ cluster │ 54  │ online │ 0       │ 29m    │ 73.602 MB   │ disabled │
│ Express Web  │ 3  │ cluster │ 82  │ online │ 0       │ 29m    │ 68.273 MB   │ disabled │
│ Express Load │ 4  │ fork    │ 97  │ online │ 0       │ 29m    │ 44.484 MB   │ disabled │
│ PM2 Plugin   │ 5  │ fork    │ 114 │ online │ 0       │ 29m    │ 46.645 MB   │ disabled │
└──────────────┴────┴─────────┴─────┴────────┴─────────┴────────┴─────────────┴──────────┘
```

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
