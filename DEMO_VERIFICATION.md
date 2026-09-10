# Demonstration artifacts

The `demo_verification/` directory contains captured files from an earlier end-to-end Ethereum demonstration:

- `real_case_trace.json`: recorded trace response.
- `live_graph_payload.json`: recorded graph payload.
- `CASE-DEMO-REAL.pdf` and `CASE-DEMO-REAL.csv`: generated report artifacts.

These files are historical reference material, not a current acceptance baseline. Public-chain activity, provider responses, local label data, and the application's risk heuristics can change over time. In particular, values inside a captured response must not be treated as the score or behavior of the current code.

The artifacts intentionally do not identify the operator account used during the original run. To verify the current application, use your own authorized account and a valid public wallet, configure live provider keys in `backend/.env`, and follow the setup and validation steps in the [root README](README.md).

For an offline demonstration, explicitly set `DEMO_MODE=true`. The UI and API identify that source as demo data; do not present it as live retrieval.
