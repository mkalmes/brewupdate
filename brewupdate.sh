#!/bin/bash
# ############################################################################
# NAME: brewupdate.sh
# DESC: Script to update, upgrade and check (doctor) Homebrew.
#
# LOG:
# yyyy/mm/dd [user] [version]: [notes]
# 2014/10/15 cgwong v0.1.0: Initial creation.
# ############################################################################

set -e
 
NAME="$0:t:r"
  
export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin
   
(brew update && brew upgrade && brew doctor) 2>&1 | tee -a "$HOME/Library/Logs/$NAME.log"
exit 0

