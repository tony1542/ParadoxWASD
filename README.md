# What is this?
This is a way to play older Paradox titles with WASD movement rather than arrow keys for camera movement. It also includes some HOI4-specific macros for division designers.

# How do I use it?
Ensure you have [AutoHotKey installed](https://github.com/AutoHotkey/AutoHotkey/releases) and simply run the WASD_Paradox.ahk file from this repository.

# Notes
If you aren't on a Windows machine, you should update the following block
```autohotkey
End::
Suspend Toggle
If %A_IsSuspended%
  SoundPlay %WINDIR%\media\Windows Hardware Remove.wav
Else
  SoundPlay %WINDIR%\media\Windows Hardware Insert.wav
Return
```
To the following
```autohotkey
;End::
;Suspend Toggle
;If %A_IsSuspended%
;  SoundPlay %WINDIR%\media\Windows Hardware Remove.wav
;Else
;  SoundPlay %WINDIR%\media\Windows Hardware Insert.wav
;Return
```

## HOI4 macros
These assume you have not moved your division designer; if you have, the macros will not work properly