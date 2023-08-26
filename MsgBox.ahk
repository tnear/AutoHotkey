#Requires AutoHotkey v2
#SingleInstance Force

; Hotkey
; Map Ctrl+J to create a message box
^j::
{
    MsgBox 'You typed Ctrl+J'
}

; Hotstring
; use b0 to set backspace to zero so that text does not disappear
:b0:ctrlj::
{
    MsgBox 'You typed "ctrlj"'
}
