#!/bin/sh

# Configure Dock items using DockUtil via JAMF Casper
# Cliff Hirtle, 3/5/14, http://linkedin.com/in/clifhirtle
# See dockutil on GitHub: https://github.com/kcrawford/dockutil


#### Read in the parameters
mountPoint=$1
computerName=$2
username=$3
task=$4					# --add / --remove / --move / --find
label=$5				# --iPhoto
path=$6					# --/Applications/iPhoto.app
position=$7				# --beginning / --end / --middle / --before / --after
restart=$8				# --restart / --no-restart

# Perform tasks
/usr/local/bin/dockutil $task $path $label $position /Users/$username

