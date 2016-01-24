#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage Plex" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" 25 78 15 \
"Install" "Install Plex" \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/plex/plex-installer.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/main-menu.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
