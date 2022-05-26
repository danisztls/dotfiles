# Dotfiles
These are some of the configurations and scripts that I use to make my life in Linux more functional and enjoyable.

<!-- TOC GFM -->

* [Environment](#environment)
* [FAQ](#faq)
  * [How this works?](#how-this-works)
  * [Why you don't use a bare git repo?](#why-you-dont-use-a-bare-git-repo)
  * [Why you don't use a dotfiles manager?](#why-you-dont-use-a-dotfiles-manager)
  * [What about the looks?](#what-about-the-looks)
  * [Is it worth the time?](#is-it-worth-the-time)
  * [Any caveats?](#any-caveats)
  * [How to preserve my 'goodies' when doing things as root?](#how-to-preserve-my-goodies-when-doing-things-as-root)
  * [What are the terminal shortcuts?](#what-are-the-terminal-shortcuts)

<!-- /TOC -->

## Environment
- shell interpreter: [zsh](https://www.zsh.org/)
- zsh plugin manager: [zinit](https://github.com/zdharma-continuum/zinit)
- terminal emulator: [alacritty](https://alacritty.org/)
- desktop environment: [gnome-shell](https://wiki.gnome.org/Projects/GnomeShell)
- text editor: [nvim](https://neovim.io/)
- backup: [arbie](https://github.com/lbcnz/arbie)
- file browser: [fzfx](https://github.com/lbcnz/fzfx)
- notes & tasks: [journal](https://github.com/lbcnz/journal)
- time logger: [timewarrior](https://timewarrior.net/)

## FAQ
### How this works?
A setup script link the dotfiles in this repo to those on `$HOME`.

Usage: `./setup <recipe>`

Recipes on `recipes/`. Run from the project root.

The force mode, `-f` option, bypass the file already exists checks and auomatically remove any existing file. Don't use options as first argument.

### Why you don't use a bare git repo?
I tried it originally but just didn't like the flow. Maybe doing things differently would improve it but I am happy with my current approach.

I followed the instructions by [harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
```sh
git init --bare $HOME/.dotfiles`
echo 'alias g...="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.aliases
g... config --local status.showUntrackedFiles no
```

### Why you don't use a dotfiles manager?
[twpayne/chezmoi](https://github.com/twpayne/chezmoi) is interesting but I don't need those features right now or they are superseded by other tools that I currently use and so it would add unneeded complexity. That may change in the future though.

> "If you do not personalize your configuration or only ever use a single operating system with a single account and none of your dotfiles contain secrets then you don't need chezmoi." — chezmoi README

### What about the looks?
Check:
- [supernova-theme](https://github.com/danisztls/supernova-theme).
- [arc-theme](https://github.com/jnsh/arc-theme)
- [papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- [capitaine-cursors](https://github.com/keeferrourke/capitaine-cursors)

![Desktop in 2021](https://github.com/lbcnz/dotfiles/raw/main/assets/21-desktop.png)

### Is it worth the time?
Sometimes but not always. Those hacks save time put also took me a lot of time to discover, create, test and improve.

![xkcd: Is It Worth the Time?](https://github.com/danisztls/dotfiles/raw/main/assets/is-it-worth-the-time.png)

— [Randall Munroe](https://xkcd.com/1205/)

### Any caveats?
Some things might not work unless you have the same programs and versions that I'm currently using.

Some configs are personal and is a good idea to check before using. As an example I have my public PGP key set on Git config.

Zinit will not work unless you have priorly established a SSH handshake with Github due to SSH being forced over HTTPS on Git config.

### How to preserve my 'goodies' when doing things as root?
Let's think of a common use case, editing files as superuser. There are many ways you can run a text editor as root and they all apparently do the same thing albeit being very different.

As it boils down to preserving environment variables I wrote, to demonstrate the different behaviour of these tools, a simple script that prints the variables `$USER`, `$HOME` and `$VIMINIT`. The later being a long string represented simply by yes/no bellow, meaning that it was passed along or not to the new shell.

| command | USER | HOME       | VIMINIT |
| ---     | ---  | ---        | ---     |
| sudo    | root | /root      | no      |
| sudo -E | root | /home/user | yes     |
| su      | user | /root      | yes     |
| sudo su | root | /root      | no      |

What basically happens is that `sudo` reset the environment variables while `su` just overwrite some of them.

su manpage:
> For backward compatibility, su defaults to not change the current directory and to only set the environment variables HOME and SHELL  (plus
> USER  and LOGNAME if the target user is not root).  It is recommended to always use the --login option (instead of its shortcut -) to avoid
> side effects caused by mixing environments.

sudo manpage:
> When sudo executes a command, the security policy specifies the execution environment for the command.

And that policy is to unset all variables unless `Defaults env_reset` in `/etc/sudoers` is changed to `Defaults !env_reset`. Despite I despising typing `sudo` before every command, it is indeed more robust and safer than `su` for use with desktop environments. At least by default.

**"So what if you want to make vim or whatever else work with 'su'?"**

First you have to link or copy your vim configuration to `/root` and if you use `$VIMINIT` you can't run `sudo su`. If you link the files you are increasing surface for root privilege escalation and copying the files, even if automated, is avoidable boring maintenance.

Also you would not want to have a `vimrc` over one 1K lines causing problems when things fall apart and you have to log in as root as last resort to restore the system.

**"So what if I want to use 'sudo' for that."**

You can use `sudo -E` to preserve environment or edit `sudoers` file for having it by default. But still, you will be increasing surface for root privilege escalation and mixing environments is bad practice and can cause tragic side effects. Sometimes it's not a good idea to run things in mixed environments, things may not work and user files may be overwritten as root.

The only 'sane' alternative is to use `sudoedit` or `su -e` which creates a temporary file for editing and overwrites the actual file with it when exiting. It uses the editor set at `$SUDO_EDITOR`, `$VISUAL` or `$EDITOR`, whichever comes first. Hacks are not desired here.

### What are the terminal shortcuts?
**Zsh customs**

| key    | action                |
| ---    | ---                   |
| C^r    | fzf history search    |
| C^t    | fzf directory search  |
| C^e    | edit line with vim    |
| Home   | go to start of line   |
| End    | go to end of line     |
| PgUp   | move to forward word  |
| PgDown | move to backward word |
| Ins    | delete word           |
| Del    | delete char           |

**Bash defaults**

| key | action                      |
| --- | ---                         |
| C^a | move to start of line       |
| C^e | move to end of line         |
| M^b | move backwards word-by-word |
| M^f | move forwards word-by-word  |
| C^r | do a reverse search         |
| C^w | delete word left of cursor  |
| C^l | clear history               |

*Note: C is CTRL and M is META/ALT*
