FROM node:6.2.2-wheezy

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Ensure pm2 is on the path
ENV PATH /usr/src/app/node_modules/pm2/bin:$PATH

# Copy app source
COPY . /usr/src/app

# Expose port for web server and api server
EXPOSE 3000:3000
EXPOSE 3001:3001

CMD ["npm", "run-script", "docker"]

