;#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


/*
add: 
class_name_ 
email_ 
cell_ 
sent_
max_classes
check extra classes, email, cell
*/

;declare variables

clipboard = ;empty

global waitColor := "0xFCFCFC"

num_class := "0" ;always 0
max_classes := "1" ;same as number of last class
	
class_name_0 := "BUS 350-002"	; Courtney
class_name_1 := "CS 170-004"	; Alyssa


cell_0 := "0123456789"	; Courtney
cell_1 := "1234567890"	; Alyssa

sent_0 := "0"
sent_1 := "0"
sent_2 := "0"
sent_3 := "0"
sent_4 := "0"
sent_5 := "0"
sent_6 := "0"
sent_7 := "0"
sent_8 := "0"
sent_9 := "0"
sent_10 := "0"
sent_11 := "0"
sent_12 := "0"
sent_13 := "0"
sent_14 := "0"
sent_15 := "0"
sent_16 := "0"
sent_17 := "0"
sent_18 := "0"
sent_19 := "0"
sent_20 := "0"
sent_21 := "0"
sent_22 := "0"
sent_23 := "0"
sent_24 := "0"
sent_25 := "0"
sent_26 := "0"
sent_27 := "0"
sent_28 := "0"
sent_29 := "0"
sent_30 := "0"
sent_31 := "0"
sent_32 := "0"
sent_33 := "0"
sent_34 := "0"
sent_35 := "0"
sent_36 := "0"
sent_37 := "0"
sent_38 := "0"
sent_39 := "0"
sent_40 := "0"

success := "PS_CS_STATUS_OPEN"
OutputText := "not right"

aaa_how_many_times_looped := "0"

this_is_stuck := ;empty

store_email := ;empty
store_extra_email := ;empty
store_cell := ;empty
store_extra_cell := ;empty
store_class := ;empty
store_extra_class := ;empty
my_cell := "7709136302"
my_email := "twang35@emory.edu"

;Extra Classes
extra_class_0 := ;empty
extra_class_1 := ;empty
extra_class_2 := ;empty
extra_class_3 := ;empty
extra_class_4 := ;empty
extra_class_5 := ;empty
extra_class_6 := ;empty
extra_class_7 := ;empty
extra_class_8 := ;empty
extra_class_9 := ;empty
extra_class_10 := ;empty
extra_class_11 := ;empty
extra_class_12 := ;empty
extra_class_13 := ;empty
extra_class_14 := ;empty
extra_class_15 := ;empty
extra_class_16 := ;empty
extra_class_17 := ;empty
extra_class_18 := ;empty
extra_class_19 := ;empty
extra_class_20 := ;empty
extra_class_21 := ;empty
extra_class_22 := ;empty
extra_class_23 := ;empty
extra_class_24 := ;empty
extra_class_25 := ;empty
extra_class_26 := ;empty
extra_class_27 := ;empty
extra_class_28 := ;empty
extra_class_29 := ;empty
extra_class_30 := ;empty

viewSource := "view-source:https://saprod9.emory.edu/psc/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?Page=SSR_SSENRL_CART&Action=A&ACAD_CAREER=UCOL&EMPLID=1911500&INSTITUTION=EMORY&STRM=5149&TargetFrameName=None"


;functions

send_email(store_email, store_class){
	Run mailto: %store_email%

	WinWaitActive, Untitled - Message (HTML) 
	{
		Sleep 2000
		Send, OPEN CLASS
		Sleep, 100
		Send, {Tab}
		Sleep, 100
		Send, Your %store_class% is open
		Send, {:}D
		Sleep 1000
		Click 39, 189
	}
	
	Sleep 5000
}

