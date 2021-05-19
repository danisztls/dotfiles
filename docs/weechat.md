# Weechat
Weechat is a CLI client and relay daemon for IRC.

## Documentation
- [Docs](https://weechat.org/files/doc/devel/weechat_user.en.html)
- [Example conf](https://gist.github.com/spicycode/371ca343201391a7eb5409f3288e2864)

## Bindings
| key                  | action            |
| -                    | -                 |
| `M-[n]` and `M-j[n]`     | move between tabs |
| `M-B`                  | toggle buffers    |
| `M-N`                  | toggle nicks      |

## Vim Plugin
- `/` searchs
- `:` prefix a command

## Settings
Setting options via editing files is problematic. They can be set declaratively through `/set <option> <value>`. Or interactively `/fset <namespace>`. `/fset *` show all options.

## Service
Weechat can be setup to run as a service inside a Tmux session. This way it can be used as a CLI and as a relay/daemon.

- `irc` attachs to session
- `^B-d` detachs

## Troubleshooting
TODO: Many binds only work at command mode and behave erratic.

TODO: Colors are limited when running inside Tmux.

I verified that Tmux is with True Color enabled through:

`printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"`
