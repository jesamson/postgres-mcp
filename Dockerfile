FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --omit=dev

# Copy server wrapper
COPY server.js ./

# Fix OpenShift permissions
RUN chown -R 1001:0 /app
USER 1001

EXPOSE 3000

# CMD uses node directly
CMD ["node", "server.js"]
