#!/bin/bash
set -e
AGENTS="$HOME/Library/LaunchAgents"
PLIST="$AGENTS/net.mkalmes.brewupdate.plist"
REPO=${BRANCH:-mkalmes}
BRANCH=${BRANCH:-master}
REMOTE="https://github.com/$REPO/brewupdate/raw/$BRANCH/net.mkalmes.brewupdate.plist"
[ -f "$PLIST" ] && launchctl unload "$PLIST"
if [ "$1" == "uninstall" ]
then
  \rm -f "$PLIST"
  echo "Unloaded brewupdate."
  exit 0
fi
curl -L "$REMOTE" >| "$PLIST"
[ -f "$PLIST" ] && launchctl load "$PLIST"
echo "Loaded brewupdate."