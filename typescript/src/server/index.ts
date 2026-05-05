import express, { Request, Response } from "express";

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.static("public"));

// API Routes
app.get("/api/health", (_req: Request, res: Response) => {
  res.json({
    status: "ok",
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV,
  });
});

app.get("/api/info", (_req: Request, res: Response) => {
  res.json({
    name: "typescript-web-app",
    version: "1.0.0",
    description: "A TypeScript web application template",
  });
});

// Example: GET request with query parameters
app.get("/api/greet", (req: Request, res: Response) => {
  const name = req.query.name || "World";
  res.json({
    message: `Hello, ${name}!`,
    timestamp: new Date().toISOString(),
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
  console.log(`📊 Health check: http://localhost:${PORT}/api/health`);
});

export default app;
