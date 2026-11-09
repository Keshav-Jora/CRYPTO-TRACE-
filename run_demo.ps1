# CryptoTrace local-demo reminder
# Run commands from the repository root. This script does not start services.

Write-Host "CryptoTrace local setup"
Write-Host "1) Backend (run once):"
Write-Host "   python -m venv .venv"
Write-Host "   .\.venv\Scripts\Activate.ps1"
Write-Host "   python -m pip install -r backend/requirements.txt"
Write-Host "   Copy-Item backend/.env.example backend/.env"
Write-Host "2) Start the backend from the repository root:"
Write-Host "   python -m uvicorn backend.main:app --reload --port 8000"
Write-Host "3) In a second terminal, start the frontend:"
Write-Host "   cd frontend"
Write-Host "   npm install"
Write-Host "   npm run dev -- --host 127.0.0.1 --port 5173"
Write-Host "4) Open http://127.0.0.1:5173"
Write-Host "See README.md for provider configuration and validation commands."
