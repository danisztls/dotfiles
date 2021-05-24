# Weechat
Weechat is a CLI client and relay daemon for IRC.

## Documentation
- [Docs](https://weechat.org/files/doc/devel/weechat_user.en.html)
- [Example conf](https://gist.github.com/spicycode/371ca343201391a7eb5409f3288e2864)

## Bindings
| key                  | action                      |
| -                    | -                           |
| `M-[n]` and `M-j[n]`     | move between buffers        |
| `M-B`                  | toggle buffers              |
| `M-N`                  | toggle nicks                |
| `F9 and F10`           | scroll title left and right |

## [Vimode](https://github.com/GermainZ/weechat-vimode/)
- `/` searchs
- `:` prefix a command
- most binds will not work
- plugin have it's own [binds](https://github.com/GermainZ/weechat-vimode/#current-key-bindings) and `nmap`

### Bindings
| key    | action          |
| -      | -               |
| K or H | next buffer     |
| J or L | previous buffer |

## Settings
Setting options by manually editing files is problematic. Set them declaratively through `/set <option> <value>`. Or interactively by `/fset <namespace>`. `/fset *` show all options and `/save` immediately save settings to disk.

## Service
Weechat can be setup to run as a service inside a Tmux session. To...
- stay connected and log chat history in background 
- use the same user in multiple devices at the same time by use of a relay

- `irc` attachs to session
- `^B-d` detachs

## Colors 
`^c-c[code]` insert color codes 

| code  | color     |
| -     | -         |
| b     | bold      |
| i     | italic    |
| o     | disable   |
| v     | reverse   |
| _     | underline |
| xx,yy | fg and bg |

## Filter
Useless join, part and quit messages can be smart filterated. Only messages from people that recently interacted will de displayed. The filter acts retroactively.

`/filter add irc_smart * irc_smart_filter *`
