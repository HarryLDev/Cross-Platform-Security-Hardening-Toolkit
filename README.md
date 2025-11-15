# Cross-Platform Security Hardening Toolkit

A collection of automated security auditing and hardening scripts for Windows, macOS, and Ubuntu.
This toolkit checks for common misconfigurations, evaluates system security settings, and generates a readable report for each platform.

Ideal for IT professionals, junior cybersecurity analysts, MSP environments, and anyone learning system hardening or automation.

## Overview

This project provides three lightweight, easy-to-run scripts:

-Windows (PowerShell): WindowsSecure.ps1

-macOS (Bash): MacSecure.sh

-Ubuntu Linux (Bash): LinuxSecure.sh

Each script performs a full security audit and outputs a detailed text report summarizing current system protections and vulnerabilities.

## Features

###  Windows (WindowsSecure.ps1)
-Check last installed Windows Update

-Confirm firewall status for all profiles

-Audit password policy

-Detect SMBv1 (deprecated & insecure)

-List local admin accounts

-Check unnecessary services (e.g., Remote Registry)

-Generate a report to WindowsHardeningReport.txt

###  macOS (MacSecure.sh)

-Verify macOS Firewall status

-Check Gatekeeper protection

-Read System Integrity Protection (SIP) status

-Confirm FileVault disk encryption

-Check automatic update settings

-List all admin users

-Display network services & sharing settings

-Saves results to MacHardeningReport.txt

###  Ubuntu (LinuxSecure.sh)

-Show available OS updates

-Audit UFW firewall status

-Check SSH configuration (root login, password auth)

-Display failed login attempts

-Review password policy (PAM/pwquality)

-List sudo users

-Review running services

-Saves a full report to LinuxHardeningReport.txt
