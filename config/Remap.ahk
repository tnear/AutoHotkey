#Requires AutoHotkey v2
#SingleInstance Force

; Common AHK modifier symbols:
; ^ = Control
; + = Shift
; ! = Alt
; # = Windows key

if A_ComputerName == 'LAPTOP-JSOBNV2D'
{
    ; permanently enable Num Lock
    SetNumLockState('AlwaysOn')
}

; Match MATLAB's Command window (not editor)
; 1 = Title must start with
; Match MATLAB's Command window (not editor)
; 1 = Title must start with
; 2 = (default) A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode(1)

; Ctrl+Backspace and Ctrl+Delete in MATLAB (not needed for editor because it already supports these):
#HotIf WinActive('MATLAB R')
    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; Ctrl+Delete (F12 is remapped to Delete)
    ^F12::SendInput('^+{Right}{Delete}')
#HotIf

SetTitleMatchMode(2)

#HotIf WinActive('ahk_exe MATLAB.exe')
    ; Map Ctrl+D to End (default for Ctrl+D is Open)
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Alt+G to Open (default is Ctrl+D)
    !g::^d

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        insertLineAbove()
    }

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }

    ; Ctrl+Shift+Delete (F12 is remapped to Delete)
    ^+F12::
    {
        deleteLineRight()
    }
#HotIf

; Remap 4 keys above num pad (Virtual Box uses its own mapping):
; Note: this also checks the current computer name
#HotIf !WinActive('ahk_exe VirtualBoxVM.exe') and A_ComputerName == 'LAPTOP-JSOBNV2D'
    Delete::Home
    Pause::PgUp
    PrintScreen::PgDn
    Home::End

    ; Enable delete and print screen after remapping 4 above:
    F12::Delete
    ; F11::PrintScreen ; interferes with debugging, maybe shift + PrtScr instead?
    +F11::PrintScreen
#HotIf !WinActive()

#HotIf WinActive('ahk_exe notepad.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    {
        insertLineBelow()
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        insertLineAbove()
    }

    ; Alt+Up to move current line up
    !Up::
    {
        moveLineUp()
    }

    ; Alt+Down to move current line down
    !Down::
    {
        moveLineDown()
    }

    ; Ctrl+Shift+X
    ^+x::
    {
        cutCurrentLine()
    }

    ; Ctrl+Shift+C
    ^+c::
    {
        copyCurrentLine()
    }

    ; Ctrl+G
    ^g::
    {
        gotoLineNumber()
    }

    ^WheelUp::
    ^WheelDown::
    {
        ; disable Ctrl+Wheel which changes font size
    }

    ; Ctrl+Comma
    ^,::
    {
        selectCurrentWord()
    }

    ; Ctrl+Shift+Q to lookup selected text on the web
    ^+q::
    {
        lookupSelectedTextOnGoogle()
    }

    ^l::
    {
        moveRightOneWord()
    }

    ^+l::
    {
        moveCursorRightOneWordWithSelection()
    }

    ^+h::
    {
        moveCursorLeftOneWordWithSelection()
    }

    ^j::
    {
        moveCursorDown()
    }

    ^+j::
    {
        moveCursorDownWithSelection()
    }

    ^k::
    {
        moveCursorUp()
    }

    ; move line up with selection
    ^+k::
    {
        moveCursorUpWithSelection()
    }

    ; map Ctrl+/ to Ctrl+H (replace)
    ^/::^h

    ; Ctrl+H to move left
    ^h::
    {
        moveLeftOneWord()
    }

    ; disable Ctrl+{=,-} to zoom
    ^=::
    ^-::
    ^NumpadAdd::
    ^NumpadSub::
    {
    }

    ; use Ctrl+Shift+{=,-} to zoom instead
    ^+=::^=
    ^+-::^-
#HotIf

