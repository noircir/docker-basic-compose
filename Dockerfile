# Specify a base image
FROM node:alpine

WORKDIR /app

# Install dependencies
# First, copy the package.json into the container's directory
COPY ./package.json ./ 
# That will NOT cause re-installing (will take from cache)
RUN npm install
# Now, every time we update src files, the re-build
# will happen only from this point on.
COPY ./ ./

# Default command
CMD ["npm", "start"]