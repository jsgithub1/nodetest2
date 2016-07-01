FROM node:6.2.2-wheezy

ARG NEW_RELIC_LICENSE_KEY

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Install and configure newrelic-pm2-plugin
RUN npm install https://github.com/kenahrens/newrelic-pm2-plugin &&\
    cp ./node_modules/pm2plugin/config-template.json ./node_modules/pm2plugin/config.json &&\
    sed -i "s/LICENSE/${NEW_RELIC_LICENSE_KEY}/" ./node_modules/pm2plugin/config.json

# Ensure pm2 is on the path
ENV PATH /usr/src/app/node_modules/pm2/bin:$PATH

# Copy app source
COPY . /usr/src/app

# Expose port for web server and api server
EXPOSE 3000:3000
EXPOSE 3001:3001

CMD ["npm", "run-script", "docker"]