#HotIf WinActive('ahk_exe Rainlendar2.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    {
        insertLineBelow()
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        insertLineAbove()
    }

    ; Map Tab to 4 spaces (default behavior is to cycle focus on dialog controls)
    Tab::SendInput('    ')

    ; Alt+Up to move current line up
    !Up::
    {
        moveLineUp()
    }

    ; Alt+Down to move current line down
    !Down::
    {
        moveLineDown()
    }

    ; Ctrl+Shift+X
    ^+x::
    {
        cutCurrentLine()
    }

    ; Ctrl+Shift+C
    ^+c::
    {
        copyCurrentLine()
    }

    ; Ctrl+Comma
    ^,::
    {
        selectCurrentWord()
    }

    ; Ctrl+Shift+Q to lookup selected text on the web
    ^+q::
    {
        lookupSelectedTextOnGoogle()
    }

    ^l::
    {
        moveRightOneWord()
    }

    ^+l::
    {
        moveCursorRightOneWordWithSelection()
    }

    ^h::
    {
        moveLeftOneWord()
    }

    ^+h::
    {
        moveCursorLeftOneWordWithSelection()
    }

    ^j::
    {
        moveCursorDown()
    }

    ^+j::
    {
        moveCursorDownWithSelection()
    }

    ^k::
    {
        moveCursorUp()
    }

    ^+k::
    {
        moveCursorUpWithSelection()
    }

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }
#HotIf

#HotIf WinActive('ahk_exe firefox.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D (bookmark)
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ; Note: Ctrl+Enter adds '.com' to URLs
    ^+Enter::
    {
        insertLineAbove()
    }

    ; Map Ctrl+[ to Page Up
    ^[::PgUp

    ; Map Ctrl+] to Page Down
    ^]::PgDn

    ; Alt+Up to move current line up
    !Up::
    {
        moveLineUp()
    }

    ; Alt+Down to move current line down
    !Down::
    {
        moveLineDown()
    }

    ; Ctrl+Shift+Q to lookup selected text on the web
    ^+q::
    {
        lookupSelectedTextOnGoogle()
    }

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }

    ; Ctrl+Shift+Delete (F12 is remapped to Delete)
    ^+F12::
    {
        deleteLineRight()
    }

    ; Ctrl+H to move left
    ^h::
    {
        moveLeftOneWord()
    }

    ^+h::
    {
        moveCursorLeftOneWordWithSelection()
    }

    /*
    // ----Web browser programming start----
    ^j::
    {
        moveCursorDown()
    }

    ^+j::
    {
        moveCursorDownWithSelection()
    }

    ^k::
    {
        moveCursorUp()
    }

    ; move line up with selection
    ^+k::
    {
        moveCursorUpWithSelection()
    }

    ^l::
    {
        moveRightOneWord()
    }

    ^+l::
    {
        moveCursorRightOneWordWithSelection()
    }
    // ----Web browser programming stop----
    */

    ; Ctrl+Comma
    ^,::
    {
        selectCurrentWord()
    }

    ; Ctrl+Shift+X
    ^+x::
    {
        cutCurrentLine()
    }

    ; Ctrl+Shift+C
    ^+c::
    {
        copyCurrentLine()
    }

    ; Ctrl+Shift+A to select all text, copy, and remove selection
    ^+a::
    {
        selectAllAndCopy()
    }
    
#HotIf

#HotIf WinActive('ahk_exe chrome.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D (bookmark)
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        insertLineAbove()
    }

    ; Map Ctrl+[ to Page Up
    ^[::PgUp

    ; Map Ctrl+] to Page Down
    ^]::PgDn

    ; Ctrl+Shift+Q to lookup selected text on the web
    ^+q::
    {
        lookupSelectedTextOnGoogle()
    }

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }

    ; Ctrl+Shift+Delete (F12 is remapped to Delete)
    ^+F12::
    {
        deleteLineRight()
    }

    ; Ctrl+H to move left
    ^h::
    {
        moveLeftOneWord()
    }

    ^+h::
    {
        moveCursorLeftOneWordWithSelection()
    }

    ; Ctrl+Comma
    ^,::
    {
        selectCurrentWord()
    }

    ; Ctrl+Shift+P, create new private window
    ; This rule aligns Chrome with Firefox
    ^+p::
    {
        SendInput('^+n')
    }

    ; Ctrl+Shift+X
    ^+x::
    {
        cutCurrentLine()
    }

    ; Ctrl+Shift+C
    ^+c::
    {
        copyCurrentLine()
    }
#HotIf

