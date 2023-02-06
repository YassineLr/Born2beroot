# Born2beroot

## Summary
1. [Introduction](#introduction)
    - [What is a Virtual Machine?](#Virtual-Machine)
    - [How do Virtual Machines work?](#Virtual-Machines-work)
    - [What is LVM?](#What-is-LVM?)
    - [What is AppArmor?](#What-is-AppArmor?)
    - [What is the difference between Apt and Aptitute?](#Apt-and-Aptitute)
    - [How to use SSH?](#How-to-use-SSH?)
    - [How to implement UFW with SSH?](#UFW-with-SSH)
    - [What is cron and what is wall?](#what-is-cron)
2. [Installation](#installation)
3. [*sudo*](#sudo)
    - [Step 1: Installing sudo](#step-1-installing-sudo)
    - [Step 2: Adding User to sudo Group](#step-2-adding-user-to-sudo-group)
    - [Step 3: Running root-Privileged Commands](#step-3-running-root-privileged-commands)
    - [Step 4: Configuring sudo](#step-4-configuring-sudo)
4. [SSH](#ssh)
    - [Step 1: Installing & Configuring SSH](#step-1-installing--configuring-ssh)
    - [Step 2: Installing & Configuring UFW](#step-2-installing--configuring-ufw)
    - [Step 3: Connecting to Server via SSH](#step-3-connecting-to-server-via-ssh)
5. [User Management](#user-management)
    - [Step 1: Setting Up a Strong Password Policy](#step-1-setting-up-a-strong-password-policy)
       - [Password Age](#password-age)
       - [Password Strength](#password-strength)
    - [Step 2: Creating a New User](#step-2-creating-a-new-user)
    - [Step 3: Creating a New Group](#step-3-creating-a-new-group)
6. [*cron*](#cron)
    - [Setting Up a *cron* Job](#setting-up-a-cron-job)
7. [Monitoring](#monitoring)

## Introduction

### <a name="Virtual-Machine">What is a Virtual Machine?</a>
<p>
A virtual machine is a software-based simulation of a physical computer that runs its 
own operating system and applications as if it were a separate physical computer. 
The virtual machine acts as a completely isolated environment, protected from 
the host operating system and other virtual machines. The host machine runs a 
hypervisor, which allocates and manages the physical resources of the host, 
such as CPU, memory, and storage, and presents them to the virtual machine 
as virtualized resources. The virtual machine communicates with the hypervisor,
not with the physical hardware, which allows multiple virtual machines to run on 
the same physical machine, isolated from each other and sharing the physical 
resources.
</p>
