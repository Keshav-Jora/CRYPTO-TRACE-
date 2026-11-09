# CryptoTrace backend

The backend is a FastAPI service for address validation, provider retrieval, normalization, bounded tracing, case persistence, and report generation.

## Run locally

Run from the repository root so Python can resolve the `backend` package:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r backend/requirements.txt
Copy-Item backend/.env.example backend/.env
python -m uvicorn backend.main:app --reload --port 8000
```

The service is available at <http://127.0.0.1:8000>; `GET /health` returns a health response.

## Key areas

- `adapters/`: Etherscan and TronScan provider adapters.
- `api/`: authentication, case, trace, report, and schema routes.
- `services/`: validation, retrieval, normalization, attribution, persistence, VASP matching, and report generation.
- `graph/` and `risk/`: bounded graph metrics and heuristic support.
- `data/`: checked-in cache and local VASP labels used for explicit demo/context workflows.
- `tests/`: backend regression tests.

## Configuration

Copy `.env.example` to `.env`. Live EVM traces require `ETHERSCAN_API_KEY`; live TRON traces require `TRONSCAN_API_KEY`. `DEMO_MODE=true` is explicit opt-in for cached demonstration data.

Do not expose backend secrets through frontend environment variables. Production browser origins are configured with `FRONTEND_URL` and `CORS_ORIGINS`.

## Test

```powershell
$env:PYTHONPATH = "."
python -m pytest backend/tests -q
```

See the [root README](../README.md) for the API overview, full configuration reference, and deployment notes.
