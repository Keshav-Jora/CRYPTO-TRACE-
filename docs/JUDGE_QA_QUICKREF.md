# CryptoTrace reviewer quick reference

## Purpose

CryptoTrace is a public-blockchain investigation prototype. It turns configured provider records into a bounded wallet-flow graph and an evidence ledger for analyst review. It does not claim identity, ownership, or criminal attribution.

## Demonstrable capabilities

- Validates supported EVM and TRON wallet formats before retrieval.
- Retrieves configured Etherscan or TronScan data and normalizes it for a common trace flow.
- Bounds traversal to three hops with cycle, wallet-count, transaction-count, and timeout safeguards.
- Separates evidence-based risk scoring from trace confidence.
- Adds exact-match local VASP/service labels as context only.
- Saves cases and exports investigator PDF, victim-friendly PDF, and CSV evidence reports.

## Main routes

| Method | Route | Purpose |
| --- | --- | --- |
| `GET` | `/health` | Health check |
| `POST` | `/trace` | Run a bounded trace |
| `GET` | `/cases/{case_id}` | Load a permitted saved case |
| `GET` | `/reports/{case_id}.pdf` | Investigator report |
| `GET` | `/reports/{case_id}.victim.pdf` | Plain-language report |

Authentication routes are under `/auth`; case listings require a bearer token. Report and case access is restricted to the owner unless the saved case is marked public.

## Reviewer checks

1. Configure the applicable provider key in `backend/.env`.
2. Start the backend from the repository root with `python -m uvicorn backend.main:app --reload --port 8000`.
3. Start the frontend from `frontend/` with `npm run dev -- --host 127.0.0.1 --port 5173`.
4. Register, trace a valid wallet, inspect the graph and evidence ledger, then open a report.
5. Run `$env:PYTHONPATH = "."; python -m pytest backend/tests -q` from the root.

## Important constraints

- Demo data is explicit opt-in; a failed live lookup is not silently represented as live data.
- Provider access, rate limits, bounded traversal, and off-chain activity limit coverage.
- Labels, clusters, risk signals, and investigative leads require analyst review and are not proof of identity or wrongdoing.
