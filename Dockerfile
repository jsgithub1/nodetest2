FROM node:6.2.2-wheezy

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Copy app source
COPY . /usr/src/app
RUN chmod +x /usr/src/app/bin/api /usr/src/app/bin/www

