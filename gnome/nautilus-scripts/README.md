# What it is
Scripts inside *$HOME/.local/share/nautilus/scripts/* will appear in GNOME file browser second-click context menu. Those can be used to automate common tasks and make life easier.

TODO: Review script code and make improvements. +later

# Documentation
## Scripts
- **Convert to pdf**: Convert the selected files to pdf using pandoc. Auto-detect input format.
- **Create encrypted 7z**: Compress a file or a directory into an encrypted 7z archive (asks for the password in a zenity dialog box).
- **Create encrypted 7z (random**: Compress a file or a directory into an encrypted 7z archive (use a random password and copy it to clipboard).
- **Move assets**: Moves the selected files to an assets dir and copy to clipboard the markdown code to source it. 
- **Open in Code**: Open a dir or file in code-oss in a new window. 

## Variables
These are the variables that nautilus parse to the script.

- **NAUTILUS_SCRIPT_SELECTED_FILE_PATHS**: newline-delimited selected files paths
- **NAUTILUS_SCRIPT_SELECTED_URIS**: newline-delimited selected files URIs
- **NAUTILUS_SCRIPT_CURRENT_URI**: current location URI
- **NAUTILUS_SCRIPT_WINDOW_GEOMETRY**: position and size of current window

## Further reading
https://help.ubuntu.com/community/NautilusScriptsHowto
