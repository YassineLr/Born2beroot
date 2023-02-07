# Born2beroot

## Summary
1. [Introduction](#introduction)
    - [What is a Virtual Machine and how it works?](#Virtual-Machine)
    - [What is a Hypervisor](#Hypervisor)
    - [What is a Server](#Server)
    - [What is LVM?](#LVM)
    - [What is AppArmor?](#AppArmor?)
    - [Linux Package Management](#Package_management)
    - [What is SSH and how to use it?](#What-is-SSH?)
    - [What is UFW?](#UFW-with-SSH)
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

### <a name="Hypervisor">What is a Virtual Machine?</a>

a hypervisor is a type of software it runs in the top of physical hardware of a computer
and creates a virtual machines that run in the top of the hypervisor .
The hypervisor abstracts the physical hardware resources, such as the CPU, memory, and 
storage, and allocates them to the VMs as virtual resources.
This allows multiple operating systems to run on the same physical computer as separate,
isolated environments, each with its own virtualized hardware resources. Some hypervisors
can also be integrated into the firmware of a computer's motherboard, but they still
function as software in the sense that they provide the virtualization capability.

### <a name="Server">What is a Server ?</a>

A server is a computer system designed to be provide services to other computer or devices
on a network . it runs specialized software to handle requests from clients, perform
specific functions, and manage and store data.
Servers can be dedicated (used for a specific purpose) or general-purpose 
(able to run multiple services), and can be hardware- or software-based. 
Common examples of server applications include web servers, email servers, 
database servers, file servers, and application servers. Servers are essential 
for many organizational and personal computing tasks, enabling clients to access 
and share data, applications, and other resources over a network.

### <a name="LVM">What is LVM ?</a>

Logical volume management (LVM) is a form of storage virtualization that offers system administrators a more flexible approach to managing disk storage space than traditional partitioning. This type of virtualization tool is located within the device-driver stack on the operating system. It works by chunking the physical volumes (PVs) into physical extents (PEs). The PEs are mapped onto logical extents (LEs) which are then pooled into volume groups (VGs). These groups are linked together into logical volumes (LVs) that act as virtual disk partitions and that can be managed as such by using LVM.</br>
The goal of LVM is to facilitate managing the sometimes conflicting storage needs of multiple end users. Using the volume management approach, the administrator is not required to allocate all disk storage space at initial setup. Some can be held in reserve for later allocation. The sysadmin can use LVM to segment logically sequential data or combine partitions, increasing throughput and making it simpler to resize and move storage volumes as needed. Storage volumes may be defined for various user groups within the enterprise, and new storage can be added to a particular group when desired without requiring user files to be redistributed to make the most efficient use of space. When old drives are retired, the data they contain can be transitioned to new drives -- ideally without disrupting availability of service for end users.

## <a name="LVM">What is Apparmor ?</a>
AppArmor is a Mandatory Access Control (MAC) system which is a kernel (LSM) enhancement to confine programs to a limited set of resources. AppArmor's security model is to bind access control attributes to programs rather than to users. AppArmor confinement is provided via profiles loaded into the kernel, typically on boot. AppArmor profiles can be in one of two modes: enforcement and complain. Profiles loaded in enforcement mode will result in enforcement of the policy defined in the profile as well as reporting policy violation attempts (either via syslog or auditd). Profiles in complain mode will not enforce policy but instead report policy violation attempts.

AppArmor differs from some other MAC systems on Linux: it is path-based, it allows mixing of enforcement and complain mode profiles, it uses include files to ease development, and it has a far lower barrier to entry than other popular MAC systems.

AppArmor is an established technology first seen in Immunix and later integrated into Ubuntu, Novell/SUSE, and Mandriva. Core AppArmor functionality is in the mainline Linux kernel from 2.6.36 onwards; work is ongoing by AppArmor, Ubuntu and other developers to merge additional AppArmor functionality into the mainline kernel.

### <a name="Package_management">Linux Package Management</a>

A package is an archive file containing multiple ".deb" files. The dpkg utility is 
used to install programs from the associated ".deb" file. APT makes updating and 
installing programs easier because many programs have dependencies

* [`dpkg`]    		- The dpkg is a tool to install, build, remove, and manage Debian packages.
    The primary and more user-friendly front-end for dpkg is aptitude.
* [`apt`]			- Apt provides a high-level command-line interface for the package 
    management system.
* [`aptitude`]		- Aptitude is an alternative to apt and is a high-level interface to 
    the package manager.
* [`snap`]			: Install, configure, refresh, and remove snap packages. Snaps enable 
    the secure distribution of the latest apps and utilities for the cloud, servers,
    desktops, and the internet of things.
* [`gem`]			: Gem is the front-end to RubyGems, the standard package manager for Ruby.
* [`pip`]			:  Pip is a Python package installer recommended for installing Python 
    packages that are not available in the Debian archive. It can work with version
    control repositories (currently only Git, Mercurial, and Bazaar repositories), 
    logs output extensively, and prevents partial installs by downloading all 
    requirements before starting installation.
* [`git`]			: Git is a fast, scalable, distributed revision  control system with an
    unusually rich command set that provides both high-level operations and full access
    to internals.

### <a name="What-is-SSH?">What is SSH and how to use it?</a>

SSH or **Secure Shell** is a **remote administration protocol that allows users to control and modify their servers** over the Internet thanks to an authentication mechanism. Provides a mechanism to authenticate a user remotely, transfer data from the client to the host, and return a response to the request made by the client.<br>
SSH was created as an alternative to Telnet, which does not encrypt the information that is sent. **SSH uses encryption techniques** to ensure that all client-to-host and host-to-client communications are done in encrypted form. One of the advantages of SSH is that a user using Linux or MacOS can use SSH on their server to communicate with it remotely through their computer's terminal. Once authenticated, that user will be able to use the terminal to work on the server.<br><br>
The command used to connect to a server with ssh is:

    ssh {username}@{IP_host} -p {port}
    
There are three different techniques that SSH uses to encrypt:
<ul>
 <li><b>Symmetric encryption:</b> a method that uses the same secret key for both encryption and decryption of a message, for both the client and the host. Anyone who knows the password can access the message that has been transmitted.</li>
 <li><b>Asymmetric encryption:</b> uses two separate keys for encryption and decryption. These are known as the public key and the private key. Together, they form the public-private key pair.</li>
 <li><b>Hashing:</b> another form of cryptography used by SSH. Hash functions are made in a way that they don't need to be decrypted. If a client has the correct input, they can create a cryptographic hash and SSH will check if both hashes are the same.</li>
</ul>

### <a name="UFW">What is UFW?</a>

**UFW** (Uncomplicated Firewall) is a firewall management tool for Linux systems. It provides a simple and user-friendly interface for configuring and managing a firewall. UFW allows you to set up rules to control incoming and outgoing network traffic based on various criteria, such as source and destination IP addresses, ports, and protocols. With UFW, you can configure the firewall to block or allow traffic, or even to limit the rate of incoming traffic. The goal of UFW is to make firewall management as easy and uncomplicated as possible, without sacrificing security.

### <a name="Cron_and_wall">What is cron and what is wall?</a>

- The **crontab** is a list of commands that you want to run on a regular schedule, and also the name of the command used to manage that list. Crontab stands for “cron table, ” because it uses the job scheduler cron to execute tasks; cron itself is named after “chronos, ” the Greek word for time.cron is the system process which will automatically perform tasks for you according to a set schedule. The schedule is called the crontab, which is also the name of the program used to edit that schedule. Linux Crontab Format
- **wall** (an abbreviation of write to all) is a Unix command-line utility that displays the contents of a computer file or standard input to all logged-in users. It is typically used by root to send out shutting down message to all users just before poweroff.

## Installation

Here is a guide for the installation of debian [Guide](#https://www.debian.org/)

## *sudo*

### Step 1: Installing *sudo*
Switch to *root* and its environment via `su -`.
```
$ su -
Password:
#
```
Install *sudo* via `apt install sudo`.
```
# apt install sudo
```
Verify whether *sudo* was successfully installed via `dpkg -l | grep sudo`.
```
# dpkg -l | grep sudo
```

### Step 2: Adding User to *sudo* Group
Add user to *sudo* group via `adduser <username> sudo`.
```
# adduser <username> sudo
```
>Alternatively, add user to *sudo* group via `usermod -aG sudo <username>`.
>```
># usermod -aG sudo <username>
>```
Verify whether user was successfully added to *sudo* group via `getent group sudo`.
```
$ getent group sudo
```
`reboot` for changes to take effect, then log in and verify *sudopowers* via `sudo -v`.
```
# reboot
<--->
Debian GNU/Linux 10 <hostname> tty1

<hostname> login: <username>
Password: <password>
<--->
$ sudo -v
[sudo] password for <username>: <password>
```

### Step 3: Running *root*-Privileged Commands
From here on out, run *root*-privileged commands via prefix `sudo`. For instance:
```
$ sudo apt update
```

### Step 4: Configuring *sudo*
Configure *sudo* via `sudo vi /etc/sudoers.d/<filename>`. `<filename>` shall not end in `~` or contain `.`.
```
$ sudo vi /etc/sudoers.d/<filename>
```
To limit authentication using *sudo* to 3 attempts *(defaults to 3 anyway)* in the event of an incorrect password, add below line to the file.
```
Defaults        passwd_tries=3
```
To add a custom error message in the event of an incorrect password:
```
Defaults        badpass_message="<custom-error-message>"
```
###
To log all *sudo* commands to `/var/log/sudo/<filename>`:
```
$ sudo mkdir /var/log/sudo
<~~~>
Defaults        logfile="/var/log/sudo/<filename>"
<~~~>
```
To archive all *sudo* inputs & outputs to `/var/log/sudo/`:
```
Defaults        log_input,log_output
Defaults        iolog_dir="/var/log/sudo"
```
To require *TTY*:
```
Defaults        requiretty
```
To set *sudo* paths to `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`:
```
Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
```

## SSH

### Step 1: Installing & Configuring SSH
Install *openssh-server* via `sudo apt install openssh-server`.
```
$ sudo apt install openssh-server
```
Verify whether *openssh-server* was successfully installed via `dpkg -l | grep ssh`.
```
$ dpkg -l | grep ssh
```
Configure SSH via `sudo vi /etc/ssh/sshd_config`.
```
$ sudo vi /etc/ssh/sshd_config
```
To set up SSH using Port 4242, replace below line:
```
13 #Port 22
```
with:
```
13 Port 4242
```
To disable SSH login as *root* irregardless of authentication mechanism, replace below line
```
32 #PermitRootLogin prohibit-password
```
with:
```
32 PermitRootLogin no
```
Check SSH status via `sudo service ssh status`.
```
$ sudo service ssh status
```
>Alternatively, check SSH status via `systemctl status ssh`.
>```
>$ systemctl status ssh
>```

### Step 2: Installing & Configuring UFW
Install *ufw* via `sudo apt install ufw`.
```
$ sudo apt install ufw
```
Verify whether *ufw* was successfully installed via `dpkg -l | grep ufw`.
```
$ dpkg -l | grep ufw
```
Enable Firewall via `sudo ufw enable`.
```
$ sudo ufw enable
```
Allow incoming connections using Port 4242 via `sudo ufw allow 4242`.
```
$ sudo ufw allow 4242
```
Check UFW status via `sudo ufw status`.
```
$ sudo ufw status
```

### Step 3: Connecting to Server via SSH
SSH into your virtual machine using Port 4242 via `ssh <username>@<ip-address> -p 4242`.
```
$ ssh <username>@<ip-address> -p 4242
```
Terminate SSH session at any time via `logout`.
```
$ logout
```
>Alternatively, terminate SSH session via `exit`.
>```
>$ exit
>```

## User Management

### Step 1: Setting Up a Strong Password Policy

#### Password Age
Configure password age policy via `sudo vi /etc/login.defs`.
```
$ sudo vi /etc/login.defs
```
To set password to expire every 30 days, replace below line
```
160 PASS_MAX_DAYS   99999
```
with:
```
160 PASS_MAX_DAYS   30
```
To set minimum number of days between password changes to 2 days, replace below line
```
161 PASS_MIN_DAYS   0
```
with:
```
161 PASS_MIN_DAYS   2
```
To send user a warning message 7 days *(defaults to 7 anyway)* before password expiry, keep below line as is.
```
162 PASS_WARN_AGE   7
```

#### Password Strength
Secondly, to set up policies in relation to password strength, install the *libpam-pwquality* package.
```
$ sudo apt install libpam-pwquality
```
Verify whether *libpam-pwquality* was successfully installed via `dpkg -l | grep libpam-pwquality`.
```
$ dpkg -l | grep libpam-pwquality
```
Configure password strength policy via `sudo vi /etc/pam.d/common-password`, specifically the below line:
```
$ sudo vi /etc/pam.d/common-password
<~~~>
25 password        requisite                       pam_pwquality.so retry=3
<~~~>
```
To set password minimum length to 10 characters, add below option to the above line.
```
minlen=10
```
To require password to contain at least an uppercase character and a numeric character:
```
ucredit=-1 dcredit=-1
```
To set a maximum of 3 consecutive identical characters:
```
maxrepeat=3
```
To reject the password if it contains `<username>` in some form:
```
reject_username
```
To set the number of changes required in the new password from the old password to 7:
```
difok=7
```
To implement the same policy on *root*:
```
enforce_for_root
```
Finally, it should look like the below:
```
password        requisite                       pam_pwquality.so retry=3 minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root
```

### Step 2: Creating a New User
Create new user via `sudo adduser <username>`.
```
$ sudo adduser <username>
```
Verify whether user was successfully created via `getent passwd <username>`.
```
$ getent passwd <username>
```
Verify newly-created user's password expiry information via `sudo chage -l <username>`.
```
$ sudo chage -l <username>
Last password change					: <last-password-change-date>
Password expires					: <last-password-change-date + PASS_MAX_DAYS>
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: <PASS_MIN_DAYS>
Maximum number of days between password change		: <PASS_MAX_DAYS>
Number of days of warning before password expires	: <PASS_WARN_AGE>
```

### Step 3: Creating a New Group
Create new *user42* group via `sudo addgroup user42`.
```
$ sudo addgroup user42
```
Add user to *user42* group via `sudo adduser <username> user42`.
```
$ sudo adduser <username> user42
```
>Alternatively, add user to *user42* group via `sudo usermod -aG user42 <username>`.
>```
>$ sudo usermod -aG user42 <username>
>```
Verify whether user was successfully added to *user42* group via `getent group user42`.
```
$ getent group user42
```

## *cron*

### Setting Up a *cron* Job
Configure *cron* as *root* via `sudo crontab -u root -e`.
```
$ sudo crontab -u root -e
```
To schedule a shell script to run every 10 minutes, replace below line
```
23 # m h  dom mon dow   command
```
with:
```
23 */10 * * * * sh /path/to/script
```
Check *root*'s scheduled *cron* jobs via `sudo crontab -u root -l`.
```
$ sudo crontab -u root -l
```
## Monitoring

You have to create a simple script called `monitoring.sh` It must be developed in bash.
At server startup, the script will display some information (listed below) on all ter- minals every 10 minutes (take a look at wall). The banner is optional. No error must be visible.
Your script must always be able to display the following information:<br/>
• The architecture of your operating system and its kernel version.<br/>
• The number of physical processors.<br/>
• The number of virtual processors.<br/>
• The current available RAM on your server and its utilization rate as a percentage.<br/> 
• The current available memory on your server and its utilization rate as a percentage.<br/>
• The current utilization rate of your processors as a percentage.<br/>
• The date and time of the last reboot.<br/>
• Whether LVM is active or not.<br/>
• The number of active connections.<br/>
• The number of users using the server.<br/>
• The IPv4 address of your server and its MAC (Media Access Control) address.<br/>
• The number of commands executed with the sudo program.

 You can find the script `monitoring.sh` in this repository.
