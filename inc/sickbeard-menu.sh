#!/bin/bash
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickBeard" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" 25 78 15 \
"Install" "Install SickBeard" \
"Uninstall" "Uninstall SickBeard" \
"Backup" "Backup SickBeard settings" \
"Restore" "Restore SickBeard settings from a previous backup" \
"Manual Update" "Manually update SickBeard" \
"Reset Password" "Rest SickBeard WebUI password" \
"SCRIPTPATH" "$SCRIPTPATH" \
"UNAME" "$UNAME" \
"UGROUP" "$UGROUP" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickbeard/sickbeard-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sickbeard/sickbeard-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/sickbeard/sickbeard-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/sickbeard/sickbeard-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sickbeard/sickbeard-update.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/main-menu.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
