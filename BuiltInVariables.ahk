#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    computerName()
}

computerName()
{
    ; outputs 'LAPTOP-JSOBNV2D' on this laptop
    MsgBox(A_ComputerName)
}
