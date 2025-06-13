# 🔍  Ultimate Bug Bounty Recon Workflow
🎯 "From recon to P1s – turn forgotten assets into goldmines."

This tool helps you find vulnerabilities like:
- 🕵️ Subdomain takeovers
- 🔐 Token/API key leaks
- 🗂️ Exposed `.env`, `.zip`, `.sql` files
- 💥 Auth misconfigs
- ☁️ Open cloud buckets (S3/GCP)

## 🤖 Even Non-Coders Can Use This

Just run:

```powershell
.\recon.ps1 -domain "target.com"

🚨 Real-World P1 Finds Using This Workflow:
Uber – OAuth privilege escalation

Dropbox – API token leaked via public .zip

Doordash – WAF bypass using reverse proxy tricks

Zoom – Exposed misconfigured S3 bucket

Atlassian – JS file with embedded secrets → Full privilege escalation

Built by @amaelahmed 💀
