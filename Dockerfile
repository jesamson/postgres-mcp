FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Install dependencies
RUN npm install --omit=dev

# Copy server wrapper
COPY server.js ./

# Fix permissions for OpenShift random UID
RUN chown -R 1001:0 /app
USER 1001

EXPOSE 3000

CMD ["node", "server.js"]
