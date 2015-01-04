#!/bin/bash
# ############################################################################
# NAME: brewupdate.sh
# DESC: Script to update, upgrade and check (doctor) Homebrew.
#
# LOG:
# yyyy/mm/dd [user] [version]: [notes]
# 2014/10/15 cgwong v0.1.0: Initial creation.
# 2015/01/04 cgwong v0.1.1: Added cask commands.
#                           Removed logging, corrected getting name from path.
# ############################################################################

set -e
 
NAME=`basename $0`
  
export PATH=/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin
   
(brew update && brew upgrade brew-cask && brew upgrade && brew cleanup && brew cask cleanup && brew doctor)

