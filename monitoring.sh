#!/bin/bash

wall "
Architecture: $(uname -a)
CPU physical: $(nproc)
vCPU : $(nproc)
Memory usage: $(free -m | awk 'NR==2 {printf "%d/%dMB (%.2f%%)\n" ,$3 ,$2,$3/$2*100}')
Disk Usage: $(df -h | awk '$NF=="/" {printf"%d/%dGb (%s)\n",$3,$2,$5}')
CPU load: $(top -bn1 | grep load | awk '{printf"%.2f%%\n",$(NF-2)}')
Last boot: $(who -b | awk '{printf"%s %s\n",$3,$4}')
LVM use: $(if cat /etc/fstab | grep -q "/dev/mapper"
	then echo "yes"
	else echo "no"
		fi;)
Connections TCP : $(cat /proc/net/sockstat | awk '$1=="TCP:" {print $3}') ESTABLISHED
User log: $(users | wc -w)
Network: IP $(hostname -I) $(ip addr | grep link/ether | awk '{print "("$2")"}')
Sudo : $(journalctl _COMM=sudo | grep COMMAND | wc -l) cmd"
