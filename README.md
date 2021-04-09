# Dotfiles

<!-- TOC GitLab -->

* [Structure](#structure)
* [Environment](#environment)
* [More](#more)
* [FAQ](#faq)
  * [How this works?](#how-this-works)
  * [Why you don't use a bare git repo?](#why-you-dont-use-a-bare-git-repo)
  * [Why you don't use a dotfiles manager?](#why-you-dont-use-a-dotfiles-manager)
  * [What else you tried?](#what-else-you-tried)
  * [What is the license?](#what-is-the-license)

<!-- /TOC -->

These are some of the configurations and scripts that I use to make my life in Linux more functional and enjoyable. 

## Structure
- dots: user dotfiles
- dots-root: root dotfiles
- gnome: hacks for gnome

```sh
.
├── dots                        # user dotfiles
│   └── WARNING.MD              # warning to not delete hidden files
├── dots-root                   # root dotfiles
├── gnome                       # hacks for gnome environment
│   ├── nautilus-scripts        # context menu scripts for nautilus
│   ├── nvim-override.desktop   # hack for opening txtx files w/ alacritty
│   └── README.md               # gnome hacks readme
├── LICENSE                     # mit license
├── link2user                   # script to link dotfiles to $HOME
└── README.md                   # dotfiles readme
```

## Environment
- **shell interpreter**: zsh
- **terminal emulator**: alacritty
- **desktop environment**: gnome-shell
- **text editor**: nvim

## More
Related projects that I develop.

- [arbie](https://github.com/lbcnz/arbie): automatic and robust backup
- [journal](https://github.com/lbcnz/journal): CLI management of notes and tasks
- [fzfx](https://github.com/lbcnz/fzfx): battle-tested use cases for fzf

## FAQ
### How this works?
I wrote, **link2user** a script to link the dotfiles in this repo to `$HOME`. And, **copy2root**, a script to copy them to `/root` dir.

I use a declarative approach instead of iterating over everything inside `dots` so to allow fine control of what is being linked/copied as unwanted things can be commented out.

```sh
_link ".bashrc"
_link ".zshrc"
...
```

### Why you don't use a bare git repo?
I tried but just didn't like the flow. Maybe doing things differently would improve it but I am happy with my present approach.

I followed the instructions by [harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
```sh
git init --bare $HOME/.dotfiles`
echo 'alias g...="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.aliases
g... config --local status.showUntrackedFiles no
```

### Why you don't use a dotfiles manager?
[twpayne/chezmoi](https://github.com/twpayne/chezmoi) is interesting but I don't need those features right now or they are superseded by other tools that I currently use and so it would add unneeded complexity. That may change in the future though.

> "If you do not personalize your configuration or only ever use a single operating system with a single account and none of your dotfiles contain secrets then you don't need chezmoi." — chezmoi README 

### What else you tried?
I used scripts to sync files back and forth. They work fine but are a bit too bureaucratic to use constantly and do not provide a single source of truth.

I symbolic linked configuration paths from `/root` to `$HOME`. Which is far from ideal because it increases surface for root privilege escalation.

### What is the license?
My own code is under MIT license but components may be under other licenses.
