# brewupdate #

brewupdate is a [launchd agent][launchd] to update [homebrew][homebrew] formulae automatically every 7 days at 11 AM (local time).

## IMPORTANT!

brewupdate will `brew update`, `brew upgrade`, and `brew doctor` so you may want to adjust this behaviour inside `brewupdate.sh` given an upgrade may break something dependent on a certain version.

## How to Install or Upgrade ##
Run the following command in the terminal:

```shell
$ curl -L https://github.com/heitortsergent/brewupdate/raw/master/brewupdate-install.sh | bash
```

### Manual installation ###

To manually install `brewupdate`:

Copy `brewupdate.sh` to your `/usr/local/bin` folder, then the plist to `~/Library/LaunchAgents` and run the command `launchctl load ~/Library/LaunchAgents/net.brewupdate.agent.plist` to load the LaunchAgent into the launchd manager.

Here is a quick rundown:

```shell
# install terminal-notifier to get a nice user notification when the script runs
$ brew install terminal-notifier

# download repo and copy files to correct folders
$ git clone https://github.com/heitortsergent/brewupdate.git && cd brewupdate
$ cp brewupdate.sh /usr/local/bin
$ mkdir ~/Library/LaunchAgents
$ cp net.brewupdate.agent.plist ~/Library/LaunchAgents

# add log paths to .plist file
$ defaults write ~/Library/LaunchAgents/net.brewupdate.agent.plist StandardOutPath $HOME/Library/Logs/Homebrew/brewupdate/brewupdate.log && defaults write ~/Library/LaunchAgents/net.brewupdate.agent.plist StandardErrorPath $HOME/Library/Logs/Homebrew/brewupdate/brewupdate-error.log
$ mkdir -p $HOME/Library/Logs/Homebrew/brewupdate

# load the LaunchAgent
$ launchctl load ~/Library/LaunchAgents/net.brewupdate.agent.plist
```

### Manual upgrade ###

If you installed a previous version of brewupdate, unload the loaded LaunchAgent, copy the new `brewupdate.sh` and/or the new agent to `~/Library/LaunchAgents`, and load the copied LaunchAgent.

Here is a quick rundown:

```
$ launchctl unload ~/Library/LaunchAgents/net.brewupdate.agent.plist
$ cp brewupdate.sh /usr/local/bin
$ cp net.brewupdate.agent.plist ~/Library/LaunchAgents
$ launchctl load ~/Library/LaunchAgents/net.brewupdate.agent.plist
```

## … and where do I see what's updated? ##

Since OS X 10.8, [Apple removed the redirection][apple-removed-redirection] of `stdout` and `stderr` to `system.log`.

When the script runs, it'll show a notification using the [terminal-notifier][terminal-notifier] command-line tool. The logs are being kept inside `$HOME/Library/Logs/Homebrew/brewupdate/brewupdate.log` and errors inside `$HOME/Library/Logs/Homebrew/brewupdate/brewupdate-error.log`. You can change that by editing the `StandardOutPath` and `StandardErrorPath` properties inside the `net.brewupdate.agent.plist` file (don't forget to unload and load after making the changes).

## License

Code is under the [BSD 2-Clause license][license].

[launchd]: http://developer.apple.com/library/mac/#technotes/tn2083/_index.html
[homebrew]: https://github.com/mxcl/homebrew/
[apple-removed-redirection]: http://stackoverflow.com/a/15655471/1712728
[terminal-notifier]: https://github.com/alloy/terminal-notifier
[license]: https://github.com/cgswong/brewupdate/tree/master/LICENSE.txt
