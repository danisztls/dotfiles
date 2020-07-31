# nvim-override
Gnome will not allow you to set a preferred terminal emulator. That is a hard-coded list with gnome-terminal at the top. This desktop shortcut is a workaround that tells Gnome to open the file with your preferred VISUAL editor. Which in my case is `alacritty -e nvim`. That way I can open files through Nautilus with my preferred editor and emulator.

**Install**
`cp nvim-override.desktop $HOME/.local/share/applications/`

Set at `.profile` VISUAL to open your preferred visual editor with your preferred terminal emulator:

```
export VISUAL="alacritty -e nvim"
```

# Browser Auto Picker
Suppose you want to open certain URLs in browser A and everything else at B. This allows you to do that in your desktop environment. By searching for regex patterns in URL and opening the right browser automatically.

`cp browser $HOME/.local/bin/`

`cp browser.desktop $HOME/.local/share/applications/`

Edit http and https schemas at `$HOME/.config/mimeapps.list`.

Edit `.local/bin/browser` and configure your patterns.
