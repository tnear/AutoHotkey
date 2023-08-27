#Requires AutoHotkey v2
#SingleInstance Force

; Common AHK key codes:
; ^ = Control
; + = shift
; ! = alt
; # = Windows key
; & = used to combine two keys

; Ctrl+J
^j::
{
    MsgBox 'You typed Ctrl+J'
}

+j::
{
    MsgBox 'You typed Shift+J'
}

!j::
{
    MsgBox 'You typed Alt+J'
}

#j::
{
    MsgBox 'You typed Win+J'
}

; Press + hold Numpad0 then press Numpad1
Numpad0 & Numpad1::
{
    MsgBox 'You pressed Numpad1 while holding down Numpad0.'
}

; Use 'Down' and 'Up' to specify key press type
^k::
{
    ; make Ctrl+k send a capital 'S'
    Send '{Shift Down}s{Shift Up}'
}
