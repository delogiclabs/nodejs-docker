FROM node:10.15.0

WORKDIR /usr/src/app

COPY . .
RUN npm install

EXPOSE 80
CMD [ "node", "server.js" ]
