#Requires AutoHotkey v2.0
#SingleInstance Force

; Common AHK modifier symbols:
; ^ = Control
; + = shift
; ! = alt
; # = Windows key

; Always enable NumLock
SetNumLockState 'AlwaysOn'

; Match MATLAB's Command window (not editor)
; 1 = Title must start with
; Match MATLAB's Command window (not editor)
; 1 = Title must start with
; 2 = (default) A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode(1)

; Ctrl+Backspace and Ctrl+Delete in MATLAB (not needed for editor because it already supports these):
#HotIf WinActive("MATLAB R")
    ; Ctrl+Backspace
    ^BS::     Send("^+{left}{delete}")

    ; Ctrl+Delete
    ^F12::    Send("^+{right}{delete}")
#HotIf

SetTitleMatchMode(2)

#HotIf WinActive("ahk_exe MATLAB.exe")
    ; Map Ctrl+D to End (default for Ctrl+D is Open)
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Alt+G to Open (default is Ctrl+D)
    !g::^d
#HotIf

; Remap 4 keys above num pad (Virtual Box uses its own mapping):
#HotIf !WinActive("ahk_exe VirtualBoxVM.exe")
    Delete::Home
    Pause::PgUp
    PrintScreen::PgDn
    Home::End

    ; Enable delete and print screen after remapping 4 above:
    F12::Delete
    F11::PrintScreen ; interferes with debugging
    ; maybe shift + PrtScr?
#HotIf !WinActive()

#HotIf WinActive("ahk_exe notepad.exe")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    {
        SendInput("{End}")
        SendInput("{Enter}")
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        SendInput("{Home}")
        SendInput("{Enter}")
        SendInput("{Up}")
    }

    ; Alt + Up to move current line up
    !Up::
    {
        MoveLineUp()
    }

    ; Alt + Down to move current line down
    !Down::
    {
        MoveLineDown()
    }
#HotIf

#HotIf WinActive("ahk_exe Rainlendar2.exe")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ^m::Home

    ; Ctrl+Backspace
    ^BS::    SendInput("^+{left}{delete}")

    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    {
        SendInput("{End}")
        SendInput("{Enter}")
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        SendInput("{Home}")
        SendInput("{Enter}")
        SendInput("{Up}")
    }

    ; Map Tab to 4 spaces (default behavior is to cycle focus on dialog controls)
    Tab::SendInput("    ")

    ; Alt + Up to move current line up
    !Up::
    {
        MoveLineUp()
    }

    ; Alt + Down to move current line down
    !Down::
    {
        MoveLineDown()
    }
#HotIf

#HotIf WinActive("ahk_exe firefox.exe")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D (bookmark)
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ; Note: Ctrl+Enter adds ".com" to URLs
    ^+Enter::
    {
        SendInput("{Home}")
        SendInput("{Enter}")
        SendInput("{Up}")
    }

    ; Map Ctrl+[ to Page Up
    ^[::PgUp

    ; Map Ctrl+] to Page Down
    ^]::PgDn
#HotIf

#HotIf WinActive("ahk_exe chrome.exe")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D (bookmark)
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        SendInput("{Home}")
        SendInput("{Enter}")
        SendInput("{Up}")
    }

    ; Map Ctrl+[ to Page Up
    ^[::PgUp

    ; Map Ctrl+] to Page Down
    ^]::PgDn
#HotIf

#HotIf WinActive("ahk_exe powershell.exe")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home

    ; Map Shift+Space to Space. Most editors already do this but powershell does not.
    +Space::SendInput('{Space}')
#HotIf

#HotIf WinActive("ahk_exe cmd.exe")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+E to Ctrl+D
    ^e::^d

    ; Map Ctrl+M to Home
    ^m::Home
#HotIf

