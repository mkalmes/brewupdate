# brewupdate #

brewupdate is a [launchd agent][launchd] to update [homebrew][homebrew] formulae automatically every 5 days at 11 AM (local time).

brewupdate will `brew update`, `brew upgrade`, and `brew doctor` so you may want to adjust this behaviour given an upgrade may break something dependent on a certain version.

## How to Install or Upgrade ##
Run the following command in the terminal:

```sh
curl -L https://github.com/cgswong/brewupdate/raw/master/brewupdate-install.sh | bash
```

### Manual installation ###
To manually install `brewupdate`, copy the plist to `~/Library/LaunchAgents` and run the command `launchctl load ~/Library/LaunchAgents/net.brewupdate.agent.plist` to load the LaunchAgent into the launchd manager.

Here is a quick rundown:
```
> mkdir ~/Library/LaunchAgents
> cp net.brewupdate.agent.plist ~/Library/LaunchAgents
> launchctl load ~/Library/LaunchAgents/net.brewupdate.agent.plist
```

### Manual upgrade ###
If you installed a previous version of brewupdate, unload the loaded LaunchAgent, copy the new agent to `~/Library/LaunchAgents`, and load the copied LaunchAgent.

Here is a quick rundown:
```
> launchctl unload ~/Library/LaunchAgents/net.brewupdate.agent.plist
> cp net.brewupdate.agent.plist ~/Library/LaunchAgents
> launchctl load ~/Library/LaunchAgents/net.brewupdate.agent.plist
```

## … and where do I see what's updated? ##
Since OS X 10.8, [Apple removed the redirection][apple-removed-redirection] of `stdout` and `stderr` to `system.log`.

Use the search filter <code>net.brewupdate.agent</code> on "All Messages" to display the list of new and updated formulae.

## License

Code is under the [BSD 2-Clause license][license].

[launchd]: http://developer.apple.com/library/mac/#technotes/tn2083/_index.html
[homebrew]: https://github.com/mxcl/homebrew/
[apple-removed-redirection]: http://stackoverflow.com/a/15655471/1712728
[license]: https://github.com/cgswong/brewupdate/tree/master/LICENSE.txt
