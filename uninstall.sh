#!/bin/sh
#Script auto fix time on hackintosh
#OSX: 10.6 and above

DAEMON_PATH=/Library/LaunchDaemons/
BIN_PATH=/usr/local/bin/
TIME_FIX_FILE=localtime-toggle
TIME_DAEMON_FILE=org.osx86.localtime-toggle.plist
LOCK_FILE=/var/run/org.osx86.localtime-toggle.lock

if sudo launchctl list | grep --quiet localtime-toggle; then
    echo "Stopping existing localtime-toggle daemon."
    sudo launchctl unload $DAEMON_PATH$TIME_DAEMON_FILE
fi

echo "Delete files..."
sudo rm $BIN_PATH$TIME_FIX_FILE
sudo rm $DAEMON_PATH$TIME_DAEMON_FILE
sudo rm -rf $LOCK_FILE

echo "Done!"
