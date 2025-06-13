Write-Host "[*] Searching for secrets inside extracted files..." -ForegroundColor Cyan
$patterns = "token", "secret", "authorization", "apikey", "client_id", "bearer"
Get-ChildItem -Recurse extracted | ForEach-Object {
    foreach ($pattern in $patterns) {
        Select-String -Path $_.FullName -Pattern $pattern -SimpleMatch | ForEach-Object {
            $_.Line | Out-File -Append -FilePath results\\creds.txt
        }
    }
}