send_text(store_cell, my_cell, store_class) 
{
	Run, www.textnow.com
	Sleep 500
	Send, {LWin down}{Up}{LWin up}
	counter := 0
	
	Sleep 1000
	
	chromePageWaitText()
	
	counter := 0

	Sleep 4000
	;/*
	;log in to TextNow
	Send, ^f
	Sleep, 200
	Send, password
	Sleep, 200
	Send, {ESC}
	Sleep, 200
	Send, +{TAB}
	Sleep, 200
	send, <YOUR TEXTNOW USERNAME HERE>
	sleep 100
	send {tab}
	Sleep 100
	Send, <YOUR TEXTNOW PASSWORD HERE>
	Sleep 200
	Send {Enter}

	sleep 1000

	chromePageWaitText()
	
	Send, ^r
	
	chromePageWaitText()
	
	Sleep, 500
	Sleep, 6000

	;send text
	Click 401, 256
	;~ send, ^f
	;~ Sleep, 300
	;~ send, Terms of Use
	;~ Sleep, 300
	;~ Send, {ESC}
	;~ Sleep, 400
	;~ Send, +{Tab}
	;~ Sleep, 300
	;~ Send, +{Tab}
	;~ Sleep, 300
	;~ Send, +{Tab}
	;~ Sleep, 300
	;~ Send, {Enter}
	
	Sleep 5000
	Send %store_cell%
	Send {Tab}
	Sleep 1000
	if (store_class == "CS 599") {
		Send, STILL WORKING
	}
	else {
		Send Class Alert bot: Your %store_class% is open{!} {:}D
	}
	Sleep 1000
	
	;Send
	;~ Click 879, 517
	Send, {Tab}
	Sleep, 300
	Send, {Enter}
	
	
	Sleep 8000
	
	if (store_cell != my_cell) {
		Click 401, 256
		;~ send, ^f
		;~ Sleep, 300
		;~ send, Terms of Use
		;~ Sleep, 300
		;~ Send, {ESC}
		;~ Sleep, 400
		;~ Send, +{Tab}
		;~ Sleep, 300
		;~ Send, +{Tab}
		;~ Sleep, 300
		;~ Send, +{Tab}
		;~ Sleep, 300
		;~ Send, {Enter}
		
		Sleep 5000
		Send %my_cell%
		Send {Tab}
		Sleep 1000
		Send, %store_class% opened
		Sleep 1000
		
		;~ Click 879, 517 
		Send, {Tab}
		Sleep, 300
		Send, {Enter}
		
		chromePageWaitText()
	} else {
		sleep 10
	}
	
	;log out
	;~ Click, 1206, 128
	Send, ^f
	Sleep, 400
	Send, sign out
	Sleep, 400
	Send, {ESC}
	Sleep, 400
	Send, {Enter}
	Sleep, 400
	
	chromePageWaitText()
	
	Send, ^w	; close tab
}

send_extra_text(store_extra_cell, store_extra_class) {
	Wbe := ComObjCreate("InternetExplorer.Application")
	Wbe.Visible := True
	Wbe.Navigate("textnow.com")
	Sleep 500
	Send, {LWin down}{Up}{LWin up}
	
	Sleep 1000
	
	While Wb.readystate != 4 || Wb.document.readyState!="complete" || Wb.busy
		Sleep, 50
	
	Sleep 4000
	
	;log in to TextNow
	send, tonythepepper
	sleep 100
	send {tab}
	Sleep 100
	Send, thekalewords
	Sleep 100
	Send {Enter}
	
	sleep 1000
	
	While Wb.readystate != 4 || Wb.document.readyState!="complete" || Wb.busy
		sleep 50
	
	Sleep 8000
	
	;send text
	Click 272, 157
	
	Sleep 5000
	Send %store_extra_cell%
	Send {Tab}
	Sleep 1000
	Send, Yay{!} Your %store_extra_class% class opened
	Sleep 1000
	
	Click 830, 615 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;830, 615
	
	Sleep 8000
	
	;log out
	Click, 950, 83
	sleep 1000
	Click, 950, 248
	
	Sleep 1000
	
	While Wb.readystate != 4 || Wb.document.readyState!="complete" || Wb.busy
		Sleep, 50
	Sleep 2000
	
	WinClose TextNow
}

send_my_email(my_email, store_class) {
	Run mailto: %my_email%

	WinWaitActive, Untitled - Message (HTML)
	{
		Sleep 1000
		Send, OPEN CLASS{Tab}Somebody else’s %store_class% opened
		Sleep 1000
		Click 39, 189
	}
	
	Sleep 3000
}

send_extra_email(store_extra_class, store_extra_email) {
	Run mailto: %store_extra_email%

	WinWaitActive, Untitled - Message (HTML)
	{
		Sleep 1000
		Send, OPEN CLASS{Tab}Hey, your %store_extra_class% opened
		Sleep 1000
		Click 39, 189
	}
	
	Sleep 3000
}

;Open OPUS

Sleep, 1000

Run, www.opus.emory.edu

Sleep 500
Send, {LWin down}{Up}{LWin up}

;Log In

chromePageWait()

Sleep, 1000
Send, <YOUR OPUS PASSWORD HERE>
Sleep, 1000
Send, {Tab}
Sleep, 1000
Send, <YOUR OPUS PASSWORD HERE>
Sleep, 1000
Send, {Enter}

chromePageWait()

Send, ^l
Sleep, 1000
Clipboard := "https://saprod9.emory.edu/psp/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?FolderPath=PORTAL_ROOT_OBJECT.CO_EMPLOYEE_SELF_SERVICE.HCCC_ACAD_PLANNING.HC_SSR_SSENRL_CART_GBL2&IsFolder=false&IgnoreParamTempl=FolderPath%2cIsFolder"

Sleep, 1000

Send, ^v
Sleep, 500
Send, {Enter}

chromePageWait()

;Select Term

/* chromePageWait()
 * 
 * Click 41, 404
 * Sleep 500
 * Click 482, 454
 * Sleep 1000
 */


Loop {
;Refresh Shopping Cart

;~ Click, 408, 142
Send, ^r

chromePageWait()


;Select Term
Sleep 3000
Click 41, 426
Sleep 500
Click 461, 475
Sleep 100

chromePageWait()

;opens source code

click right 700, 670
sleep 1000
click 715, 600
 
/* go to source via url
Send, ^t
Clipboard := viewSource

Sleep, 1000

Send, ^v
Sleep, 100
Send, {Enter}
*/

chromePageWait()

this_is_stuck := "0"

;Safety for no terms
IfWinActive, res://ieframe.dll/dnserrordiagoff.htm - Original Source 
{
	Reload1()
}
IfWinActive, PeopleSoft session expired
{
	Reload1()
}
*/
/*
; refresh shopping cart with terms
WinWaitActive, https://saprod9.emory.edu/psc/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?Page=SSR_SSENRL_CART&Action=A&ACAD_CAREER=UCOL&EMPLID=1911500&INSTITUTION=EMORY&STRM=5139&TargetFrameName=None, , 4
while ErrorLevel {
	this_is_stuck++
	
	if (this_is_stuck > 4) {
		Reload
	}
	
	;Refresh Shopping Cart
	Click, 408, 142

	Sleep 4000
	While Pwb.readystate!=4 || Pwb.document.readyState!="complete" || Pwb.busy
		Sleep, 50
	Sleep 4000
	Click 41, 404
	Sleep 500
	Click 482, 454
	
	Sleep, 4000
	While Pwb.readystate!=4 || Pwb.document.readyState!="complete" || Pwb.busy
		Sleep, 50
	Sleep, 4000
	
	;Open Source Code
	
	click right 650, 525
	sleep 1000
	click 686, 800 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;686, 525

	sleep 1000
	
	WinWaitActive, https://saprod9.emory.edu/psc/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?Page=SSR_SSENRL_CART&Action=A&ACAD_CAREER=UCOL&EMPLID=1911500&INSTITUTION=EMORY&STRM=5139&TargetFrameName=None, , 4

	WinMinimize, https://saprod9.emory.edu/psc/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?FolderPath=PORTAL_ROOT_OBJECT
}
*/

;checking the javascript and sending out notifications


while (num_class < max_classes+1) ; enter total number of classes
{
	Sleep, 1000
	
	OutputText = "clear"
	
	Clipboard = ;empty
	
	term = class_name$%num_class%'
	
	Sleep, 100
	
	search(term)
	
	sleep 1000

	send, {shift down}{right}{right}{right}{right}{shift up}

	sleep 100
	
	;check for success

	Send, ^c
	Sleep, 100
	ClipWait, 5
	if ErrorLevel {
		Reload1()
	}
	
	OutputText = %clipboard%
	Sleep, 100
	
	if (OutputText == success) {
		if (sent_%num_class% == 0) {
			store_class := class_name_%num_class%
			;~ ;send email
			;~ store_email := email_%num_class%
			;~ send_email(store_email, store_class)
			
			;~ if (store_email != my_email) {
				;~ send_my_email(my_email, store_class)
			;~ } else {
				;~ sleep 10
			;~ }
			
			
			
			;~ if(extra_class_%num_class% == class_name_%num_class%) {
				;~ store_extra_class :=
				;~ store_extra_email :=
				;~ store_extra_cell :=
				;~ store_extra_class := extra_class_%num_class%
				;~ store_extra_email := extra_email_%num_class%
				;~ store_extra_cell := extra_cell_%num_class%
				
				;~ send_extra_email(store_extra_class, store_extra_email)
				;~ send_extra_text(store_extra_class, store_extra_cell)
			;~ } else {
				;~ sleep 10
			;~ }
			
			;send text
			store_cell := cell_%num_class%
			send_text(store_cell, my_cell, store_class)
			
			
			
			sent_%num_class%++
		}else {
			sleep 100
	}

	}else {
		sleep 100
	}
	
	num_class++
	
}

/*
 ;While having to select class terms
WinClose, view-source:https://saprod9.emory.edu/psc/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?Page=SSR_SSENRL_CART&Action=A&ACAD_CAREER=UCOL&EMPLID=1911500&INSTITUTION=EMORY&STRM=5149&TargetFrameName=None
*/


;~ With no class terms
Send, ^w
;~ WinClose, https://saprod9.emory.edu/psc/saprod9/EMPLOYEE/HRMS/c/SA_LEARNER_SERVICES_2.SSR_SSENRL_CART.GBL?FolderPath=PORTAL_ROOT_OBJECT
*/

Sleep 2000


if (num_class >= max_classes) {
	num_class := "0"
}

aaa_how_many_times_looped++

if (aaa_how_many_times_looped > 30){
	Reload1()
}


}     ; Loop

Reload1() 
{
	Send, !{F4}
	Sleep, 1000
	Reload
}

chromePageWait() 
{
	loop, 150
	{
		PixelGetColor, dropper, 79, 22
		while (dropper = waitColor)
		{
			PixelGetColor, dropper, 79, 22
		}
		Sleep, 10
	}	
}

chromePageWaitText()
{
	Loop, 200
	{
		PixelGetColor, dropper, 436, 21
		while (dropper = waitColor)
		{
			PixelGetColor, dropper, 436, 21
			continue
		}
		Sleep, 10
	}
}
	
search(term) {
	;search for class
	send, ^f
	Sleep, 200
	send, %term%
	Sleep, 200
	Send, {Esc}
	Sleep, 1000

	;search for status
	send, ^f
	sleep 200
	send, PS_CS_STATUS_
	Sleep, 200
	Send, {Esc}
}

`::Pause

~::Reload

PGDN::
Sleep 300

IfWinActive, Chrome OPUS 
{
	Send, ^s
	Sleep, 100
}
Reload

return

RAlt:: ;align numbers
sleep 500

; start at num
last := max_classes + 1 ;should be same as total
spc := " "

Clipboard := ;
Send, +{Left}
Send, ^c
ClipWait, 2
if ErrorLevel {
	return
}
if (ClipBoard == spc)
	Send, {Left}
Clipboard := ;
Send, +{Left}
Send, ^c
ClipWait, 2
if ErrorLevel {
	return
}
num = %Clipboard%
Send, %num%
if (num < 10) 
	Send, {Right}

while (num < last) {
	Clipboard := ;
	Send, +{Left}
	
	Send, ^c
	Sleep, 10
	ClipWait, 2
	if ErrorLevel {
		return
	}
	
	if (num < 10) {
		Send, {Backspace}{Backspace}%num%{Space}
	}
	else {
		Send, {Backspace}{Backspace}%num%
	}
	if (ClipBoard == spc && num > 9) {
		Send, {Space}{Left}
	}
	
	Send, {Down}
	num++
}

return

#s::
Send, ^s
Sleep, 500
Reload
return

#z::	;testing

chromePageWait()
MsgBox, end

return