#HotIf WinActive('ahk_exe WindowsTerminal.exe') or WinActive('ahk_exe powershell.exe') or WinActive('ahk_exe cmd.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Shift+Space to Space. Most editors already do this but terminal/powershell does not.
    +Space::SendInput('{Space}')

    ^l::
    {
        moveRightOneWord()
    }

    ^+l::
    {
        moveCursorRightOneWordWithSelection()
    }

    ^h::
    {
        moveLeftOneWord()
    }

    ^+h::
    {
        moveCursorLeftOneWordWithSelection()
    }

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }

    ; Ctrl+Shift+Delete (F12 is remapped to Delete)
    ^+F12::
    {
        deleteLineRight()
    }

    ^WheelUp::
    ^WheelDown::
    {
        ; disable Ctrl+Wheel which changes font size
    }

    ; disable Ctrl+{=,-} to zoom
    ^=::
    ^-::
    ^NumpadAdd::
    ^NumpadSub::
    {
        ; do nothing
    }

    ; use Ctrl+Shift+{=,-} to zoom instead
    ^+=::^=
    ^+-::^-

    ; Ctrl+Comma
    ^,::
    {
        selectCurrentWordBasic()
    }
#HotIf

#HotIf WinActive('ahk_exe WINWORD.exe')
    /*
    ; Map Ctrl+Enter to insert line below and move cursor
    ; Note: currently disabled, interferes with Insert Page Break
    ^Enter::
    ^NumpadEnter::
    {
        insertLineBelow()
    }
    */

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    ^+NumpadEnter::
    {
        insertLineAbove()
    }

    ; Ctrl+Shift+X
    ^+x::
    {
        cutCurrentLine()
    }

    ; Note: Ctrl+Shift+C -- Word handles up/down with selection differently

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }

    ; Ctrl+Shift+Delete (F12 is remapped to Delete)
    ^+F12::
    {
        deleteLineRight()
    }

    ^+h::
    {
        moveCursorLeftOneWordWithSelection()
    }

    ^j::
    {
        moveCursorDown()
    }

    ^+j::
    {
        moveCursorDownWithSelection()
    }

    ^k::
    {
        moveCursorUp()
    }

    ; move line up with selection
    ^+k::
    {
        moveCursorUpWithSelection()
    }

    ^l::
    {
        moveRightOneWord()
    }

    ^+l::
    {
        moveCursorRightOneWordWithSelection()
    }

    ; map Ctrl+/ to Ctrl+H (replace)
    ^/::^h

    ; Ctrl+H to move left
    ^h::
    {
        moveLeftOneWord()
    }

    ; Ctrl+Comma to select current word
    ^,::
    {
        ; F8 enters extended mode, F8x2 selects word, Escape exits
        SendInput('{F8}{F8}{Esc}')
    }
#HotIf

#HotIf WinActive('ahk_exe MusicBee.exe')
    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+D to End
    ^d::End

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }
#HotIf

; Media Player Classic
#HotIf WinActive('ahk_exe mpc-hc64.exe')
    ; Ctrl+W to Alt+F4 to close window
    ^W::SendInput('!{F4}')

    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }
#HotIf

; File Explorer
#HotIf WinActive('ahk_exe explorer.exe')
    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; Ctrl+K to use Find dialog in top right (like Firefox)
    ^k::^f

    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Ctrl+Shift+Backspace
    ^+Backspace::
    {
        deleteLineLeft()
    }
#HotIf

#HotIf WinActive('ahk_exe Audacity.exe')
    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; utility to balance audio, clear metadata tags, and export over original file
    ; ctrl+shift+a
    ^+a::
    {
        ; select all audio
        SendInput('^a')

        ; open Effect menu (alt+c)
        SendInput('!c')

        ; choose Volume and Compression then Amplify...
        SendInput('{Down}{Down}{Down}{Right}{Enter}')

        ; balance audio by choosing the default amplification
        SendInput('{Enter}')

        ; export as mp3 with alt+f+e+3 (f=file, e=export, 3=mp3)
        SendInput('!fe3')

        ; wait Export Audio dialog to open (wait 3 seconds)
        WinWait('Export Audio', , 3)

        ; overwrite the existing file
        SendInput('{Enter}')

        ; wait for overwrite Warning dialog (wait 3 seconds)
        WinWait('Warning', , 3)

        ; accept warning
        SendInput('{Enter}')

        ; wait for Edit Metadata Tags dialog to appear (wait 3 seconds)
        WinWait('Edit Metadata Tags', , 3)

        ; clear all audio metadata tags with alt+e
        SendInput('!e')

        ; export file
        SendInput('{Enter}')
    }
#HotIf

#HotIf WinActive('ahk_exe EXCEL.exe')
    ; Ctrl+Backspace
    ^BS::SendInput('^+{Left}{Delete}')

    ; Ctrl+Delete (F12 is already remapped to Delete)
    ^F12::SendInput('^+{Right}{Delete}')
#HotIf

