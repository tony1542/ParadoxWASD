SendMode Input

; Allow WASD movement for EU4, HOI4, Crusader Kings 2, and Victoria 2
GroupAdd WASD, ahk_exe eu4.exe
GroupAdd WASD, ahk_exe hoi4.exe
GroupAdd WASD, ahk_exe CK2game.exe
GroupAdd WASD, ahk_exe v2game.exe

#IfWinActive ahk_group WASD

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
    MouseClick, left, 872, 711  ; Adjusted from (560, 390)
	select_infantry()

	return
}

select_infantry()
{
	Sleep 100
    MouseClick, left, 876, 557  ; Adjusted from (560, 460)
	Sleep 100

	return
}

select_medium_tank_battalion()
{
	Sleep 100
    MouseClick, left, 744, 612  ; Adjusted from (560, 460)
	select_medium_tank()

	return
}

select_medium_tank()
{
	Sleep 100
    MouseClick, left, 744, 612  ; Adjusted from (560, 460)
	Sleep 100

	return
}

select_mobile_battalion()
{
	Sleep 100
    MouseClick, left, 1064, 532  ; Adjusted from (800, 400)
	select_motorized_infantry()

	return
}

select_cavalry_battalion()
{
	Sleep 100
    MouseClick, left, 1064, 532  ; Adjusted from (800, 400)
	select_cavalry()

	return
}

select_motorized_infantry()
{
	Sleep 100
    MouseClick, left, 744, 704  ; Adjusted from (560, 530)
	Sleep 100

	return
}

select_cavalry()
{
	Sleep 100
    MouseClick, left, 1064, 612  ; Adjusted from (800, 460)
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
		y += 66  ; Adjusted from (50)
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
		y += 66  ; Adjusted from (50)
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
		y += 66  ; Adjusted from (50)
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
		y += 50  ; Adjusted from (50)
	}

	return
}

; Division Designer; 10/0 infantry
#i::
new_division_template_create()
Sleep 500

add_infantry(881, 700, 4)  ; Adjusted from (566, 520)
add_infantry(951, 700, 3)  ; Adjusted from (646, 520)
add_infantry(1031, 700, 3)  ; Adjusted from (706, 520)

return

; Division Designer; 5/0 infantry
#o::
new_division_template_create()
Sleep 500

add_infantry(881, 701, 3)  ; Adjusted from (566, 520)
add_infantry(859, 692, 2)  ; Adjusted from (646, 520)

return

; Division Designer; 40W medium tanks
#m::
new_division_template_create()
Sleep 500

add_medium_tank(753, 692, 5)  ; Adjusted from (566, 520)
add_medium_tank(859, 692, 5)  ; Adjusted from (646, 520)
add_medium_tank(965, 692, 5)  ; Adjusted from (726, 520)
add_motorized_infantry(1072, 692, 5)  ; Adjusted from (806, 520)

return

; Division Designer; max suppression cavalry
#s::
new_division_template_create()
Sleep 500

add_cavalry(753, 692, 5)  ; Adjusted from (566, 520)
add_cavalry(859, 692, 5)  ; Adjusted from (646, 520)
add_cavalry(965, 692, 5)  ; Adjusted from (726, 520)
add_cavalry(1072, 692, 5)  ; Adjusted from (806, 520)
add_cavalry(1178, 692, 5)  ; Adjusted from (886, 520)

return

; Shift+click 10 times for 1k planes
#n::
Send {Shift down}

Loop, 10 {
	Click
	Sleep, 10
}

Sendinput, {RButton up}{Shift up}

return

; Ctrl+click 5 times for 50 planes
#b::
Send {LControl down}

Loop, 5 {
	Click
	Sleep, 10
}

Sendinput, {RButton up}{Shift up}

return
