# brewupdate #

<code>brewupdate</code> is a [launchd agent][launchd] to update [homebrew][homebrew] formulae automaticly every day at 11 AM (local time).

Brewupdate will not upgrade your installed formulae. It's sole responsibility is to fetch new formulae.

## How to Install ##
To install <code>brewupdate</code>, copy the plist to <code>~/Library/LaunchAgents</code> and run the command <code>launchctl load ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist</code> to load the LaunchAgent into the launchd manager.

Here is a quick rundown:
```
> mkdir ~/Library/LaunchAgents
> cp net.mkalmes.brewupdate.plist ~/Library/LaunchAgents
> launchctl load ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist
```

## How to Upgrade ##
If you installed a previous version of brewupdate, unload the loaded LaunchAgent, copy the new agent to <code>~/Library/LaunchAgents</code>, and load the copied LaunchAgent.

Here is a quick rundown:
```
> launchctl unload ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist
> cp net.mkalmes.brewupdate.plist ~/Library/LaunchAgents
> launchctl load ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist
```

## … and where do I see what's updated? ##
<code>brewupdate</code> redirects the output to <code>/var/log/system.log</code> and can be easily viewed with <code>/Applications/Utilities/Console.app</code>. Use the search filter <code>net.mkalmes.brewupdate</code> on "All Messages" to display the list of new and updated formulae.

[launchd]: http://developer.apple.com/library/mac/#technotes/tn2083/_index.html
[homebrew]: https://github.com/mxcl/homebrew/
