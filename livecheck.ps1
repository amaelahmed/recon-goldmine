Write-Host "[*] Checking which subdomains are live..." -ForegroundColor Cyan
Get-Content results\\all_subs.txt | ForEach-Object {
    try {
        $res = Invoke-WebRequest -Uri ("http://" + $_) -UseBasicParsing -TimeoutSec 5
        if ($res.StatusCode -eq 200) {
            Write-Host "[+] LIVE:" $_ -ForegroundColor Green
            $_ | Out-File -Append -FilePath results\\live.txt
        }
    } catch {}
}

