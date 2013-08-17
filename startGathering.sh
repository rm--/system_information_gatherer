#!/bin/bash

#author: René Muhl
#from: Leipzig, Germany
#last change: 15.4.2013
#email: ReneM{dot}github{at}gmail{dot}com

#SIG - System Information Gatherer
##[A programm that gathers some information about your Linux distribution and stores it in a file.]

#description:
##The script "startGathering.sh" starts itself with "start" as (first) argument. So it gathers all the information.
##All outputs of "startGathering.sh "start"" will be stored in the a file with the name: info@"current date"
##(for example: "current date" == info@28.02.2013).



if [[ $1 == "" ]]; then
	
	date=`date +%d.%m.%Y`
	filename="info@"$date
	$0 "start" > $filename
	echo gathering "complete"!

elif [[ $1 == "start" ]]; then
	
	echo "################################################################################"
	echo --------------------------------------------------------------------------------
	echo --------------------------------------------------------------------------------
	echo
	echo -e "\033[4;37minformation about the user\033[0m"
	echo "your username: "`whoami`
	echo "registered users: "`who`
	echo "group membership: `id`"
	echo --------------------------------------------------------------------------------
	echo --------------------------------------------------------------------------------
	echo -e "\033[4;37mgeneral information\033[0m"
	echo "date: `date`"
	echo "seconds since 1970-01-01 00:00:00 UTC: `date +%s`"
	echo --------------------------------------------------------------------------------
	echo --------------------------------------------------------------------------------
	echo -e "\033[4;37msystem information\033[0m"
	echo "hostname: `hostname`"
	#get more detail
	echo "kernel release: `uname -r`"
	echo "processor architecture: `uname -p`"
	#test if a kernel upgrade is available
	echo "prozessor `grep "model name" /proc/cpuinfo | uniq`"
	echo `grep "cpu#" /proc/sched_debug`
	echo `grep "MemTotal" /proc/meminfo`
	echo "Java versions:"
	echo "`java -version 2>&1`"
	echo --------------------------------------------------------------------------------
	echo -e "\033[4;37mmore cpu information\033[0m"
	echo  "`lscpu`"
	echo --------------------------------------------------------------------------------
	echo -e "\033[4;37mpartitions\033[0m"
	echo "`cat /proc/partitions`"		#echo `cat /proc/partitions` ignored the structure and newlines
	echo --------------------------------------------------------------------------------
	echo -e "\033[4;37mmounted partitions\033[0m"
	echo "`grep "/dev/s" /proc/mounts`"
	echo --------------------------------------------------------------------------------
	echo -e "\033[4;37mswap partitions\033[0m"
	echo  "`cat /proc/swaps`"
	echo --------------------------------------------------------------------------------
	echo "disk usage: `df`"
	echo --------------------------------------------------------------------------------
	echo --------------------------------------------------------------------------------
	#what is about other NICs next to eth0
	#or other IP adresses of eth0? --> is the number of NICs helpful?
	echo -e "\033[4;37mnetwork information\033[0m"
	echo "general IPv4 NICs: `ip -4 addr`"
	echo --------------------------------------------------------------------------------
	echo "general IPv6 NICs: `ip -6 addr`"
	echo --------------------------------------------------------------------------------
	echo `ifconfig eth0 | fgrep "inet addr"`
	echo `ifconfig eth0 | fgrep "inet6"`
	echo
	echo --------------------------------------------------------------------------------
	echo --------------------------------------------------------------------------------
	echo "################################################################################"

fi
