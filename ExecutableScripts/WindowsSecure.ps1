# =============================================
# WindowsSecure.ps1
# Windows Security Audit Script (Auto-Save Version)
# =============================================

# Create timestamped output file
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$outputFile = "windows_audit_$timestamp.txt"

# Function to write to both screen and file
function Write-Log {
    param([string]$text)
    Write-Output $text | Tee-Object -FilePath $outputFile -Append
}

Write-Log "=== Firewall Status ==="
Get-NetFirewallProfile | Select Name, Enabled | Out-String | Write-Log

Write-Log "`n=== Antivirus Status ==="
Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct `
    | Select displayName, productState | Out-String | Write-Log

Write-Log "`n=== Running Services (Top 20) ==="
Get-Service | Where-Object {$_.Status -eq "Running"} | Select -First 20 `
    | Out-String | Write-Log

Write-Log "`n=== Open Ports ==="
Get-NetTCPConnection | Select LocalAddress, LocalPort, State | Sort-Object LocalPort `
    | Out-String | Write-Log

Write-Log "`nAudit saved to $outputFile"
