import { useState, useEffect } from "react";

interface HealthStatus {
  status: string;
  timestamp: string;
  environment: string;
}

function App() {
  const [health, setHealth] = useState<HealthStatus | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("/api/health")
      .then((res) => res.json())
      .then((data) => {
        setHealth(data);
        setLoading(false);
      })
      .catch(() => {
        setLoading(false);
      });
  }, []);

  return (
    <div style={styles.container}>
      <h1 style={styles.title}>TypeScript Web App</h1>
      <p style={styles.subtitle}>
        Express + Vite + React + TypeScript
      </p>

      {loading ? (
        <p style={styles.loading}>Loading...</p>
      ) : health ? (
        <div style={styles.card}>
          <h2 style={styles.cardTitle}>Server Status</h2>
          <p style={styles.status}>Status: {health.status}</p>
          <p style={styles.timestamp}>
            Last checked: {new Date(health.timestamp).toLocaleString()}
          </p>
          <p style={styles.env}>Environment: {health.environment}</p>
        </div>
      ) : (
        <p style={styles.error}>Could not connect to server</p>
      )}

      <footer style={styles.footer}>
        Built with Nix + devenv
      </footer>
    </div>
  );
}

const styles: Record<string, React.CSSProperties> = {
  container: {
    maxWidth: "800px",
    margin: "0 auto",
    padding: "40px 20px",
    fontFamily:
      '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif',
    textAlign: "center" as const,
  },
  title: {
    fontSize: "2.5rem",
    color: "#1a1a2e",
    marginBottom: "10px",
  },
  subtitle: {
    fontSize: "1.1rem",
    color: "#666",
    marginBottom: "30px",
  },
  loading: {
    fontSize: "1.2rem",
    color: "#888",
  },
  card: {
    background: "#fff",
    borderRadius: "12px",
    padding: "24px",
    boxShadow: "0 4px 6px rgba(0,0,0,0.1)",
    marginTop: "20px",
  },
  cardTitle: {
    fontSize: "1.3rem",
    color: "#1a1a2e",
    marginBottom: "16px",
  },
  status: {
    fontSize: "1.1rem",
    color: "#2ecc71",
    fontWeight: "bold" as const,
  },
  timestamp: {
    color: "#888",
    fontSize: "0.9rem",
  },
  env: {
    color: "#666",
    fontSize: "0.9rem",
  },
  error: {
    color: "#e74c3c",
    fontSize: "1.1rem",
  },
  footer: {
    marginTop: "40px",
    color: "#aaa",
    fontSize: "0.9rem",
  },
};

export default App;
