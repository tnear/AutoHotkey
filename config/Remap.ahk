﻿#Requires AutoHotkey v2
#SingleInstance Force

; Common AHK modifier symbols:
; ^ = Control
; + = Shift
; ! = Alt
; # = Windows key

; Always enable NumLock
SetNumLockState('AlwaysOn')

; Match MATLAB's Command window (not editor)
; 1 = Title must start with
; Match MATLAB's Command window (not editor)
; 1 = Title must start with
; 2 = (default) A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode(1)

; Ctrl+Backspace and Ctrl+Delete in MATLAB (not needed for editor because it already supports these):
#HotIf WinActive('MATLAB R')
    ; Ctrl+Backspace
    ^BS::     Send('^+{left}{delete}')

    ; Ctrl+Delete
    ^F12::    Send('^+{right}{delete}')
#HotIf

SetTitleMatchMode(2)

#HotIf WinActive('ahk_exe MATLAB.exe')
    ; Map Ctrl+D to End (default for Ctrl+D is Open)
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Alt+G to Open (default is Ctrl+D)
    !g::^d
#HotIf

; Remap 4 keys above num pad (Virtual Box uses its own mapping):
; Note: this also checks the current computer name
#HotIf !WinActive('ahk_exe VirtualBoxVM.exe') && A_ComputerName == 'LAPTOP-JSOBNV2D'
    Delete::Home
    Pause::PgUp
    PrintScreen::PgDn
    Home::End

    ; Enable delete and print screen after remapping 4 above:
    F12::Delete
    F11::PrintScreen ; interferes with debugging, maybe shift + PrtScr instead?
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

    ; Ctrl+K
    ^k::
    {
        selectCurrentWord()
    }

    ; Map Tab to 4 spaces (default behavior is to cycle focus on dialog controls)
    Tab::SendInput('    ')

    ; Ctrl+Shift+A to lookup selected text on the web
    ^+a::
    {
        lookupSelectedTextOnGoogle()
    }
#HotIf

#HotIf WinActive('ahk_exe Rainlendar2.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Ctrl+Backspace
    ^BS::    SendInput('^+{left}{delete}')

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

    ; Ctrl+K
    ^k::
    {
        selectCurrentWord()
    }

    ; Ctrl+Shift+A to lookup selected text on the web
    ^+a::
    {
        lookupSelectedTextOnGoogle()
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

    ; Ctrl+Shift+A to lookup selected text on the web
    ^+a::
    {
        lookupSelectedTextOnGoogle()
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

    ; Ctrl+Shift+A to lookup selected text on the web
    ^+a::
    {
        lookupSelectedTextOnGoogle()
    }
#HotIf

#HotIf WinActive('ahk_exe powershell.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Shift+Space to Space. Most editors already do this but powershell does not.
    +Space::SendInput('{Space}')
#HotIf

#HotIf WinActive('ahk_exe cmd.exe')
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home
#HotIf

#HotIf WinActive('ahk_exe WINWORD.exe')
    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    ^NumpadEnter::
    {
        insertLineBelow()
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    ^+NumpadEnter::
    {
        insertLineAbove()
    }
#HotIf

#HotIf WinActive('ahk_exe MusicBee.exe')
    ; Ctrl+Backspace
    ^BS::    SendInput('^+{left}{delete}')
#HotIf

; Media Player Classic
#HotIf WinActive('ahk_exe mpc-hc64.exe')
    ; Ctrl+W to Alt+F4 to close window
    ^W::    SendInput('!{F4}')

    ; Ctrl+Backspace
    ^BS::    SendInput('^+{left}{delete}')
#HotIf

; File Explorer
#HotIf WinActive('ahk_exe explorer.exe')
    ; Ctrl+Backspace
    ^BS::    SendInput('^+{left}{delete}')

    ; Ctrl+K to use Find dialog in top right (like Firefox)
    ^k::^f
#HotIf

#HotIf WinActive('ahk_exe Audacity.exe')
    ; Ctrl+Backspace
    ^BS::    SendInput('^+{left}{delete}')
#HotIf

#HotIf WinActive('ahk_exe EXCEL.exe')
    ; Ctrl+Backspace
    ^BS::    Send('^+{left}{delete}')

    ; Ctrl+Delete (F12 is already remapped to Delete)
    ^F12::    Send('^+{right}{delete}')
#HotIf

#HotIf WinActive('ahk_exe notepad++.exe')
    ^WheelUp::
    ^WheelDown::
    {
        ; disable Ctrl+Wheel which changes font size
    }

    ; Ctrl+Shift+A to lookup selected text on the web
    ^+a::
    {
        lookupSelectedTextOnGoogle()
    }
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
    ; Map Ctrl+Shift+M to delete line to left (like Ctrl+U in terminal)
    ^+m::
    {
        SendInput('{Shift Down}{Home}{Shift Up}')
        ; SendInput('{Delete}') ; may not be necessary to delete
    }

    ; Ctrl+Shift+A to lookup selected text on the web
    ^+a::
    {
        lookupSelectedTextOnGoogle()
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
    SendInput('{Backspace}')
    SendInput('{Home}')
    SendInput('{Enter}')
    SendInput('{Up}')
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
    SendInput('{Delete}')
    SendInput('{End}')
    SendInput('{Enter}')
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

    ; cut this selection
    SendInput('^c')
    ClipWait

    ; move cursor back to original line
    SendInput('{Up}')
}

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

; This simple function is intended for applications which do not have an
; existing shortcut to do this. This function is not perfect.
selectCurrentWord()
{
    ; move cursor past word (this moves past spaces)
    SendInput('^{Right}')

    ; move left one character (this assumes a word is trailed by one space)
    SendInput('{Left}')

    ; ctrl+shift+left to select the entire word
    SendInput('^+{Left}')
}

; insert line below cursor and move cursor down to new line
insertLineBelow()
{
    SendInput('{End}')
    SendInput('{Enter}')
}

; insert line above cursor and move cursor up to new line
insertLineAbove()
{
    SendInput('{Home}')
    SendInput('{Enter}')
    SendInput('{Up}')
}

; ---