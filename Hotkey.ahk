#Requires AutoHotkey v2
#SingleInstance Force

; Common AHK modifier symbols:
; ^ = Control
; + = shift
; ! = alt
; # = Windows key
; & = used to combine two keys
; < = use left key pair (ex: left alt, left shift, ...)
; > = use right key pair
; ~ = triggers both the key and your callback. Ex: ~a::MsgBox will trigger both a message box and 'a' press.

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

; multiple hotkeys for same callback (stacked vertically)
^Numpad0::
^Numpad1::
{
    MsgBox('You pressed either ctrl+numpad0 or ctrl+numpad1')
}
