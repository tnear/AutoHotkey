#Requires AutoHotkey v2
#SingleInstance Force

; enable HotIf for  the windows title 'Untitled - Notepad'
#HotIf WinActive('Untitled - Notepad')
!q::
{
    MsgBox 'You pressed ALT+Q in Notepad'
}
; turn off HotIf
#HotIf


#HotIf !WinActive('ahk_exe Notepad.exe')
^j::
{
    MsgBox 'You pressed Ctrl+J not in Notepad'
}
#HotIf
