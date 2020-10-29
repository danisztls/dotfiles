# nvim-override
Gnome will not allow you to set a preferred terminal emulator. That is a hard-coded list with gnome-terminal at the top. This desktop shortcut is a workaround that tells Gnome to open the file with the VISUAL editor set at .profile. That way you can open files through Nautilus with your preferred editor and terminal emulator, which in my case is NeoVim and Alacritty.

**Install**
`cp nvim-override.desktop $HOME/.local/share/applications/`

Set at `.profile` VISUAL to open your preferred visual editor with your preferred terminal emulator:

```
export VISUAL="alacritty -e nvim"
```

