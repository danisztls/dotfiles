# Dotfiles

<!-- TOC GitLab -->

* [Structure](#structure)
* [Environment](#environment)
* [More](#more)
* [FAQ](#faq)
  * [How this works?](#how-this-works)
  * [Why you don't use a bare git repo?](#why-you-dont-use-a-bare-git-repo)
  * [Why you don't use a dotfiles manager?](#why-you-dont-use-a-dotfiles-manager)
  * [What about the root user?](#what-about-the-root-user)
  * [What is the license?](#what-is-the-license)

<!-- /TOC -->

These are some of the configurations and scripts that I use to make my life in Linux more functional and enjoyable. 

## Structure
- dots: user dotfiles
- dots-root: root dotfiles
- gnome: hacks for gnome

## Environment
- **shell interpreter**: zsh
- **terminal emulator**: alacritty/kitty
- **desktop environment**: gnome-shell
- **text editor**: nvim

## More
Related projects that I develop.

- [arbie](https://github.com/lbcnz/arbie): automatic and robust backup solution
- [journal](https://github.com/lbcnz/journal): CLI management of notes and tasks
- [fzfx](https://github.com/lbcnz/fzfx): CLI management of notes and tasks

## FAQ
### How this works?
I'm using rsync to sync my dotfiles to a separate git working tree.

I edit files in place and **sync2repo** synchronizes all my recent files to repo.

### Why you don't use a bare git repo?
I tried but just didn't like the flow. Maybe doing things differently would improve it but I am happy without it.

I followed the instructions by [harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html):

```sh
git init --bare $HOME/.dotfiles`
echo 'alias g...="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.aliases
g... config --local status.showUntrackedFiles no
```

### Why you don't use a dotfiles manager?
[twpayne/chezmoi](https://github.com/twpayne/chezmoi) is interesting but I don't need those features as they are superseded by other tools that I currently use and would add uneeded complexity. That may change in the future though.

> "If you do not personalize your configuration or only ever use a single operating system with a single account and none of your dotfiles contain secrets then you don't need chezmoi." — chezmoi README 

### What about the root user?
I used to symbolic link configuration paths from */root* to */home/USER* but that opens a vulnerability for root privilege escalation. Because an attacker can modify the configuration files to run code as root. Although that is pure paranoia as an attacker don't really need it. If someone has unrestricted access to your administrator user, eventually he will have unrestricted access to the superuser.

### What is the license?
My own code is under MIT license but components may be under other licenses.
