import { describe, it, expect } from "vitest";
import request from "supertest";
import app from "./index";

describe("Express Server", () => {
  it("should return health status", async () => {
    const res = await request(app).get("/api/health");
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("ok");
    expect(res.body).toHaveProperty("timestamp");
    expect(res.body).toHaveProperty("environment");
  });

  it("should return app info", async () => {
    const res = await request(app).get("/api/info");
    expect(res.status).toBe(200);
    expect(res.body.name).toBe("typescript-web-app");
    expect(res.body.version).toBe("1.0.0");
  });

  it("should greet with default name", async () => {
    const res = await request(app).get("/api/greet");
    expect(res.status).toBe(200);
    expect(res.body.message).toBe("Hello, World!");
  });

  it("should greet with custom name", async () => {
    const res = await request(app).get("/api/greet?name=Nix");
    expect(res.status).toBe(200);
    expect(res.body.message).toBe("Hello, Nix!");
  });
});
