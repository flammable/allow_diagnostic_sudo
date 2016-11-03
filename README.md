# allow_diagnostic_sudo

### What is this?

We use a trimmed-down OS to diagnose Macs in need of repair. Our default user, `diagnostic`, does not have a password. Sometimes, we need to use the `sudo` command, but Apple disabled `sudo` access for users with a blank password.

### How do I use this?

Edit the Makefile to add your own reverse domain (rather than `edu.sju`). If your user isn't `diagnostic`, be sure to rename and edit that file, then adjust the Makefile appropriately.

Afterwards, `cd` into the `allow_diagnostic_sudo` directory, then run any of the following:

* `make pkg`
* `make dmg`
* `make munkiimport` (be sure your Munki repository is mounted first)

### Requirements

* [The Luggage](https://github.com/unixorn/luggage)
* [Munki](https://github.com/munki/munki) (optional)

I've only tested this with macOS 10.12.1, but it appears it should work with 10.10.x and 10.11.x.