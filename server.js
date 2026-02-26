// server.js
import { startServer } from "@modelcontextprotocol/server-postgres";

const port = process.env.PORT || 3000;
const transport = process.env.TRANSPORT || "http";

startServer({ port: Number(port), transport });
