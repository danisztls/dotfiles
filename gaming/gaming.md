# Gaming on Linux
## MangoHud
Exporting `MANGOHUD=1` makes it load automatically for Vulkan games which are the majority. To set up for other games:

- create an app profile: `xxx` 
- add to launch options at Steam: `mangohud %command%`

Global configuration at `~/.config/MangoHud/MangoHud.conf`.

Per app profiles can be used to manage Vsync and frame cap which is useful as games frequently have limited options for those and doing them at a low-level *(Vulkan)* is preferred.

## Steam
### CLI
[Command Line Options](https://developer.valvesoftware.com/wiki/Command_Line_Options#Steam_.28Windows.29)

### Flags
```shell
export STEAM_RUNTIME=1  # packaged or native libs
```
### Launch options
`mangohud %command%`

### Resources
- [Steam DB](https://steamdb.info/): general database
- [Steam News Center](https://store.steampowered.com/news): news portal
- [ProtonDB](https://www.protondb.com/): compatibility database
- [SteamTinker](https://github.com/frostworx/steamtinkerlaunch): custom launch options

## See also
- [AntiMicroX](https://github.com/AntiMicroX/antimicroX): map keyboard/mouse controls to gamepad
