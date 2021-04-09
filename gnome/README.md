# Gnome

<!-- TOC GFM -->

* [Shortcuts](#shortcuts)
  * [Desktop](#desktop)
  * [Browsing](#browsing)
* [Hacks](#hacks)
  * [Generate webP thumbnails](#generate-webp-thumbnails)
  * [Override default terminal](#override-default-terminal)
  * [Nautilus scripts](#nautilus-scripts)
    * [Specification](#specification)

<!-- /TOC -->

## Shortcuts
Overview is the center of Gnome Shell. From it is possible to:

- fuzzy search and open applications
- visualize and alternate between workspaces
- visualize open windows and move then between workspaces

### Desktop
| description                                        | bind                       |
| ---                                                | ---                        |
| overview                                           | super                      |
| alternate between windows                          | alt + tab                  |
| alternate between windows of an app                | alt + ~                    |
| alternate between windows (with preview)           | super + tab                |
| alternate between windows of an app (with preview) | super + ~                  |
| go to numbered workspace                           | super + n                  |
| move between workspaces                            | super + left/right         |
| move window to another workspace                   | super + shift + left/right |
| maximize window                                    | super + kp8                |
| toggle fullscren                                   | super + kp5
| view split on left/right                           | super + kp4/kp6            |
| minimize window                                    | super + kp2                |
| close window                                       | super + q                  |
| launch terminal                                    | super + t                  |
| launch file browser                                | super + f                  |
| launch internet browser                            | super + b                  |
| launch mail client                                 | super + m                  |

### Browsing
| description         | bind             |
| ---                 | ---              |
| open tab            | ctrl + t         |
| close tab           | ctrl + w         |
| go to tab           | alt + 1          |
| forward/backward    | alt + left/right |
| go to level up/down | alt + up/down    |
| rename file         | F2               |
| search              | ctrl + f         |

*Note: Some shortcuts are shared between the internet browser and the file browser.*

## Hacks
### Generate webP thumbnails
Gist from [pajadam](https://gist.github.com/pajadam/105ad68686a6c9b8fa30548068ce49d6)

```sh
# Install libwebp
sudo pacman -S libwebp
# Write thumbnailer config
sudo vim /usr/share/thumbnailers/
# Restart nautilus
nautilus -q
# Clear the cache
rm -r "~/.cache/thumbnails"
```

**webp.thumbnailer**
```
[Thumbnailer Entry]
Exec=/usr/bin/dwebp %i -mt -scale %s 0 -o %o
MimeType=image/x-webp;image/webp;
```

### Override default terminal
Gnome will not allow you to set a preferred terminal emulator. It uses a hard-coded list with gnome-terminal at the top. This desktop shortcut is a workaround that tells Gnome to open the file with the `$VISUAL` editor set at your environment. That way you can open files through Nautilus with your preferred editor and terminal emulator, which in my case is Neovim and Alacritty.

```sh
# Install
cp nvim-override.desktop $HOME/.local/share/applications/

# Set $VISUAL at .profile
echo "export VISUAL='alacritty -e nvim'" >> "$HOME/.profile"
```

### Nautilus scripts
Scripts inside `$HOME/.local/share/nautilus/scripts/` appear in GNOME file browser second-click context menu. 

- **Convert to pdf**: Convert the selected files to pdf using pandoc. Auto-detect input format.
- **Create encrypted 7z**: Compress a file or a directory into an encrypted 7z archive (asks for the password in a zenity dialog box).
- **Create encrypted 7z (random**: Compress a file or a directory into an encrypted 7z archive (use a random password and copy it to clipboard).
- **Move assets**: Moves the selected files to an assets dir and copy to clipboard the markdown code to source it. 
- **Open in Code**: Open a dir or file in a new code-oss window. 

#### Specification
These are the variables that nautilus parse to the script.

- **NAUTILUS_SCRIPT_SELECTED_FILE_PATHS**: newline-delimited selected files paths
- **NAUTILUS_SCRIPT_SELECTED_URIS**: newline-delimited selected files URIs
- **NAUTILUS_SCRIPT_CURRENT_URI**: current location URI
- **NAUTILUS_SCRIPT_WINDOW_GEOMETRY**: position and size of current window

Further reading: [NautilusScriptsHowto](https://help.ubuntu.com/community/NautilusScriptsHowto)
