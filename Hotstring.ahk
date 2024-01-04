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

; replace after typing 'btw' plus an ending char
;::btw::by the way

; '*': replace immediately (does not wait for ending character)
:*:idk::i don't know

::windows::
{
    ; use '+' to send a shift key
    ; this produces, "Windows"
    Send '+windows'
}

; List of send keys: https://www.autohotkey.com/docs/v2/lib/Send.htm

; use brackets to escape characters
; replace text with literal '!'. Without braces it would be treated as 'Alt'
:*:exclamation::{!}

; 'X' will execute a function
; use A_ThisHotkey to get the autohotkey which was triggered
:X:aaa::executeFcn

executeFcn()
{
    MsgBox(A_ThisHotkey)
}
