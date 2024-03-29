#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    concat()
    substring()
    regularExpressions()
    regexShorthand()
    inString()
    stringReplace()
    strLength()
    ordinal()
    formatFcn()
    parseFcn()
    relationalOperators()
}

concat()
{
    ; use the '.' operator to concatenate strings
    str1 := 'hello'
    str2 := 'world'

    ; create 'hello world'
    greeting := str1 . ' ' . str2

    ;MsgBox(greeting)
}

; NewStr := SubStr(String, StartingPos [, Length])
substring()
{
    str := '123abc789'
    ; start at idx=4 (AHK is 1-indexed) and get 3 characters
    result := SubStr(str, 4, 3)
    ; result == 'abc'
    ;MsgBox(result)
}

; FoundPos := RegExMatch(Haystack, NeedleRegEx [, &OutputVar, StartingPos])
regularExpressions()
{
    SubPat := 0
    ; capture all characters ('XYZ') between 'abc' and '123'
    foundPos := RegExMatch('QabcXYZ123', 'abc(.*)123', &SubPat)

    ; foundPos = 2 ('a' is the 2nd letter in 'Qabc...')
    ;MsgBox(foundPos)

    ; SubPat[1] == 'XYZ'
    ;MsgBox(SubPat[1])
}

regexShorthand()
{
    ; can use a ~= b operator shorthand for RegExMatch(a, b)
    foundPos := 'QabcXYZ123' ~= 'abc(.*)123'

    ; foundPos = 2 ('a' is start of match and is 2nd character in LHS string)
    ; MsgBox(foundPos)

    ; MsgBox(A_ComputerName)
}

; FoundPos := InStr(Haystack, Needle [, CaseSense, StartingPos, Occurrence])
; InStr is faster than RegExMatch but does not support regular expressions
inString()
{
    position := InStr('123abc789', 'abc')

    ; position == 4 because 'abc' starts at the 4th letter in the first argument
    ;MsgBox(position)
}

; ReplacedStr := StrReplace(Haystack, Needle [, ReplaceText, CaseSense, &OutputVarCount, Limit])
stringReplace()
{
    ; replaces text
    text := 'hello world'
    newText := StrReplace(text, 'hello', 'hey')
    ; newText == 'hey world'
    ; MsgBox(newText)

    ; replace space (have to use A_Space variable), useful for URLs
    text := 'hello world'
    newText := StrReplace(text, A_Space, '+')
    ; newText == 'hello+world'
    ; MsgBox(newText)
}

strLength()
{
    str := 'hello'
    len := StrLen(str)
    ; len == 5
    ; MsgBox(len)
}

; number := Ord(String)
; ord() returns ascii value for first character in string
ordinal()
{
    str := 'a'
    num := Ord(str)

    ; num == 97 because ascii for 'a' is 97
    ; MsgBox(num)

    str := 'abc'
    num := Ord(str)
    ; num still equals 97 because Ord() only looks at first character
    ; MsgBox(num)
}

; String := Format(FormatStr , Values...)
formatFcn()
{
    ; substitutes idx=2 then idx=1
    s := Format('{2}, {1}!`r`n', 'World', 'Hello')
    ; outputs 'Hello, World!\r\n'
    ; MsgBox(s)

    ; creates '41'
    s := Format('{:02X}', Ord('A'))
    ; MsgBox(s)
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
        ;MsgBox('Color number ' . A_Index . ' is ' . A_LoopField)
    }
}

relationalOperators()
{
    s := 'hello'

    ; result = 1 (true)
    ; '=' does case insensitive compare
    result := (s = 'HELLO')
    ;MsgBox(result)

    ; result = 1 (true)
    ; '==' does case sensitive compare
    result := (s == 'hello')
    ;MsgBox(result)

    ; result = 1 (true)
    result := (s != 'world')
    ;MsgBox(result)
}
