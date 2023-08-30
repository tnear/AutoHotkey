#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    stringNumber := InputBox('Enter your favorite number:').value
    ; convert the string to an integer
    integerNumber := Integer(stringNumber)
    MsgBox(integerNumber)
}
