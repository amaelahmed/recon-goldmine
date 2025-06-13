param([string]$domain)

Write-Host "`n===========================" -ForegroundColor Cyan
Write-Host "  🔍 RECON GOLDMINE TOOL" -ForegroundColor Yellow
Write-Host "===========================" -ForegroundColor Cyan
Write-Host "`n[*] Finding subdomains using crt.sh..."

$encoded = [uri]::EscapeDataString("%.$domain")
$url = "https://crt.sh/?q=$encoded&output=json"

try {
    $response = Invoke-RestMethod -Uri $url -UseBasicParsing
    $subs = $response | ForEach-Object { $_.name_value } | Sort-Object -Unique
    $subs | Out-File -FilePath "results\\all_subs.txt" -Encoding ascii
    Write-Host "[+] Found $($subs.Count) subdomains. Saved to results\\all_subs.txt"
} catch {
    Write-Host "[-] Failed to fetch subdomains"
}
