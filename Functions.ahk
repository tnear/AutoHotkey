#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    result := Add(5, 7)

    ; result = 12
    MsgBox(result)

    ; pass argument with '&' prefix to make it a reference parameter
    oldValue := 5
    ChangeValue(&oldValue, 10)

    ; oldValue now equals 10
    MsgBox(oldValue)

    ; pass in argument
    unsetParameter(1)
    ; no argument
    unsetParameter()
}

; value parameters
Add(x, y)
{
    z := x + y
    return z
}

; reference parameters arguments (prefixed with '&')
ChangeValue(&oldValue, newValue)
{
    ; change old value to new value
    ; this affects the call site
    oldValue := newValue
}

; Unset parameters (syntax: argument?)
unsetParameter(arg?)
{
    if IsSet(arg)
        MsgBox('Caller passed: ' arg)
    else
        MsgBox('Caller did not pass anything')
}
