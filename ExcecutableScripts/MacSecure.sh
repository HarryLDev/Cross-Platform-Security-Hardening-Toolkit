#!/bin/bash
# =============================================
# MacSecure.sh
# macOS Security Audit Script (Auto-Save Version)
# =============================================

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output="macos_audit_$timestamp.txt"

log() {
    echo "$1" | tee -a "$output"
}

log "=== Firewall Status ==="
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate 2>&1 | tee -a "$output"

log ""
log "=== Gatekeeper Status ==="
spctl --status | tee -a "$output"

log ""
log "=== System Integrity Protection (SIP) Status ==="
csrutil status | tee -a "$output"

log ""
log "=== Open Ports ==="
sudo lsof -i -P | grep LISTEN | tee -a "$output"

log ""
log "Audit saved to $output"
