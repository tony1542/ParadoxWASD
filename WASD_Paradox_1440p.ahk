SendMode Input

; Allow WASD movement for EU4, HOI4, Crusader Kings 2, and Victoria 2
GroupAdd WASD, ahk_exe eu4.exe
GroupAdd WASD, ahk_exe hoi4.exe
GroupAdd WASD, ahk_exe CK2game.exe
GroupAdd WASD, ahk_exe v2game.exe

#IfWinActive ahk_group WASD

; Coordinate variables
unitRow1X := 881
unitRow2X := 971
unitRow3X := 1051
unitRow4X := 1121
unitRow5X := 1215
unitRow1Y := 700

; Allow the 'c' key to translate as the 'enter' key like in EU4
c::Send {Enter}

w::Send {Up DOWN}
w UP::Send {Up UP}
+w::Send w

a::Send {Left DOWN}
a UP::Send {Left UP}
+a::Send a

s::Send {Down DOWN}
s UP::Send {Down UP}
+s::Send s

d::Send {Right DOWN}
d UP::Send {Right UP}
+d::Send d

space::Send {Pause DOWN}
space UP::Send {Pause UP}
+space::Send space

End::
Suspend Toggle
If %A_IsSuspended%
  SoundPlay %WINDIR%\media\Windows Hardware Remove.wav
Else
  SoundPlay %WINDIR%\media\Windows Hardware Insert.wav
Return

; Open the div design window
new_division_template_create()
{
    Send, {u DOWN}
    Sleep 500
    MouseClick, left, 764, 148
    Sleep 500
    MouseClick, left, 1100, 525
    Sleep 500
    MouseClick, left, 1050, 550

    return
}

select_infantry_battalion()
{
    Sleep 100
    MouseClick, left, 872, 711
    select_infantry()

    return
}

select_infantry()
{
    Sleep 100
    MouseClick, left, 876, 557
    Sleep 100

    return
}

select_medium_tank_battalion()
{
    Sleep 100
	MouseClick, left, 1133, 642
    select_medium_tank()

    return
}

select_medium_tank()
{
    Sleep 100
    MouseClick, left, 744, 612
    Sleep 100

    return
}

select_mobile_battalion()
{
    Sleep 100
    MouseClick, left, 875, 627
    select_motorized_infantry()

    return
}

select_cavalry_battalion()
{
    Sleep 100
    MouseClick, left, 875, 627
    select_cavalry()

    return
}

select_motorized_infantry()
{
    Sleep 100
    MouseClick, left, 862, 636
    Sleep 100

    return
}

select_cavalry()
{
    Sleep 100
    MouseClick, left, 1114, 570
    Sleep 100

    return
}

add_medium_tank(x, y, number)
{
    Count := 0

    while (Count < number)
    {
        MouseClick, left, x, y

        if (Count < 1)
        {
            select_medium_tank_battalion()
        } else
        {
            select_medium_tank()
        }

        Count += 1
        y += 50
    }

    return
}

add_motorized_infantry(x, y, number)
{
    Count := 0

    while (Count < number)
    {
        MouseClick, left, x, y

        if (Count < 1)
        {
            select_mobile_battalion()
        } else
        {
            select_motorized_infantry()
        }

        Count += 1
        y += 50
    }

    return
}

add_cavalry(x, y, number)
{
    Count := 0

    while (Count < number)
    {
        MouseClick, left, x, y

        if (Count < 1)
        {
            select_cavalry_battalion()
        } else
        {
            select_cavalry()
        }

        Count += 1
        y += 50
    }

    return
}

add_infantry(x, y, number)
{
    Count := 0

    while (Count < number)
    {
        MouseClick, left, x, y

        if (Count < 1)
        {
            select_infantry_battalion()
        } else
        {
            select_infantry()
        }

        Count += 1
        y += 50
    }

    return
}

; Division Designer; 10/0 infantry
#i::
new_division_template_create()

Sleep 500

add_infantry(unitRow1X, unitRow1Y, 4)
add_infantry(unitRow2X, unitRow1Y, 3)
add_infantry(unitRow3X, unitRow1Y, 3)

return

; Division Designer; 5/0 infantry
#o::
new_division_template_create()
Sleep 500

add_infantry(unitRow1X, unitRow1Y, 3)
add_infantry(unitRow2X, unitRow1Y, 2)

return

; Division Designer; 20W medium tanks
#v::
new_division_template_create()
Sleep 500

add_medium_tank(unitRow1X, unitRow1Y, 4)
add_medium_tank(unitRow2X, unitRow1Y, 3)
add_motorized_infantry(unitRow3X, unitRow1Y, 3)

return

; Division Designer; 40W medium tanks
#m::
new_division_template_create()
Sleep 500

add_medium_tank(unitRow1X, unitRow1Y, 5)
add_medium_tank(unitRow2X, unitRow1Y, 5)
add_medium_tank(unitRow3X, unitRow1Y, 5)
add_motorized_infantry(unitRow4X, unitRow1Y, 5)

return

; Division Designer; max suppression cavalry
#s::
new_division_template_create()
Sleep 500

add_cavalry(unitRow1X, unitRow1Y, 4)
add_cavalry(unitRow2X, unitRow1Y, 4)
add_cavalry(unitRow3X, unitRow1Y, 4)
add_cavalry(unitRow4X, unitRow1Y, 4)
add_cavalry(unitRow5X, unitRow1Y, 4)

return

; Shift+click 10 times for 1k planes
#j::
Send {Shift down}

Loop, 10 {
    Click
    Sleep, 10
}

Sendinput, {RButton up}{Shift up}

return

; 72 units worth (including first one from starting a line)
#k::
Loop, 71 {
    Click
    Sleep, 10
}

return
