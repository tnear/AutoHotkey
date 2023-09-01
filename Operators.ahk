#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    relationalOperators()
    increment()
    power()
    logicalAnd()
    ternary()
}

relationalOperators()
{
    a := 0
    b := 1

    ; result = 1 (true)
    result := (a = 0)
    ;MsgBox(result)

    ; result = 0 (false)
    result := (a > b)
    ;MsgBox(result)

    ; result = 1 (true)
    result := (a != b)
    ;MsgBox(result)

    a := 'a'
    b := 'A'

    ; result = 1 (true)
    ; '=' does case insensitive compare
    result := (a = b)
    ;MsgBox(result)

    ; result = 0 (false)
    ; '==' does case sensitive compare
    result := (a == b)
    ;MsgBox(result)
}

increment()
{
    a := 10
    ++a ; pre-increment
    a++ ; post-increment

    ; a == 12
    ;MsgBox(a)

    --a
    a--

    ; a now equals 10 again
    ;MsgBox(a)
}

power()
{
    a := 2

    result := a ** 5

    ; result == 32
    ;MsgBox(result)
}

logicalAnd()
{
    x := 5

    ; result == 1 (true)
    result := x >= 3 && x < 10
    ; MsgBox(result)

    ; can also do 'and' instead of '&&'
    result := x >= 3 and x < 10
    ; MsgBox(result)
}

ternary()
{
    x := 10

    ; result == -1 because 10 > 5
    result := x > 5 ? -1 : -2
    MsgBox(result)
}