#HotIf WinActive('ahk_exe notepad++.exe')
    ^WheelUp::
    ^WheelDown::
    ^NumpadAdd::
    ^NumpadSub::
    {
        ; disable Ctrl+Wheel and +/- zoom which changes font size
    }

    ; Ctrl+Shift+Q to lookup selected text on the web
    ^+q::
    {
        lookupSelectedTextOnGoogle()
    }

    ; Ctrl+<comma>: select current word
    ^,::
    {
        ; Note: this doesn't work when the cursor is at the far right of the last word on a line
        ;SendInput('{Right}^{Left}^+{Right}')

        ; works but requires opening the Find dialog then immediately closing:
        SendInput('^f{Escape}')
    }

    ; Ctrl+Shift+Backspace -- Notepad++ natively supports this but it deletes to column 0
    ; instead of ignoring leading whitespace
    ^+Backspace::
    {
        deleteLineLeft()
    }

    ; these notepad++ settings seem to be lost when installing updates
    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D
    ^e::^d

    ; Map Ctrl+N (normally inserts unicode char) to Ctrl+T (which creates a new tab)
    ^n::^t
#HotIf

; Microsoft PowerPoint
#HotIf WinActive('ahk_exe POWERPNT.EXE')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ; (inteferes with New Slide shortcut)
    ;^m::Home

    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    {
        insertLineBelow()
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        insertLineAbove()
    }
#HotIf

; Visual Studio Code
#HotIf WinActive('ahk_exe code.exe')
    ; Ctrl+Shift+Q to lookup selected text on the web
    ^+q::
    {
        lookupSelectedTextOnGoogle()
    }

    ; Ctrl+Shift+C to copy current line (without newline)
    ^+c::
    {
        SendInput('{End}{Shift Down}{Home}{Shift Up}^c')
    }
#HotIf

moveLineUp()
{
    currentClipboard := ClipboardAll() ; cache current clipboard

    ; select current line
    SendInput('{End}')
    SendInput('{Shift Down}{Home}{Shift Up}')

    ; cut current text
    SendInput('^x')
    ClipWait

    ; insert cut line up one
    SendInput('{Backspace}{Home}{Enter}{Up}')
    SendInput('^v')
    Sleep(25) ; necessary sleep of 25ms
    A_Clipboard := currentClipboard ; restore clipboard
}

moveLineDown()
{
    currentClipboard := ClipboardAll() ; cache current clipboard

    ; select current line
    SendInput('{End}')
    SendInput('{Shift Down}{Home}{Shift Up}')

    ; cut current text
    SendInput('^x')
    ClipWait

    ; insert cut line down one
    SendInput('{Delete}{End}{Enter}')
    SendInput('^v')
    Sleep(25) ; necessary sleep of 25ms
    A_Clipboard := currentClipboard ; restore clipboard
}

cutCurrentLine()
{
    ; move selection to front of line
    SendInput('{Home}')

    ; select going down
    SendInput('{Shift Down}{Down}{Shift Up}')

    ; cut this selection
    SendInput('^x')
    ClipWait
}

copyCurrentLine()
{
    ; move selection to front of line
    SendInput('{Home}')

    ; select going down
    SendInput('{Shift Down}{Down}{Shift Up}')

    ; copy this selection
    SendInput('^c')
    ClipWait

    ; move cursor back to original line
    SendInput('{Up}')
}

; a prototype function
gotoLineNumber()
{
    ; convert the string to an integer
    stringNumber := InputBox('Go to line number:').value

    try
    {
        integerNumber := Integer(stringNumber)
    }
    catch TypeError
    {
        MsgBox('Error: unable to convert to integer')
        return
    }

    if (integerNumber > 5000)
    {
        ; higher than this simple function is designed for
        return
    }

    ; move cursor to start of document
    SendInput('^{Home}')

    ; move cursor down by repeatedly sending {Down}
    currentLineNumber := 1
    while (currentLineNumber < integerNumber)
    {
        SendInput('{Down}')
        currentLineNumber += 1
    }
}

lookupSelectedTextOnGoogle()
{
    ; cache current clipboard
    originalClipboard := ClipboardAll()

    ; clear clipboard
    A_Clipboard := ''

    ; send Ctrl+C to copy text (note: this will copy entire line in VSCode if there is no selection)
    SendInput('^c')
    ClipWait(1)

    ; Open Google search if there is selected text
    if (A_Clipboard != '')
    {
        searchQuery := 'https://www.google.com/search?q=' . UriEncode(A_Clipboard)
        Run(searchQuery)
    }

    A_Clipboard := originalClipboard ; restore clipboard
}

