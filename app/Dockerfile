# Specify base image 
FROM node:20-alpine

# Specify directory in which subsequent commands will be run
WORKDIR /app

# Copy package containing dependencies into the /app directory
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the source code
COPY . .

#Build a production-ready version of the app
RUN DISABLE_ESLINT_PLUGIN=true yarn build 

# Install serve to run the app 
RUN yarn global add serve

# Run app as a non-root user
RUN addgroup -S group && adduser -S user -G group
RUN chown -R user:group /app
EXPOSE 3000
USER user
ENTRYPOINT ["serve", "-s", "build"]




