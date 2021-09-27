FROM node:14


WORKDIR /project

COPY package*.json ./

COPY ./src ./src

RUN npm install --production --silent && mv node_modules ../

EXPOSE 8080

CMD ["node", "./src/index.js"]