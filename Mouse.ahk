#Requires AutoHotkey v2
#SingleInstance Force

; Map to ` instead of a ctrl key b/c ctrl+click has a different behavior
`::
{
    ;mouseMoveFcn()
    clickFcn()
}

; MouseMove X, Y [, Speed, Relative]
mouseMoveFcn()
{
    ; from top left corner of current screen, move mouse right 100 and down 200
    MouseMove(100, 200)

    ; sleep 1000 ms (1 second)
    Sleep(1000)

    ; Speed ranges from 0 (fastest) to 100 (slowest)
    ; Speed uses SetDefaultMouseSpeed (default=2) if unspecified
    speed := 25
    MouseMove(300, 100, speed)

    Sleep(500)

    ; Relative ('R'): gives relative coordinates to current position
    ; move 100 pixels right and 200 pixels down at speed=20)
    speed := 20
    relative := 'R'
    MouseMove(100, 200, speed, relative)
}

; Click [Options]
clickFcn()
{
    ; click at coordinates 500, 500
    ;Click(500, 500)

    ; Shift Click at 600, 600
    ;Send '+{Click 600 600}'

    ; move mouse cursor without clicking
    clickCount := 0
    ;Click(700, 600, clickCount)

    ; double click at current location
    clickCount := 2
    ;Click(clickCount)

    ; move cursor 100 pixels to right and 50 pixels down then single click
    clickCount := 1
    relative := 'Rel'
    Click(100, 50, clickCount, relative)

}
