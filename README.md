# What is this?
These are some of my Linux configuration files.

# How it works?
I created a bare git repo as instructed by [harfangk](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html).

```shell
git init --bare $HOME/.dotfiles`
echo 'alias git-dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"' >> $HOME/.aliases
git dotfiles config --local status.showUntrackedFiles no
```
