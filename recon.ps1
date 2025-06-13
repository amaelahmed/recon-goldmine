param([string]$domain)
Write-Host "Starting Full Recon Goldmine Recon..." -ForegroundColor Magenta

.\subdomains.ps1 -domain $domain
.\livecheck.ps1
.\waybackurls.ps1
.\leaks.ps1
.\download.ps1
.\secrets.ps1
.\validate.ps1

Write-Host "`n✅ Recon complete. Check the 'results' folder." -ForegroundColor Cyan
