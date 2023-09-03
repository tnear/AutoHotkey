#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    assign()
    arrays()
    objects()
}

assign()
{
    ; assign variables with ':='
    myVar := 5

    ; check for value=5 (use '=' instead of '==' in ahk):
    if (myVar = 5)
    {
        ; create alert 'myVar equals 5.'
        MsgBox('myVar equals ' . myVar . '.')
    }
    else if (myVar = 6)
    {
        MsgBox('myVar == 6')
    }
    else
    {
        MsgBox('myVar != 5')
    }
}

arrays()
{
    ; use brackets to create arrays
    myArray := ['one', 2, 'three']
    ; use brackets to index into arrays:
    myArray[3] := '3' ; change element 3 to '3'

    ; outputs '3'
    ;MsgBox(myArray[3])

    ; use Push() to append to array
    myArray.Push('new element')
    ; outputs 'new element'
    ; MsgBox(myArray[4])

    ; use Length to get number of elements in the array
    Loop myArray.Length
    {
        ;MsgBox(myArray[A_Index])
    }

    ; range-for loop to iterate through elements of an array:
    for (val in myArray)
    {
        ;MsgBox(val)
    }

    ; Pop() removes last item
    lastValue := myArray.Pop()
    ; alerts 'new elment'
    ;MsgBox(lastValue)

    ; size went from 4 -> 3 after the Pop
    ;MsgBox(myArray.Length)
}

objects()
{
    ; use braces to create objects
    day := {Month: 'August', Day: 27}

    ; outputs 'August'
    ;MsgBox(day.Month)
}
