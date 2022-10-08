;
; Mimic MS Word accent chord behaviour globally
; https://github.com/gfsl/accentable
;
; ---
;
; 1.00 - Initial release.
; 1.10 - Change to using direct Unicode input because Asc codes were
;        breaking things in some browsers.
;
; ---

AppName = Accentable
Version = 1.10

; ---

StringCaseSense On
Menu, Tray, NoStandard
Menu, Tray, Tip, %AppName%
Menu, Tray, Add, Enabled, ToggleEnable
Menu, Tray, Check, Enabled
if !A_IsCompiled {
	Menu, Tray, Icon, Accentable.ico
	Menu, Tray, Add, &Reload Script, ReloadScript
}
Menu, Tray, Add, &Help, HelpMenu
Menu, Tray, Add, E&xit, ExitApp
Menu, Tray, Click, 2
Menu, Tray, Default, &Help

IsEnabled = 1
return

ToggleEnable:
	IsEnabled := !IsEnabled
	
	if IsEnabled
		Menu, Tray, Check, Enabled
	else
		Menu, Tray, Uncheck, Enabled
return

HelpMenu:
	MsgBox, 4128, %AppName% Help, 
(
All shortcuts are in the format Ctrl+Accent, release, Letter.
For example, Ctrl+^, o produces ô.

Accents supported are grave ( `` ), acute ( ' ), circumflex ( ^ ), umlaut ( : ), tilde ( ~ ) and cedilla ( , ).

Version: %Version%
https://github.com/gfsl/accentable
)
return

ExitApp:
	ExitApp
return

ReloadScript:
	Reload
return

; ---
; Hotkeys definitions
; ---

#If IsEnabled

; GRAVE
^`::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput À
		case "E": SendInput È
		case "I": SendInput Ì
		case "O": SendInput Ò
		case "U": SendInput Ù
		case "a": SendInput à
		case "e": SendInput è
		case "i": SendInput i
		case "o": SendInput ò
		case "u": SendInput ù
	}
return

; ACUTE
^'::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput Á
		case "E": SendInput É
		case "I": SendInput Í
		case "O": SendInput Ó
		case "U": SendInput Ú
		case "Y": SendInput Ý
		case "a": SendInput á
		case "e": SendInput é
		case "i": SendInput í
		case "o": SendInput ó
		case "u": SendInput ú
		case "y": SendInput ý
	}
return

; CIRCUMFLEX
^+6::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput Â
		case "E": SendInput Ê
		case "I": SendInput Î
		case "O": SendInput Ô
		case "U": SendInput Û
		case "a": SendInput â
		case "e": SendInput ê
		case "i": SendInput î
		case "o": SendInput ô
		case "u": SendInput û
	}
return

; UMLAUT
^+`;::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput Ä
		case "E": SendInput Ë
		case "I": SendInput Ï
		case "O": SendInput Ö
		case "U": SendInput Ü
		case "Y": SendInput Ÿ
		case "a": SendInput ä
		case "e": SendInput ë
		case "i": SendInput ï
		case "o": SendInput ö
		case "u": SendInput ï
		case "y": SendInput ÿ
	}
return

; TILDE + INVERTED
^+`::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput Ã
		case "N": SendInput Ñ
		case "O": SendInput Õ
		case "a": SendInput ã
		case "n": SendInput ñ
		case "o": SendInput õ
		case "?": SendInput ¿
		case "!": SendInput ¡
	}
return

; CEDILLA
^,::
	Input, key, L1 T1
	switch key
	{
		case "C": SendInput Ç
		case "c": SendInput ç
	}
return

; SLASH
^/::
	Input, key, L1 T1
	switch key
	{
		case "O": SendInput Ø
		case "o": SendInput ø
	}
return

; POUND SIGN
^3::
	Input, key, L1 T1
	if (key == "$")
		SendInput £
return

#If

; YEN SIGN
^=::
	Input, key, L1 T1
	if (key == "Y")
		SendInput ¥
return
