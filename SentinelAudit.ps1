# Forensic Triage Tool
$Report = "C:\Forensic_Report.txt"
"--- PROJECT SENTINEL ---" | Out-File $Report
Write-Host "Checking Network..." -ForegroundColor Cyan
netstat -ano | Select-Object -First 10 | Out-File $Report -Append
Write-Host "Checking Processes..." -ForegroundColor Cyan
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10 | Out-File $Report -Append
Write-Host "DONE! Check C:\Forensic_Report.txt" -ForegroundColor Green