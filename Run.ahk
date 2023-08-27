#Requires AutoHotkey v2
#SingleInstance Force

; Make Ctrl+J open Windows Notepad
^j::
{
    Run 'notepad.exe'
}

; Make Ctrl+K open a site. This uses your default browser and creates a new tab.
^k::
{
    Run 'https://en.wikipedia.org'
}

; Run with parameters:
; Run 'MyProgram.exe Param1 Param2'
