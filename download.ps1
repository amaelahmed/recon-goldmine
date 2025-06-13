Write-Host "[*] Downloading leaked .zip files..." -ForegroundColor Cyan
$urls = Get-Content results\\leaks.txt

foreach ($url in $urls) {
    if ($url -like "*.zip") {
        try {
            $filename = Split-Path -Path $url -Leaf
            Invoke-WebRequest -Uri $url -OutFile "downloads\\$filename"
            Expand-Archive -Path "downloads\\$filename" -DestinationPath extracted -Force
            Write-Host "[+] Extracted:" $filename -ForegroundColor Green
        } catch {
            Write-Host "[-] Failed to download or extract:" $url
        }
    }
}
