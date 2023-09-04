#Requires AutoHotkey v2
#SingleInstance Force

^j::
{
    mouseMoveFcn()
    clickFcn()
}

; MouseMove X, Y [, Speed, Relative]
mouseMoveFcn()
{
    ; from top left corner of screen, move mouse right 100 and down 200 
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
    ; todo
}
