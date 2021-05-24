# Internet Relay Chat (IRC) Reference

<!-- TOC GFM -->

* [Servers](#servers)
* [Clients](#clients)
* [Security](#security)
  * [CertFP](#certfp)
  * [Cloaking](#cloaking)
* [Basics](#basics)
  * [NickServ](#nickserv)
* [Management](#management)
  * [Channel modes](#channel-modes)
  * [ChanServ](#chanserv)
  * [User modes](#user-modes)
  * [Kicking](#kicking)
    * [Automatic kicks](#automatic-kicks)
  * [Banning](#banning)
  * [ACLs](#acls)
    * [Levels](#levels)
  * [Privileges](#privileges)
    * [AOPs](#aops)
    * [SOPs](#sops)
    * [Viewing and setting](#viewing-and-setting)
  * [Color codes](#color-codes)
* [See also](#see-also)

<!-- /TOC -->

## Servers
- [Freenode](https://freenode.net/): suffered a hostile takeover
- [Libera](https://libera.chat/): new fork from freenode following above
- [OFTC](https://www.oftc.net/): old fork from freenode exclusively for open-source projects
- [EFNet](http://www.efnet.org/): a refuge for crackers 
- [Tilde](https://tilde.chat/): unix-centered communities

## Clients
- [Weechat](https://weechat.org/): CLI client and relay server so you can use the same account at the same time on multiple devices
- [ZNC](https://github.com/znc/znc): bouncer that is left connected so an IRC client can disconnect/reconnect without losing the chat session
- [Convos](https://convos.chat/): modern web UI like Discord, has docker setup

## Security
Sending password as plaintext is lax. SSL/TLS while far from perfect on IRC make things a lot safer.

### CertFP
Is an alternative authentication method that uses a X.509 client certificate to authenticate and encrypt upstream communication. Other advantages are changing nicks without deauthing.

### Cloaking
Hostnames are public on IRC and that's asking to be DDoSed. Cloaking is a server feature that hides the host and show something like `user.server.net` inplace. It is also used to tag moderators and related with special cloaks. 

## Basics
| `/join #channel`           | Joins the specified channel.                                                                  |
| `/part #channel`           | Leaves the specified channel.                                                                 |
| `/quit [message]`          | Disconnects from current server with optional leaving message.                                |
| `/server hostname`         | Connects to the specified server.                                                             |
| `/list`                    | Lists all channels on the current network.                                                    |
| `/links`                   | Lists all servers on the current network. May be disabled "for security reasons".             |
| `/nick nickname`           | Changes your nick.                                                                            |
| `/names #channel`          | Shows the nicks of all users on #channel.                                                     |
| `/msg nickname message`    | Sends a private message to a user.                                                            |
| `/query nickname message`  | Sends a private message to a user and opens a private chat window.                            |
| `/me action`               | Prints "yourname action"                                                                      |
| `/notice nickname message` | Sends a notice to the specified user. Like a /msg, but usually makes a sound.                 |
| `/whois nickname`          | Shows information about the specified user. This action is not visible to the specified user. |
| `/whowas nickname`         | Shows information about a user who has quit.                                                  |
| `/dns nickname`            | Attempts to resolve the IP address of the specified user.                                     |
| `/ping nickname`           | Pings the specified user. This action is visible to the specified user.                       |

### NickServ
All NickServ commands begin with `/ns` or `/msg NickServ`. Depending on your client or network, `/ns` may not work. For brevity I will use the shorthand. 

| `/ns register password [email]`    | Registers your current nick with NickServ with the chosen password and binds it to an e-mail address (optional).        |
| `/ns identify password`            | Identifies your nick to NickServ using the password you set.                                                            |
| `/ns recover nickname password`    | Kills (forcibly disconnects) someone who has your registered nick.                                                      |
| `/ns ghost nickname password`      | Terminates a "ghost" IRC session that's using your nickname.                                                            |
| `/ns set password yournewpassword` | Changes your password. **NOTE:** Under no circumstances should you change your nick to the letter O followed by 8 digit.    |

## Management
### Channel modes
Set a mode with: `/mode #channel +/-attribute [data]`

| mode        | description                                                                          |
| -           | -                                                                                    |
| `+n`          | Disallows external messages.                                                         |
| `+t`          | Only op/hops can set the topic.                                                      |
| `+p`          | Sets the channel as invisible in /list.                                              |
| `+s`          | Sets the channel as invisible in /list and /whois.                                   |
| `+i`          | Sets the channel as closed unless the person was invited.                            |
| `+k [pass]`   | Sets a password for the channel which users must enter to join.                      |
| `+l [number]` | Sets a limit on the number of users who are allowed in the channel at the same time. |
| `+m`          | Prevents users who are not opped/hopped/voiced from talking.                         |
| `+R`          | Sets the channel so only registered nicks are allowed in.                            |
| `+M`          | Sets the channel so only registered nicks are allowed to talk.                       |
| `+S`          | Strips formatting from messages, rendering them as plaintext.                        |
| `+c`          | Blocks messages containing color codes.                                              |
| `+i`          | A user must be invited to join the channel.                                          |
| `+N`          | No nick changes permitted in the channel.                                            |


### ChanServ
All ChanServ commands begin with `/cs` or `/chanserv` or `/msg ChanServ`. Depending on your client and network, `/cs` or `/chanserv` may not work. I will use the shorthand in these examples.

| cmd                                        | description                                                                               |
| -                                          | -                                                                                         |
| `/cs identify #channel <password>`           | Identifies you as the channel's founder and gives you founder-level privileges.           |
| `/cs set #channel mlock modes`               | Locks the channel's modes. Just + unlocks all.                                            |
| `/cs set #channel secureops [on/off]`        | Keeps everyone except aops, sops, and the founder from becoming ops.                      |
| `/cs set #channel keeptopic [on/off]`        | Maintains the topic even if everyone leaves.                                              |
| `/cs set #channel enforce [on/off]`          | Restores op/halfop/voice if a person with op/halfop/voice gets de-opped/halfopped/voiced. |
| `/cs set #channel leaveops [on/off]`         | Whether or not to allow the first person who join the channel to get ops.                 |
| `/cs register #channel password description` | Registers the current channel to you with ChanServ and sets its password and description. |
| `/cs drop #channel [dropcode]`               | Un-registers the current channel to you with ChanServ.                                    |
| `/cs set #channel founder [nickname]`        | Sets the current channel's founder.                                                       |
| `/cs set #channel password [newpass]`        | Changes the current channel's password to newpass.                                        |
| `/cs set #channel desc [description]`        | Changes the current channel's description.                                                |
| `/cs set #channel url [address]`             | Associates a URL with the channel.                                                        |
| `/cs set #channel [email@address]`           | Associates an email address with the channel.                                             |

### User modes
| -  | -                                                                                            |
| `+q` | User is owner of the current channel (prefix `~` on UnrealIRCd, usually `@` elsewhere)           |
| `+a` | User is an admin **(SOP)** on the current channel (prefix `&` on UnrealIRCd, usually `@` elsewhere). |
| `+o` | User is an operator **(AOP)** on the current channel (prefix `@`).                                 |
| `+h` | User is a half-op on the current channel (prefix `%`).                                         |
| `+v` | User has voice on the current channel (prefix `+`).                                            |

### Kicking
```erlang
% Temporarily remove user from channel:
/kick #channel nickname [reason]

% Setting people's modes (for current channel only):
/mode nickname +/-attributes [data]
```

#### Automatic kicks
People on the AKICK list are automatically kicked and banned when they enter the channel. Bans made as a result of AKICK must be removed manually.
```erlang
% Adds host to #channel's AKICK list [for reason]
/cs akick #channel add host [reason]

% Removes host from the AKICK list
/cs akick #channel del host

% Displays the AKICK list
/cs akick #channel list
/cs akick #channel view
```

### Banning
```erlang
% Hosts take the following form: 'nickname!userid@hostname'
% Use '/whois', '/whowas' or '/who' to find the information necessary for a ban.
% '*' is a wildcard and can replace 'nickname', 'userid', parts of nickname or 'userid', 'hostname' or a segment of a 'hostname'.
/mode #channel +b hosts

% Examples
% Prevent anyone with the nick joe from joining.
joe!*@*

% Prevent anyone whose nick contains myg0t from joining.
*myg0t*!*

% Prevent anyone with the nick mark and the userid elc from joining.
mark!*elc@*

% Prevent anyone with the host c-123-24-76-213.ga.isp.net from joining.
*!*@c-123-24-76-213.ga.isp.net

% Bans everyone. Don't do that.
*!*@*
```
### ACLs
```erlang
% Adds nickname to the channel's access list at the specified level.
/cs access #channel add [nickname] [level]

% Removes nickname from the channel's access list.
/cs access channel del [nickname]

% Displays the channel's access list.
/cs access #channel list

% Displays how many entries are in the channel's access list.
/cs access #channel count
```

#### Levels
```sql
founder -- full access to ChanServ functions, automatic opping upon entering channel
100+    -- makes the person an SOP, automatic opping upon entering channel
50      -- makes the person an AOP, automatic opping upon entering channel
40      -- automatic halfopping
30      -- automatic voicing
0       -- no special privileges
1       -- may not be opped
100     -- may not join the channel
```
Any nick not on the access list has an access level of `0`.

These may vary from network to network. For example, some networks do not go by tens and use 3, 4, 5, 10, etc.

### Privileges
#### AOPs
- Are automatically ops and can give themselves ops.
- Can give/take op/halfop/voice to/from other channel members.
- Can unban themselves.
- Receive memos sent to the whole channel.
- Can invite themselves to the channel.

#### SOPs
- Can do everything AOPs can.
- Can give and take AOP privileges.
- Receive memos sent to the channel's SOPs.
- Can add (but not remove) AKICKs.

#### Viewing and setting
```erlang
% Viewing AOP and SOP lists
/cs aop #channel list`
/cs sop #channel list

Adding a AOP or SOP
/cs [AOP|SOP] channel [ADD|DEL|LIST|CLEAR] [nick | entry-list]
```

### Color codes
It's possible to color your text in IRC. In most clients you can use `^c` then `fg,bg` *(bg is optional)*.

Examples: red text: `^c4`; black text on a blue bg: `^c1,2`.

| Number | Name                          |
| -      | -                             |
| 00     | white                         |
| 01     | black                         |
| 02     | blue (navy)                   |
| 03     | green                         |
| 04     | red                           |
| 05     | brown (maroon)                |
| 06     | purple                        |
| 07     | orange (olive)                |
| 08     | yellow                        |
| 09     | light green (lime)            |
| 10     | teal (a green/blue cyan)      |
| 11     | light cyan (cyan / aqua)      |
| 12     | light blue (royal)            |
| 13     | pink (light purple / fuchsia) |
| 14     | grey                          |
| 15     | light grey (silver)           |

## See also
- Heavily based on [xero/IRC Reference](https://gist.github.com/xero/2d6e4b061b4ecbeb9f99)
- [IRCv3](https://github.com/ircv3/ircv3-specifications/milestone/4/) in development
