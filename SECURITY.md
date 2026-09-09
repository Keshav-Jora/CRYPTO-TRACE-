# Security Guidance

CryptoTrace is a blockchain investigation prototype built around public blockchain data, provider configuration, and analyst workflows. It should be treated as an investigation-support tool rather than a production-grade identity, forensic, or financial enforcement system.

## 1. Secrets and environment variables

- Never commit `.env` files, API keys, JWT secrets, or salts.
- Keep `ETHERSCAN_API_KEY`, `TRONSCAN_API_KEY`, and related provider credentials in a local environment file or secure secret store.
- Do not paste provider keys into chat threads, screenshots, PR descriptions, logs, or documentation examples.
- Treat all JWT material as sensitive and rotate it if exposed.

## 2. Public blockchain data and attribution limits

- The system relies on public transaction records and provider data.
- Public chain data is not proof of identity, ownership, or criminality.
- VASP and exchange labels are contextual signals only; they do not establish legal attribution.
- Risk scoring and suspicious-path analysis should be treated as investigative leads, not definitive conclusions.

## 3. Request validation and input safety

- Backend requests are validated with Pydantic models and address checks.
- Wallet addresses are validated for the requested chain before provider access.
- Trace depth and transaction limits are part of the project’s bounded investigation model.
- Input validation is not a substitute for broader production security controls.

## 4. Frontend and backend access control

- The backend uses CORS configuration for configured frontend origins.
- Local development with Vite is permitted; production deployments should review `FRONTEND_URL` and `CORS_ORIGINS` before exposing external access.
- Only the required secret values should be exposed to runtime environments.

## 5. Authentication and session handling

- Basic auth and case access flows are implemented with backend validation and tokens.
- Tokens should be stored only in secure client-side storage and treated as sensitive credentials.
- The project is not a hardened enterprise identity system without an additional security review.

## 6. Responsible vulnerability reporting

If you identify a security or configuration issue:

- do not disclose it publicly in a way that exposes live credentials or exploit details
- report it privately to the project owner or maintainer
- include reproduction steps, scope, and available mitigation guidance

## 7. Safe operational practices

- use local `.env` files only for development and testing
- validate provider configuration before live tracing
- prefer demo or cache-backed workflows for non-live experiments
- keep local testing data isolated from shared or production-like environments

## 8. Risk posture

CryptoTrace is a public-data investigative prototype rather than a government-grade enforcement system. Its security posture should be treated appropriately: useful for analyst workflows, but not a substitute for production controls, legal review, or forensic-grade evidentiary handling.
