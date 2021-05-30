# Weechat
CLI client and relay daemon for IRC.

- [Docs](https://weechat.org/files/doc/devel/weechat_user.en.html)
- [My always up-to-date WeeChat configuration](https://gist.github.com/pascalpoitras/8406501/7b81f9fbe9326aafaf4931378751a223f4d89c44)

<!-- TOC GFM -->

* [Bindings](#bindings)
* [Scripts](#scripts)
  * [vimode.py](#vimodepy)
    * [Binds](#binds)
* [Settings](#settings)
* [Service](#service)
  * [Clients](#clients)
  * [Binds](#binds-1)
* [Colors](#colors)
* [Filter](#filter)
* [Integrations](#integrations)

<!-- /TOC -->

## Bindings
| key                  | action                      |
| -                    | -                           |
| `M-[n]` and `M-j[n]`     | jump between buffers        |
| `M-[up,down]`          | move between buffers        |
| `M-B`                  | toggle buffers              |
| `M-N`                  | toggle nicks                |
| `F9 and F10`           | scroll title left and right |

## [Scripts](https://lobste.rs/about)
- autobump.py: move buffers with HLs to top
+ autojoin.py: remember joined channels on exit
+ autosort.py: sort buffers by A-Z, a bit buggy but not critical
+ colorize_nicks.py: colorize nicks HLs
+ go.py: quick jump to a buffer
+ grep.py: search among buffers
+ notify_send.py: send notifications to DE
- vimode.py: add vi binds and features, is buggy
+ yaaa.pl: AFK auto-detection

### [vimode.py](https://github.com/GermainZ/weechat-vimode/)
- `/` searchs
- `:` prefix a command
- most binds will not work
- plugin have it's own [binds](https://github.com/GermainZ/weechat-vimode/#current-key-bindings) and `nmap`

*Note: plugin is buggy and add more trouble/complexity than usability/features*

#### Binds
| key    | action          |
| -      | -               |
| K or H | next buffer     |
| J or L | previous buffer |

## Settings
Setting options by manually editing files is problematic. Set them declaratively through `/set <option> <value>`. Or interactively by `/fset <namespace>`. `/fset *` show all options and `/save` settings to disk.

## Service
Weechat can be setup to run as a service inside a Tmux session. To...
- stay connected and log chat history in background 
- use the same user in extra devices at the same time via relay

### Clients
[Glowing Bear](https://github.com/glowing-bear/glowing-bear): web frontend

### Binds
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
Useless join, part and quit messages can be smart filterated. Display status messages from recently interacted users, filter others. Acts retroactively.

`/filter add irc_smart * irc_smart_filter *`

## Integrations
- [Matrix](https://github.com/poljar/weechat-matrix): seamless
- [Slack](https://github.com/wee-slack/wee-slack): require API token
- [Discord](https://github.com/terminal-discord/weechat-discord): may violate ToS
