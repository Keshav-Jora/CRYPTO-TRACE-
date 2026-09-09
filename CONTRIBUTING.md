# Contributing

CryptoTrace is a focused blockchain investigation prototype. Contributions should stay aligned with the project’s real scope: blockchain tracing, bounded graph analysis, evidence handling, risk heuristics, and investigation-oriented documentation.

## Contribution principles

- keep changes narrow and reviewable
- do not broaden the project into unrelated product features
- avoid source changes unless the task clearly requires them
- document limitations and environment constraints explicitly
- do not add secrets or local credential files to the repository

## Workflow

1. create a feature branch from the current working branch
2. keep changes scoped to the relevant subsystem
3. validate the smallest relevant test or build step
4. document any environment-specific issues clearly
5. avoid unrelated refactors or broad UI redesigns

## Branch naming

Use descriptive names such as:

- `feature/bounded-trace-fix`
- `fix/tron-address-validation`
- `docs/repository-polish`

## Testing expectations

### Backend

```powershell
cd .
$env:PYTHONPATH = "."
python -m pytest backend/tests -q
```

### Frontend build

```powershell
cd frontend
npm run build
```

If a validation step fails because of a local environment constraint, record that explicitly instead of claiming a pass.

## Documentation expectations

- keep README and docs technically accurate
- avoid unsupported claims or overstatement
- explain limitations when a feature is speculative or environment-dependent
- do not invent screenshots, workflows, or assets that are not in the repository

## Security expectations

- never commit `.env` files or API keys
- do not share credentials in PRs, screenshots, or logs
- treat public blockchain data as informational and contextual rather than identity-proof evidence

## Scope discipline

The repository should remain focused on blockchain investigation and analysis workflows, not unrelated app features, business systems, or unrelated infrastructure refactors.

## Pull request guidance

- summarize the change and why it matters
- include the exact verification commands used
- note any environment-specific limitations
- keep the diff focused and readable

## Final check

Before opening or updating a PR, verify that the change is consistent with the project’s actual architecture and does not modify application behavior unless absolutely required by the task.
