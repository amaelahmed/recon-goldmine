Write-Host "[*] Gathering archived URLs from Wayback Machine and GAU..." -ForegroundColor Cyan
$subs = Get-Content results\\live.txt
$allUrls = @()

foreach ($sub in $subs) {
    $wayback = curl "http://web.archive.org/cdx/search/cdx?url=$sub/*&output=text&fl=original" -UseBasicParsing
    $gau = curl "https://gau.io/api/$sub" -UseBasicParsing
    $allUrls += $wayback
    $allUrls += $gau
}

$allUrls | Sort-Object -Unique | Out-File results\\all_urls.txt
