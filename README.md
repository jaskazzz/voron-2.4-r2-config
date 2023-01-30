# Voron config
My voron config for the printer 2.4 r2!

[![Scripts badge](https://badgen.net/badge/icon/scripts?icon=github&label)](/scripts/)

Hi!
This is my config and dotfiles for the Voron 2.4 r2 printer!
This repo has some scripts and e.g. klipper_konfigs for the printer

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the install script

You can clone the repository wherever you want. (I like to keep it in `~/voron-2.4-r2-config`) The installer script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/jaskazzz/voron-2.4-r2-config.git && cd voron-2.4-r2-config && ./install.sh
```

To update, `cd` into your local `voron-2.4-r2-config` repository and then:

```bash
./install.sh
```

##### **Warning:** The script does NOT update automatically when using the "--update-remote" or the "--force" options

To update later on, just run that command again

## Feedback

Suggestions/improvements
[Welcome](https://github.com/jaskazzz/voron-2.4-r2-config/issues)!

## Author

| [![github/jaskazzz](https://avatars.githubusercontent.com/u/122743464?v=4 )](https://github.com/jaskazzz "Follow jaskazzz on Github") |
|---|
| [Jaskazzz](https://github.com/jaskazzz) |

## Thanks to…

* @mathiasbynens and [his README.md](https://github.com/mathiasbynens/dotfiles/blob/main/README.md)
