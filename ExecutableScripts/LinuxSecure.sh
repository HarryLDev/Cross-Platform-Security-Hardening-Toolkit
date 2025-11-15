#!/bin/bash
# =============================================
# LinuxSecure.sh
# Ubuntu Security Audit Script (Auto-Save Version)
# =============================================

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
output="ubuntu_audit_$timestamp.txt"

log() {
    echo "$1" | tee -a "$output"
}

log "=== Firewall (UFW) Status ==="
sudo ufw status 2>&1 | tee -a "$output"

log ""
log "=== AppArmor Profiles ==="
sudo apparmor_status 2>&1 | tee -a "$output"

log ""
log "=== Security Updates Available ==="
sudo unattended-upgrade --dry-run --debug 2>&1 | grep "Packages that would be upgraded" | tee -a "$output"

log ""
log "=== Open Ports ==="
sudo ss -tuln | tee -a "$output"

log ""
log "Audit saved to $output"
