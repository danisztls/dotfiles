# Gaming on Linux
## MangoHud
Exporting `MANGOHUD=1` makes it load automatically for Vulkan games which are the majority. To set up for other games:

- create an app profile: `xxx` 
- add to launch options at Steam: `mangohud %command%`

Global configuration at `~/.config/MangoHud/MangoHud.conf`.

Per app profiles can be used to manage Vsync and frame cap which is useful as games frequently have limited options for those and doing them at a low-level *(Vulkan)* is preferred.

## Dedicated User
**Proton** containerize games through **PressureVessel** but still they are closed source binaries from a diverse range of third-party developers that can read/write/execute everything that the user has access to. And the amount of configuration files that native games can create, many times outside the proper XDG compliant path is painful. A solution is to create a new user just to play games and run Steam. Everything works and it's a lot safer and possibly a bit more performant as could be less things running on the background. Another advantage is the ability of having user settings tailored for gaming. 
