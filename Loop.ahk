#Requires AutoHotkey v2
#SingleInstance Force

; Loop [Count]
^j::
{
    x := 0
    Loop 2
    {
        ; iterate twice, incrementing x each time
        x += 1
    }

    ; ouputs '2'
    MsgBox(x)
}

; Alt+J
!j::
{
    ; infinite loop
    x := 0
    Loop
    {
        x += 1
        if (x = 25)
            break
    }

    ; outputs '25'
    MsgBox(x)
}

; For-loop
; Syntax:
; For Value1 , Value2 in Expression

^k::
{
    array := [0, 1, 2, 3]

    for (val in array)
    {
        ; 4 message boxes: 0, 1, 2, 3
        MsgBox(val)
    }
}


; While loop
; Syntax:
; While Expression
!k::
{
    x := 0
    y := 10

    while (x < y)
    {
        x += 1
    }

    ; outputs 10
    MsgBox(x)
}
