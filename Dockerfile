FROM node:20-alpine

# Required for node-gyp on Alpine, sometimes needed for ESM packages
RUN apk add --no-cache python3 make g++ git

WORKDIR /app

# Copy package files first (for build caching)
COPY package*.json ./

# Install dependencies at build time
RUN npm install --omit=dev

# Copy the server wrapper
COPY server.js ./

# Ensure OpenShift random UID can run
RUN chown -R 1001:0 /app
USER 1001

EXPOSE 3000

# Start the server using Node
CMD ["node", "server.js"]
