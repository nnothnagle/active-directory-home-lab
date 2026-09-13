# Active Directory Home Lab

A virtualized Windows enterprise environment built to practice system administration, networking, identity management, and security.

## Project Overview

This project documents the design and deployment of an isolated Active Directory home lab using Hyper-V.

The environment currently includes a Windows Server 2025 Domain Controller and a Windows 11 Pro client. The lab will be expanded to demonstrate user and group administration, Organizational Units, Group Policy, security controls, and troubleshooting.

## Lab Environment

### Host Computer

- Windows 11 Pro
- Hyper-V virtualization
- AMD Ryzen 9 7950X
- 32 GB RAM

### Virtual Network

- Hyper-V internal virtual switch
- Switch name: `AD-Lab`
- Network: `10.10.10.0/24`
- Isolated from the physical home network

## Virtual Machines

| Device | Operating System | Role | IP Address | DNS Server |
|---|---|---|---|---|
| `AZATHOTH-DC01` | Windows Server 2025 Standard Evaluation | Domain Controller and DNS server | `10.10.10.10` | `10.10.10.10` |
| `NYARL-PC01` | Windows 11 Pro | Domain client | `10.10.10.20` | `10.10.10.10` |

### Domain Controller Configuration

- Computer name: `AZATHOTH-DC01`
- Domain: `azathoth.lab`
- Active Directory Domain Services (AD DS)
- Domain Name System (DNS)
- Generation 2 Hyper-V virtual machine
- 2 virtual processors
- 4 GB startup memory
- 80 GB dynamically expanding virtual hard disk
- Secure Boot enabled

### Windows Client Configuration

- Computer name: `NYARL-PC01`
- Windows 11 Pro
- Static IPv4 address: `10.10.10.20/24`
- Preferred DNS server: `10.10.10.10`
- Domain membership: Not joined yet

## Completed Work

- Enabled Hyper-V
- Created the isolated `AD-Lab` virtual network
- Created and configured the Windows Server virtual machine
- Installed Windows Server 2025
- Renamed the server to `AZATHOTH-DC01`
- Assigned the server static IP address `10.10.10.10`
- Installed Active Directory Domain Services
- Promoted `AZATHOTH-DC01` to a Domain Controller
- Created the `azathoth.lab` domain
- Installed and configured Domain Name System
- Created the Windows 11 Pro client virtual machine
- Renamed the client to `NYARL-PC01`
- Assigned the client static IP address `10.10.10.20/24`
- Configured the client to use `10.10.10.10` for DNS
- Verified network connectivity between the client and Domain Controller
- Verified DNS resolution for `azathoth.lab`

## Next Steps

- Join `NYARL-PC01` to the `azathoth.lab` domain
- Create Organizational Units (OUs)
- Create domain users and security groups
- Configure Group Policy Objects (GPOs)
- Test domain sign-in from the Windows client
- Add security policies and administrative controls
- Document validation tests and troubleshooting
- Add network diagrams and screenshots

## Skills Demonstrated

- Hyper-V virtualization
- Virtual machine provisioning
- TCP/IP network configuration
- Static IPv4 addressing
- Active Directory Domain Services
- Domain Name System
- Windows Server administration
- Windows client configuration
- Network connectivity testing
- DNS troubleshooting
- Infrastructure planning
- Technical documentation
- Git and GitHub version control