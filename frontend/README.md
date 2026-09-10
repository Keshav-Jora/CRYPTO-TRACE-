# CryptoTrace frontend

The frontend is a React + Vite investigation workspace. It calls the FastAPI backend for authentication, saved cases, traces, reports, and health checks.

## Run locally

```powershell
cd frontend
npm install
npm run dev -- --host 127.0.0.1 --port 5173
```

Open <http://127.0.0.1:5173>. When no public API URL is configured, Vite proxies `/auth`, `/cases`, `/trace`, `/reports`, and `/health` to `http://127.0.0.1:8000`.

## Environment

For a separately hosted frontend, configure one of these build-time variables:

```env
VITE_API_BASE_URL=https://your-backend.example
# VITE_API_URL is supported as a legacy alias.
```

Do not place blockchain provider keys, JWT secrets, or any backend-only credentials in `VITE_*` variables: Vite exposes them to the browser bundle.

## Build

```powershell
npm run build
```

The investigation graph renders only the graph and evidence returned by the backend. It does not calculate risk, create transaction relationships, or retrieve blockchain data in the browser.

See the [root README](../README.md) for local backend setup and deployment guidance.
