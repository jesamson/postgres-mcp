import { startServer } from "@modelcontextprotocol/server-postgres";

const port = Number(process.env.PORT || 3000);
const transport = process.env.TRANSPORT || "http";

startServer({ port, transport })
  .then(() => console.log(`Server running on port ${port}`))
  .catch(err => {
    console.error("Failed to start server:", err);
    process.exit(1);
  });
