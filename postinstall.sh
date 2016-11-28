#!/bin/sh

# Bashscript which is executed by bash *AFTER* complete installation is done
# (but *BEFORE* postupdate). Use with caution and remember, that all systems
# may be different! Better to do this in your own Pluginscript if possible.
#
# Exit code must be 0 if executed successfull.
#
# Will be executed as user "loxberry".
#
# We add 5 arguments when executing the script:
# command <TEMPFOLDER> <NAME> <FOLDER> <VERSION> <BASEFOLDER>
#
# For logging, print to STDOUT. You can use the following tags for showing
# different colorized information during plugin installation:
#
# <OK> This was ok!"
# <INFO> This is just for your information."
# <WARNING> This is a warning!"
# <ERROR> This is an error!"
# <FAIL> This is a fail!"

ARGV3=$3 # Third argument is Plugin installation folder
ARGV5=$5 # Fifth argument is Base folder of LoxBerry

# Replace by subfolder
/bin/sed -i "s%REPLACEBYSUBFOLDER%$ARGV3%" $ARGV5/config/plugins/$ARGV3/sonos.cfg
/bin/sed -i "s%REPLACEBYSUBFOLDER%$ARGV3%" $ARGV5/webfrontend/html/plugins/$ARGV3/System/network.php
/bin/sed -i "s%REPLACEBYSUBFOLDER%$ARGV3%" $ARGV5/templates/plugins/$ARGV3/de/help.html


# to ensure that Sonos can read from folder structure
# /bin/sed -i "s%guest ok = no%guest ok = yes%" $ARGV5/system/samba/smb.conf
echo "<INFO> The Samba config file 'smb.conf' has been updated successfully."
echo "<INFO>"
echo "<INFO> Please restart Loxberry before starting Sonos configuration!"
echo "<INFO>"

# Exit with Status 0
exit 0