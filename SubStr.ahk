#Requires AutoHotkey v2
#SingleInstance Force

; NewStr := SubStr(String, StartingPos [, Length])

^j::
{
    str := '123abc789'
    ; start at idx=4 (AHK is 1-indexed) and get 3 characters
    result := SubStr(str, 4, 3)
    ; result == 'abc'
    MsgBox(result)
}