#HotIf WinActive("ahk_exe WINWORD.exe")
    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    ^NumpadEnter::
    {
        SendInput("{End}")
        SendInput("{Enter}")
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    ^+NumpadEnter::
    {
        SendInput("{Home}")
        SendInput("{Enter}")
        SendInput("{Up}")
    }
#HotIf

#HotIf WinActive("ahk_exe MusicBee.exe")
    ; Ctrl+Backspace
    ^BS::    SendInput("^+{left}{delete}")
#HotIf

; Media Player Classic
#HotIf WinActive("ahk_exe mpc-hc64.exe")
    ; Ctrl+W to Alt+F4 to close window
    ^W::    SendInput("!{F4}")

    ; Ctrl+Backspace
    ^BS::    SendInput("^+{left}{delete}")
#HotIf

; File Explorer
#HotIf WinActive("ahk_exe explorer.exe")
    ; Ctrl+Backspace
    ^BS::    SendInput("^+{left}{delete}")

    ; Ctrl+K to use Find dialog in top right (like Firefox)
    ^k::^f
#HotIf

#HotIf WinActive("ahk_exe Audacity.exe")
    ; Ctrl+Backspace
    ^BS::    SendInput("^+{left}{delete}")
#HotIf

#HotIf WinActive("ahk_exe EXCEL.exe")
    ; Ctrl+Backspace
    ^BS::    Send("^+{left}{delete}")

    ; Ctrl+Delete (F12 is already remapped to Delete)
    ^F12::    Send("^+{right}{delete}")
#HotIf

#HotIf WinActive("ahk_exe notepad++.exe")
    ^WheelUp::
    ^WheelDown::
    {
        ; disable Ctrl+Wheel which changes font size
    }

    /*
    ; todo: check ctrl+L and ctrl+shift+x
    ; Ctrl+X+X to cut current line
    ctrlXCount := 0
    lastCtrlXTime := 0
    ~^x::
    {
        global ctrlXCount
        global lastCtrlXTime

        currentMS := A_TickCount
        if (currentMS - lastCtrlXTime < 400) ; Check if less than # ms have passed
        {
            ctrlXCount++
            if (ctrlXCount >= 2) ; Double Ctrl+X press
            {
                ctrlXCount := 0

                Send("{Down}")
                Send("{Home}{Home}")
                SendInput("{Shift Down}{Up}{Shift Up}")
                Send("^x")
            }
        }
        else
        {
            ctrlXCount := 1
        }
        lastCtrlXTime := currentMS
    }
    */
#HotIf

; Microsoft PowerPoint
#HotIf WinActive("ahk_exe POWERPNT.EXE")
    ; Map Ctrl+D to End
    ^d::End

    ; Map Ctrl+M to Home
    ; (inteferes with New Slide shortcut)
    ;^m::Home

    ; Map Ctrl+Enter to insert line below and move cursor
    ^Enter::
    {
        SendInput("{End}")
        SendInput("{Enter}")
    }

    ; Map Ctrl+Shift+Enter to insert line above and move cursor
    ^+Enter::
    {
        SendInput("{Home}")
        SendInput("{Enter}")
        SendInput("{Up}")
    }
#HotIf

MoveLineUp()
{
    currentClipboard := ClipboardAll() ; cache current clipboard

    ; select current line
    SendInput("{End}")
    SendInput("{Shift Down}{Home}{Shift Up}")

    ; cut current text
    SendInput("^x")
    ClipWait

    ; insert cut line up one
    SendInput("{Backspace}")
    SendInput("{Home}")
    SendInput("{Enter}")
    SendInput("{Up}")
    SendInput("^v")
    Sleep(25) ; necessary sleep
    A_Clipboard := currentClipboard ; restore clipboard
}

MoveLineDown()
{
    currentClipboard := ClipboardAll() ; cache current clipboard

    ; select current line
    SendInput("{End}")
    SendInput("{Shift Down}{Home}{Shift Up}")

    ; cut current text
    SendInput("^x")
    ClipWait

    ; insert cut line down one
    SendInput("{Delete}")
    SendInput("{End}")
    SendInput("{Enter}")
    SendInput("^v")
    Sleep(25) ; necessary sleep
    A_Clipboard := currentClipboard ; restore clipboard
}

; ---