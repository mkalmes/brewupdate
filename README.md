# brewupdate #

brewupdate is a [launchd agent][launchd] to update [homebrew][homebrew] formulae automatically every day at 11 AM (local time).

Brewupdate will not upgrade your installed formulae. Its sole responsibility is to fetch new formulae.

## How to Install or Upgrade ##
Run the following command in the terminal:

```sh
curl -L https://github.com/mkalmes/brewupdate/raw/develop/brewupdate-install.sh | bash
```

### Manual installation ###
To manually install `brewupdate`, copy the plist to `~/Library/LaunchAgents` and run the command `launchctl load ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist` to load the LaunchAgent into the launchd manager.

Here is a quick rundown:
```
> mkdir ~/Library/LaunchAgents
> cp net.mkalmes.brewupdate.plist ~/Library/LaunchAgents
> launchctl load ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist
```

### Manual upgrade ###
If you installed a previous version of brewupdate, unload the loaded LaunchAgent, copy the new agent to `~/Library/LaunchAgents`, and load the copied LaunchAgent.

Here is a quick rundown:
```
> launchctl unload ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist
> cp net.mkalmes.brewupdate.plist ~/Library/LaunchAgents
> launchctl load ~/Library/LaunchAgents/net.mkalmes.brewupdate.plist
```

## … and where do I see what's updated? ##
Since OS X 10.8, [Apple removed the redirection][apple-removed-redirection] of `stdout` and `stderr` to `system.log`.

On OS X 10.5 to 10.7, <code>brewupdate</code> redirects the output to <code>/var/log/system.log</code> and can be easily viewed with <code>/Applications/Utilities/Console.app</code>. Use the search filter <code>net.mkalmes.brewupdate</code> on "All Messages" to display the list of new and updated formulae.

## License

Code is under the [BSD 2-Clause license][license].

[launchd]: http://developer.apple.com/library/mac/#technotes/tn2083/_index.html
[homebrew]: https://github.com/mxcl/homebrew/
[apple-removed-redirection]: http://stackoverflow.com/a/15655471/1712728
[license]: https://github.com/mkalmes/brewupdate/tree/develop/LICENSE.txt
