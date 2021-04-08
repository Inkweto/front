FROM node:12.18.1
ENV NODE_ENV=development

WORKDIR /workdir/

COPY app/package.json /workdir/

RUN npm install

COPY . .
CMD [ "npm", "run", "serve" ]
