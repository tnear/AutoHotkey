#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    loopCount()
    infiniteLoop()
    forLoop()
    whileLoop()
    aIndex()
    parseFcn()
}

; Loop [Count]
loopCount()
{
    x := 0
    Loop 2
    {
        ; iterate twice, incrementing x each time
        x += 1
    }

    ; ouputs '2'
    ;MsgBox(x)
}

infiniteLoop()
{
    x := 0
    Loop
    {
        x += 1
        ; use the break statement to exit a loop
        if (x = 25)
            break
    }

    ; outputs '25'
    ;MsgBox(x)
}

; Syntax:
; For Value1 [, Value2] in Expression
forLoop()
{
    array := [0, 1, 2, 3]

    for (val in array)
    {
        ; 4 message boxes: 0, 1, 2, 3
        ;MsgBox(val)
    }
}

; While loop
; Syntax:
; While Expression
whileLoop()
{
    x := 0
    y := 10

    while (x < y)
    {
        x += 1
    }

    ; outputs 10
    ;MsgBox(x)
}

; A_Index stores the current iteration index
; A_Index=1 for iteration #1
aIndex()
{
    str := 'hello'
    result := ''

    Loop StrLen(str)
    {
        ; get one character a a time
        char := SubStr(str, A_Index, 1)

        ; convert each letter to uppercase
        ; note: a better solution is to call StrUpper on entire string,
        ; this example is just to show A_Index
        result .= StrUpper(char)
    }

    ; result == 'HELLO'
    ; MsgBox(result)
}

; Loop Parse String [, DelimiterChars, OmitChars]
; The built-in variable A_LoopField exists within any parsing loop.
; It contains the contents of the current substring (field) from InputVar.
parseFcn()
{
    color := 'red,green,blue'
    delimiterChar := ','
    Loop Parse, color, delimiterChar
    {
        MsgBox('Color number ' . A_Index . ' is ' . A_LoopField)
    }
}