; Function to URL encode the text
UriEncode(text)
{
    encodedText := ''

    ; loop through each character in text
    Loop StrLen(text)
    {
        ; get one character at a time
        char := SubStr(text, A_Index, 1)

        ; '~=' is shorthand for 'RegExMatch'
        if (char ~= '[a-zA-Z0-9-_.~]')
        {
            ; these characters do not need to be encoded
            encodedText .= char
        }
        else
        {
            ; encode this character with its ascii value
            asciiValue := Format('{:02X}', Ord(char))
            encodedText .= '%' . asciiValue
        }
    }

    return encodedText
}

_checkIfAWordCharacterIsSelected()
{
    originalClipboard := ClipboardAll() ; cache clipboard

    ; copy selection
    SendInput('^c')
    ClipWait
    Sleep(10) ; necessary sleep

    ; check if it's a word character using this regex
    ; note: every char in here should be one in which ctrl+shift+{left,right} skips past
    ret := A_Clipboard ~= '[a-zA-Z0-9_]'

    A_Clipboard := originalClipboard ; restore clipboard

    return ret
}

; returns TRUE for: |abc, a|bc, ab|c, abc| (where | is the cursor)
; returns FALSE for all else: '| abc', 'abc |', ' .| ', etc.
_checkIfCursorIsWithinWord()
{
    ; check if one char left is a word character
    SendInput('+{Left}')

    isWord := _checkIfAWordCharacterIsSelected()

    ; reset cursor
    SendInput('{Left}{Right}')

    if isWord
    {
        return 1
    }

    ; check if one char right is a word character
    SendInput('+{Right}')

    isWord := _checkIfAWordCharacterIsSelected()

    ; reset cursor
    SendInput('{Right}{Left}')

    return isWord
}

; This simple function is intended for applications which do not have an
; existing shortcut to do this. This function is not perfect.
selectCurrentWord()
{
    if !_checkIfCursorIsWithinWord()
    {
        return ; no word to select, return early
    }

    ; ctrl+right to move cursor past word (this moves past spaces)
    SendInput('^{Right}')

    Loop 100 ; avoid inf loop
    {
        ; shift+left: select one char left
        SendInput('+{Left}')

        ; break if it's a word character
        foundWordChar := _checkIfAWordCharacterIsSelected()
        if foundWordChar
        {
            break
        }

        ; clear selection with left
        SendInput('{Left}')
    }

    ; move cursor back to right
    SendInput('{Right}')

    ; ctrl+shift+left to select the entire word
    SendInput('^+{Left}')
}

; the more complex 'selectCurrentWord' requires Ctrl+C to copy and check selection
; this simpler function avoids that by ignoring whitespace
selectCurrentWordBasic()
{
    ; ctrl+right to move cursor over, then ctrl+shift+left to select the word
    SendInput('^{Right}')
    SendInput('^+{Left}')
}

; insert line below cursor and move cursor down to new line
insertLineBelow()
{
    SendInput('{End}{Enter}')
}

; insert line above cursor and move cursor up to new line
insertLineAbove()
{
    SendInput('{Home}{Enter}{Up}')
}

; move cursor right one word using Ctrl+Right
moveRightOneWord()
{
    SendInput('^{Right}')
}

moveCursorRightOneWordWithSelection()
{
    SendInput('{Shift Down}^{Right}{Shift Up}')
}

moveLeftOneWord()
{
    SendInput('^{Left}')
}

moveCursorLeftOneWordWithSelection()
{
    SendInput('{Shift Down}^{Left}{Shift Up}')
}

moveCursorDown()
{
    SendInput('{Down}')
}

moveCursorDownWithSelection()
{
    SendInput('{Shift Down}{Down}{Shift Up}')
}

moveCursorUp()
{
    SendInput('{Up}')
}

moveCursorUpWithSelection()
{
    SendInput('{Shift Down}{Up}{Shift Up}')
}

deleteLineLeft()
{
    SendInput('{Shift Down}{Home}{Shift Up}{Delete}')
}

deleteLineRight()
{
    SendInput('{Shift Down}{End}{Shift Up}{Delete}')
}

selectAllAndCopy()
{
    SendInput('^a')

    ; copy this selection
    SendInput('^c')
    ClipWait
    Sleep(10) ; necessary sleep
    
    MouseClick('left')
    SendInput('{right}')
}
