#!/bin/bash
# ############################################################################
# NAME: brewupdate-install.sh
# DESC: Script to setup launchd process to update, upgrade and check (doctor)
#       for brew.
#
# LOG:
# yyyy/mm/dd [user] [version]: [notes]
# 2014/10/15 cgwong v0.1.0: Initial creation from https://github.com/mkalmes/brewupdate/blob/develop/brewupdate-install.sh
# 2015/01/07 cgwong v0.2.0: Added check for successful load.
# ############################################################################

set -e

BIN="/usr/local/bin"
AGENTS="$HOME/Library/LaunchAgents"
PLIST="$AGENTS/net.brewupdate.agent.plist"
REPO=${REPO:-heitortsergent}
BRANCH=${BRANCH:-master}
REMOTE="https://github.com/$REPO/brewupdate/raw/$BRANCH"
REMOTE_PLIST="$REMOTE/net.brewupdate.agent.plist"
REMOTE_SCRIPT="$REMOTE/brewupdate.sh"

[ -f "$PLIST" ] && launchctl unload "$PLIST"
if [ "$1" == "uninstall" ]; then
  rm -f "$PLIST"
  if [ $? -eq 0 ]; then
    echo "Unloaded brewupdate."
    exit 0
  else
    echo "Failed unloading brewupdate!!"
    exit 1
  fi
fi

curl -L "$REMOTE_SCRIPT" >| "$BIN"
if [ -f "$BIN" ]; then
  echo "Downloaded brewupdate.sh"
else
  echo "Failed downloading brewupdate.sh"
  exit 1
fi

curl -L "$REMOTE_PLIST" >| "$PLIST"
[ -f "$PLIST" ] && launchctl load "$PLIST"
if [ $? -eq 0 ]; then
  echo "Loaded brewupdate."
else
  echo "Failed loading brewupdate!!"
  exit 1
fi

brew install terminal-notifier
echo "Installed terminal-notifier."

exit 0