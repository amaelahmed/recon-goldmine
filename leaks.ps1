Write-Host "[*] Searching for leaked files (.zip, .env, etc)..." -ForegroundColor Cyan
$urls = Get-Content results\\all_urls.txt
$keywords = @(".zip", ".env", ".sql", ".conf", ".json", "token", "auth", "key")

foreach ($url in $urls) {
    foreach ($kw in $keywords) {
        if ($url -like "*$kw*") {
            Write-Host "[!] Leak found:" $url -ForegroundColor Yellow
            $url | Out-File -Append -FilePath results\\leaks.txt
        }
    }
}
