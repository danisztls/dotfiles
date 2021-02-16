
<!-- TOC GitLab -->

* [Introduction](#introduction)
    * [Structure](#structure)
    * [Environment](#environment)
* [Fuzzy search](#fuzzy-search)
* [Themes](#themes)
* [More](#more)
* [FAQ](#faq)
    * [How this works?](#how-this-works)
    * [And the root user?](#and-the-root-user)
    * [What is the license?](#what-is-the-license)

<!-- /TOC -->

# Introduction
These are some of the configurations and scripts that I use to make my life in Linux more functional and enjoyable. 

## Structure
- **assets**: screenshots and terminal svg animations
- **dots**: my dotfiles
- **dots-root**: root dotfiles
- **gnome**: hacks for gnome desktop
- **themes**: themes and ricing material

## Environment
- **shell interpreter**: zsh
- **terminal emulator**: alacritty
- **desktop environment**: gnome-shell
- **text editor**: nvim

# Fuzzy search
**fzf-special** does specialized fuzzy searchs it's a wrapper to [fzf](https://github.com/junegunn/fzf) and code searching tools like rg, fd and rga.

- **hidden**: hidden files
- **md**: markdown files
- **pdf**: pdf, ps and eps files
- **media**: videos and audio files
- **cd**: browse directories and cd
- **ps**: search and manage processes

**cd**

[![fcd-asciicast](https://asciinema.org/a/349907.svg)](https://asciinema.org/a/349907)

**ps**

[![fps-asciicast](https://asciinema.org/a/349904.svg)](https://asciinema.org/a/349904)

# Themes
Nebula is a colorful terminal color scheme inspired in space, futurism and cyberpunk thematics.

![nebula-terminal](assets/nebula-terminal.png)

# More
Some projects I have spin-offed:

- [arb](https://gitlab.com/lbcnz/arb): automatic and robust backup solution
- [journal](https://gitlab.com/lbcnz/workshop): CLI management of notes and tasks
- [spotify-cli](https://gitlab.com/lbcnz/dotfiles): helper to setup mopidy + ncmpcpp

# FAQ
## How this works?
I'm using rsync to sync my dotfiles to a separate git working tree.

I edit files in place and **sync2repo** synchronizes all my recent files to repo. An alternative to that is to create a bare git repo as instructed by [harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html). I tried but did not like the flow.

```shell
git init --bare $HOME/.dotfiles`
echo 'alias g...="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.aliases
g... config --local status.showUntrackedFiles no
```

## And the root user?
I used to symbolic link configuration paths from */root* to */home/USER* but that opens a vulnerability for root privilege escalation. Because an attacker can modify the configuration files to run code as root.*

## What is the license?
My own code is under MIT license but components may be under other licenses.

