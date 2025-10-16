FROM node:20-alpine

WORKDIR /app

COPY package.json .

RUN yarn install

COPY . .

RUN DISABLE_ESLINT_PLUGIN=true yarn build 

RUN yarn global add serve

RUN adduser -S user 

EXPOSE 3000

ENTRYPOINT ["serve", "-s", "build"]




