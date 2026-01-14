# Project Sentinel: Forensic Triage Suite

## Project Overview
Project Sentinel is a custom-built **Forensic Triage Tool** developed in PowerShell. It is designed for Rapid Incident Response, allowing security engineers to capture a "Point-in-Time" snapshot of a system's volatile memory, network sockets, and persistence mechanisms.

## Forensic Findings (System Audit)
During the execution of this tool on a live Windows 10/11 environment, the following artifacts were captured and analyzed:

### 1. Network Surface Analysis
* **Ports 135/445 (RPC/SMB):** Identified active listeners. While standard for Windows, these represent a high-risk surface for lateral movement.
* **Port 7070 Discovery:** Detected a non-standard listener on Port 7070. Through PID correlation (PID 4572), this was verified as a legitimate service, ruling out a backdoor.

### 2. Process & Resource Integrity
* **Subsystem Validation:** Successfully identified `vmmemWSL` (PID 1156) consuming 600MB+ of RAM, confirming active virtualization layers.
* **Kernel Monitoring:** Validated that the `System` process (PID 4) maintained expected CPU handle counts, indicating no rootkit interference.

## Features
- **Automated Socket Mapping:** Links open ports directly to Process IDs (PIDs).
- **Persistence Auditing:** Scans for unauthorized startup commands and scheduled tasks.
- **Resource Profiling:** Identifies "Resource Hogs" that may indicate hidden crypto-miners or malware.

## How to Use
1. Open PowerShell as Administrator.
2. Set Execution Policy: `Set-ExecutionPolicy RemoteSigned -Scope Process`
3. Execute: `.\SentinelAudit.ps1`
4. Review generated `Forensic_Report.txt`.

## Skills Demonstrated
* **Incident Response (IR):** Ability to collect volatile evidence.
* **Windows Internals:** Understanding of PIDs, Handles, and Sockets.
* **Security Automation:** Reducing TTD (Time to Detect) via scripting.
