# Stage 1

FROM node:20 AS build

WORKDIR /app

COPY package.json .

RUN yarn install

COPY . .

RUN DISABLE_ESLINT_PLUGIN=true yarn build

# Stage 2

FROM node:20-alpine

WORKDIR /app

COPY --from=build . .

RUN yarn global add serve

EXPOSE 3000

CMD ["serve", "-s", "build"]


