# CryptoTrace

CryptoTrace is a blockchain investigation prototype for tracing wallet fund flow, identifying downstream exposure, and highlighting suspicious activity in a bounded graph view. The project is designed for public blockchain analysis and investigative workflows, not for real-time enforcement or private-identity attribution.

## What the project does

- Accepts a source wallet and a case context
- Retrieves public blockchain transactions for supported chains
- Traces multi-hop fund movement through a bounded graph
- Normalizes raw provider output into a consistent evidence set
- Identifies suspicious or high-risk paths and wallet clusters
- Matches known VASP and exchange-related labels where available
- Produces a structured investigation response and report artifacts

## Repository layout

- `backend/` — FastAPI server, graph logic, blockchain adapters, risk analysis, and report generation
- `frontend/` — React + Vite investigation UI
- `docs/` — project documentation and reference notes
- `demo_verification/` — local verification artifacts created during testing
- `file/` — supporting project artifacts and hackathon materials

## Project status

This repository contains a working prototype with a live FastAPI backend, a React frontend, blockchain provider adapters, investigation graph logic, and report generation. The codebase is explicitly scoped to public blockchain data and analyst tooling, and it is not a production-grade compliance or law-enforcement system.

## Tech stack

| Layer | Technology | Verified usage in this repo |
| --- | --- | --- |
| Backend API | FastAPI | Main service and request routing (`backend/main.py`, `backend/api/*`) |
| Frontend UI | React + Vite | Investigation dashboard at `frontend/` |
| Graph visualization | Cytoscape | Used by the frontend investigation graph |
| Graph analysis | NetworkX | Bounded graph traversal and relationship summarization |
| Blockchain access | Etherscan / TronScan adapters | Live transaction retrieval and provider normalization |
| Data model | Pydantic | Backend request/response validation |
| Reporting | ReportLab | PDF report generation |
| Persistence | SQLite + app-level JSON/cache data | Case storage and data access helpers |
| Validation & tests | pytest | Existing backend regression tests |
| Environment config | Python dotenv | `.env`-based settings and provider keys |

## Local setup

### 1) Backend

From the repository root:

```powershell
cd backend
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m uvicorn main:app --reload --port 8000
```

The backend exposes:

- `GET /health`
- `POST /trace`
- case and report endpoints under `backend/api/`

### 2) Frontend

```powershell
cd frontend
npm install
npm run dev -- --host 127.0.0.1 --port 5173
```

Then open:

- http://127.0.0.1:5173

## Environment and configuration

Copy and adjust values in `backend/.env` from `backend/.env.example`.

Required and optional settings include:

```env
USE_ETHERSCAN=true
ETHERSCAN_API_KEY=your_etherscan_key
TRONSCAN_API_KEY=your_tronscan_key
DEMO_MODE=false
FRONTEND_URL=http://127.0.0.1:5173
PUBLIC_DEMO_CASE_ID=CASE-DEMO-REAL
REQUEST_TIMEOUT=15
MAX_RETRIES=3
MAX_TRACE_WALLETS=25
MAX_TRACE_TRANSACTIONS=500
TRACE_TIMEOUT_SECONDS=45
```

Notes:

- Live provider access requires valid API keys and a matching chain configuration.
- Demo mode is intentionally opt-in and should remain off for real investigation work.
- Never commit `.env` files, provider keys, or user credentials.

## Investigation flow

1. A user enters a case identifier and wallet address in the frontend.
2. The frontend submits the request to the backend `POST /trace` endpoint.
3. The backend validates the address and chain, then retrieves live or cached transaction data.
4. The trace engine builds a bounded graph and extracts relevant wallet relationships.
5. Risk heuristics, VASP matching, and evidence assembly are applied.
6. The response includes graph data, suspicious-path findings, and evidence details.

## Testing and verification

### Backend tests

From the repository root, the current project pattern is:

```powershell
cd "C:\Users\Divyanshu\CRYPTO-TRACE-"
$env:PYTHONPATH = "."
python -m pytest backend/tests -q
```

### Frontend build

```powershell
cd frontend
npm run build
```

### Current verification status

- Frontend production build: succeeded in the verified environment (`npm run build` completed successfully).
- Backend pytest: requires a writable temporary directory. In this environment, pytest can fail with a `PermissionError` while creating temp folders under the Windows user temp area. This is an environment constraint rather than a source-code regression in the repository itself.

## Security and responsible use

This project is intended for public blockchain research and investigation support. It does not provide private identity resolution, law-enforcement enforcement, or direct legal action.

Please refer to [SECURITY.md](./SECURITY.md) for project-specific guidance on secrets, API key handling, validation, data handling, and reporting vulnerabilities.

## Contributing

Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution expectations, branch workflow, testing guidance, and repo hygiene rules.

## License status

There is no explicit license file in the current repository. Before the project is published broadly, the team or owners should decide on an appropriate open-source license. This repository should not be treated as if it has an assumed license.

## Documentation and accuracy notes

- This README reflects the repository as it exists today and intentionally avoids claiming unsupported functionality.
- It is designed to be accurate, concise, and operationally useful for local setup and verification.
- Certain demo or historical artifacts may be present in the repository and should be treated as supporting evidence, not as a statement of full product maturity.

## Final note

CryptoTrace is a focused prototype for blockchain tracing and investigation workflows. It is best understood as a public-data forensic tool and an engineering prototype rather than a full operational platform.
