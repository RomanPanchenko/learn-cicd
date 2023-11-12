FROM node:20-alpine

ADD .. /app
WORKDIR /app

ENV NODE_ENV="development"

RUN npm install -g nodemon
RUN npm install

CMD [ "nodemon", "--inspect=0.0.0.0:9221", "-L", "bin/www" ]

