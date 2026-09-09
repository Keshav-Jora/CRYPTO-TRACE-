# Security guidance

This repository is a blockchain investigation prototype that depends on public blockchain data, provider keys, and local development configuration. The project is intentionally scoped to investigation and research workflows, not to production-grade identity or financial enforcement systems.

## 1. Secrets and environment variables

- Do not commit `.env` files or any live credentials.
- Keep provider keys such as `ETHERSCAN_API_KEY` and `TRONSCAN_API_KEY` in local environment variables or a local `.env` file that is excluded from source control.
- Treat JWT secrets and salts as sensitive values and generate strong random values for any non-local deployment.
- Do not paste API keys into screenshots, issue comments, logs, or chat threads.

## 2. Public blockchain data

- Cryptotrace works from publicly accessible blockchain information and should not be treated as private or privileged data.
- Public addresses and transaction data are not equivalent to real-world identity proof.
- Matching to VASP or exchange labels is an investigative signal, not definitive legal attribution.

## 3. Input validation and request handling

- Requests are validated at the API boundary via Pydantic and backend validation logic.
- Wallet addresses are checked for format and chain compatibility before provider access.
- The backend enforces bounded trace depth and transaction limits to reduce abuse and noisy traces.

## 4. CORS and frontend access

- The backend CORS configuration is intentionally limited to configured frontend origins.
- Local development origins are accepted for Vite-based frontend use.
- Production deployments should review `FRONTEND_URL` and `CORS_ORIGINS` before enabling external access.

## 5. Authentication and session handling

- Local authentication is handled through JWT-style tokens and backend validation checks.
- Tokens should be kept in secure client storage and never exposed in public repos.
- The project should not be treated as a hardened identity platform without a separate security review.

## 6. Reporting vulnerabilities

If you identify a security issue in the repository or environment:

- Do not disclose it publicly in a way that exposes live credentials or exploitable details.
- Report the issue privately to the project owner or responsible maintainer.
- Include reproduction steps, impact, and any remediation suggestions if available.

## 7. Safe operational advice

- Run the backend and frontend locally with only the required environment values.
- Validate provider configuration before using live API calls.
- Prefer demo or cache-backed flows for testing when provider access is unavailable.
- Keep local testing data isolated from production-like or shared environments.
