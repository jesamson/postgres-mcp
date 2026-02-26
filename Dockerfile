FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Install dependencies during build
RUN npm install --omit=dev

# Fix permissions for OKD
RUN chown -R 1001:0 /app

USER 1001

EXPOSE 3000

CMD npx @modelcontextprotocol/server-postgres --transport http --port 3000
