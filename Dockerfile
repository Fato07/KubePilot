FROM node:14

WORKDIR /usr/src/app

COPY kube-pilot-app/package*.json ./

RUN npm install

COPY kube-pilot-app .

EXPOSE 8080
CMD [ "node", "server.js" ]
