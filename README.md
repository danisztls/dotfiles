# Dotfiles

<!-- TOC GitLab -->

* [Structure](#structure)
* [Environment](#environment)
* [See more](#see-more)
* [FAQ](#faq)
        * [How this works?](#how-this-works)
        * [And the root user?](#and-the-root-user)
        * [What is the license?](#what-is-the-license)

<!-- /TOC -->

These are some of the configurations and scripts that I use to make my life in Linux more functional and enjoyable. 

## Structure
- **assets**: screenshots and terminal svg animations
- **dots**: my dotfiles
- **dots-root**: root dotfiles
- **gnome**: hacks for gnome desktop

## Environment
- **shell interpreter**: zsh
- **terminal emulator**: alacritty/kitty
- **desktop environment**: gnome-shell
- **text editor**: nvim

## See more
Related projects that I develop.

- [arb](https://github.com/lbcnz/arb): automatic and robust backup solution
- [journal](https://github.com/lbcnz/journal): CLI management of notes and tasks
- [fzfx](https://github.com/lbcnz/fzfx): CLI management of notes and tasks

## FAQ
#### How this works?
I'm using rsync to sync my dotfiles to a separate git working tree.

I edit files in place and **sync2repo** synchronizes all my recent files to repo. An alternative to that is to create a bare git repo as instructed by [harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html). I tried but did not like the flow.

```shell
git init --bare $HOME/.dotfiles`
echo 'alias g...="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.aliases
g... config --local status.showUntrackedFiles no
```

#### And the root user?
I used to symbolic link configuration paths from */root* to */home/USER* but that opens a vulnerability for root privilege escalation. Because an attacker can modify the configuration files to run code as root.

#### What is the license?
My own code is under MIT license but components may be under other licenses.

