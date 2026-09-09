# Contributing

This repository is best treated as a focused blockchain investigation prototype. Contributions should stay aligned with the project scope: tracing, bounded graph analysis, risk heuristics, investigation workflows, and documentation quality.

## Workflow

1. Create a feature branch from the current working branch.
2. Keep changes scoped to the assigned area.
3. Prefer small, reviewable diffs.
4. Do not add secrets, credentials, or local environment values to the repository.
5. Verify affected tests or build steps before opening or updating a PR.

## Branch expectations

Use clear branch names that reflect the work, for example:

- `feature/trace-bounds`
- `fix/tron-provider-validation`
- `docs/readme-polish`

## Testing expectations

Run the smallest relevant validation for the change.

Backend tests (from the repository root):

```powershell
$env:PYTHONPATH = "."
python -m pytest backend/tests -q
```

Frontend build validation:

```powershell
cd frontend
npm run build
```

If a test or build fails because of local environment constraints, document the failure clearly and do not claim a pass without evidence.

## Documentation expectations

- Keep README and project docs technically accurate.
- Do not claim capabilities that are not supported by the code or verified infrastructure.
- When a feature or flow is uncertain, document the limitation instead of describing it as complete.

## Security expectations

- Never add `.env` files, API keys, or secrets to git.
- Do not expose provider keys in logs, screenshots, or PR descriptions.
- Treat public blockchain data as informational only; it is not proof of identity or guilt.

## Pull request guidance

- Summarize what changed and why.
- Include verification commands and brief results.
- Keep scope narrow and avoid unrelated refactors.
- Be explicit about environment-specific limitations.

## Scope discipline

This project should not drift into unrelated areas such as extensive frontend redesigns, database migrations, or unrelated business workflows unless the task explicitly demands them.
