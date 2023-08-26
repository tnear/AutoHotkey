#Requires AutoHotkey v2
#SingleInstance Force

; Common AHK key codes:
; ^ = Control
; + = shift
; ! = alt
; # = Windows key
; & = used to combine two keys

; replace after typing 'btw' plus an ending char
::btw::by the way

; '*': replace immediately (no ending character)
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
