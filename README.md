# active-directory-home-lab
Windows Server Active Directory home lab documenting virtualization, networking, domain services, administration, and security.

# Active Directory Home Lab

## Project Overview

This project documents the creation of a virtualized Windows Server environment used to learn and practice enterprise IT administration.

The lab will be used to configure Active Directory Domain Services (AD DS), Domain Name System (DNS), user and group management, Group Policy, Windows client domain membership, networking, and security.

## Current Lab Environment

### Host Computer
- Windows 11 Pro
- Hyper-V virtualization
- AMD Ryzen 9 7950X
- 32 GB RAM

### Virtual Network
- Hyper-V internal virtual switch
- Switch name: `AD-Lab`
- Isolated from the physical home network

### Domain Controller
- Virtual machine: `AZATHOTH-DC01`
- Windows Server 2025 Standard Evaluation
- Desktop Experience
- Generation 2 Hyper-V VM
- 2 virtual processors
- 4 GB startup memory
- 80 GB dynamically expanding VHDX
- Secure Boot enabled

## Current Project Status

Completed:
- Enabled Hyper-V
- Created isolated `AD-Lab` virtual network
- Created Windows Server virtual machine
- Installed Windows Server 2025
- Renamed server to `AZATHOTH-DC01`
- Verified successful reboot after rename
- Configured local time zone

Next:
- Configure static IP addressing
- Install Active Directory Domain Services (AD DS)
- Promote `AZATHOTH-DC01` to a domain controller
- Configure Domain Name System (DNS)
- Create organizational units, users, and groups
- Add a Windows client VM to the domain
- Configure Group Policy

## Skills Demonstrated

- Hyper-V virtualization
- Virtual machine provisioning
- Virtual networking
- Windows Server administration
- Server naming and configuration
- Infrastructure planning
- Technical documentation
