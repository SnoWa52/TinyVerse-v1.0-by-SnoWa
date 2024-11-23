#Persistent
SetTimer, ClickMacro, -1
return

RandomTimer() {
    Random, TimerDelay, 3000000, 4500000
    SetTimer, ClickMacro, %TimerDelay%
}

ClickMacro:
    SmoothMove(264, 1048)
    HumanClick()
    Sleep, 1000

    SmoothMove(270, 162)
    HumanClick()
    Sleep, 1000

    SmoothMove(584, 1015)
    HumanClick()
    Sleep, 30000

    Random, X, 1016, 1075
    Random, Y, 755, 757
    SmoothMove(X, Y)
    HumanClick()
    Random, PauseTime, 10000, 30000
    Sleep, Pausetime

    SmoothMove(1119, 202)
    HumanClick()
    Sleep, 1000

    SmoothMove(1894, 10)
    HumanClick()

    RandomTimer()
return

SmoothMove(x, y) {
    CoordMode, Mouse, Screen
    MouseGetPos, startX, startY
    distanceX := x - startX
    distanceY := y - startY

    steps := 50

    Loop, %steps% {
        Random, offsetX, -1, 1
        Random, offsetY, -1, 1

        MouseMove, startX + (distanceX * A_Index / steps) + offsetX, startY + (distanceY * A_Index / steps) + offsetY, 0
        Sleep, 15
    }
}

HumanClick() {
    Click down
    Sleep, Random(50, 150)
    Click up
}

Random(min, max) {
    Random, output, %min%, %max%
    return output
}