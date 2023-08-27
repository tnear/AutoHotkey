#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    ; assign variables with ':='
    myVar := 5

    ; check for value=5 (use '=' instead of '==' in ahk):
    if (myVar = 5)
    {
        ; create alert 'myVar equals 5.'
        MsgBox('myVar equals ' myVar '.')
    }
    else
    {
        MsgBox('myVar != 5')
    }
}

^k::
{
    ; use brackets to create arrays
    myArray := ['one', 2, 'three']
    ; use brackets to index into arrays:
    myArray[3] := 'four' ; change element to 'four'
    MsgBox(myArray[3]) ; outputs 'four'

    ; use braces to create objects
    day := {Month: 'August', Day: 27}
    MsgBox(day.Month) ; outputs 'August'
}
