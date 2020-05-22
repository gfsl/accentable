;
; Mimic MS Word accent chord behaviour globally
; graeme.lennon@gmail.com
;
; ---
;

AppName = Accentable
Version = 1.00

; ---

StringCaseSense On
Menu, Tray, NoStandard
Menu, Tray, Tip, %AppName%
Menu, Tray, Add, Enabled, ToggleEnable
Menu, Tray, Check, Enabled
if !A_IsCompiled {
	Menu, Tray, Icon, AccentHelper.ico
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
		case "A": SendInput, {Asc 0192}
		case "E": SendInput, {Asc 0200}
		case "I": SendInput, {Asc 0204}
		case "O": SendInput, {Asc 0210}
		case "U": SendInput, {Asc 0217}
		case "a": SendInput, {Asc 0224}
		case "e": SendInput, {Asc 0232}
		case "i": SendInput, {Asc 0236}
		case "o": SendInput, {Asc 0242}
		case "u": SendInput, {Asc 0249}
	}
return

; ACUTE
^'::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput, {Asc 0193}
		case "E": SendInput, {Asc 0201}
		case "I": SendInput, {Asc 0205}
		case "O": SendInput, {Asc 0211}
		case "U": SendInput, {Asc 0218}
		case "Y": SendInput, {Asc 0221}
		case "a": SendInput, {Asc 0225}
		case "e": SendInput, {Asc 0233}
		case "i": SendInput, {Asc 0237}
		case "o": SendInput, {Asc 0243}
		case "u": SendInput, {Asc 0250}
		case "y": SendInput, {Asc 0253}
	}
return

; CIRCUMFLEX
^+6::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput, {Asc 0194}
		case "E": SendInput, {Asc 0202}
		case "I": SendInput, {Asc 0206}
		case "O": SendInput, {Asc 0212}
		case "U": SendInput, {Asc 0219}
		case "a": SendInput, {Asc 0226}
		case "e": SendInput, {Asc 0234}
		case "i": SendInput, {Asc 0238}
		case "o": SendInput, {Asc 0244}
		case "u": SendInput, {Asc 0251}
	}
return

; UMLAUT
^+`;::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput, {Asc 0196}
		case "E": SendInput, {Asc 0203}
		case "I": SendInput, {Asc 0207}
		case "O": SendInput, {Asc 0214}
		case "U": SendInput, {Asc 0220}
		case "Y": SendInput, {Asc 0159}
		case "a": SendInput, {Asc 0228}
		case "e": SendInput, {Asc 0235}
		case "i": SendInput, {Asc 0239}
		case "o": SendInput, {Asc 0246}
		case "u": SendInput, {Asc 0252}
		case "y": SendInput, {Asc 0255}
	}
return

; TILDE + INVERTED
^+`::
	Input, key, L1 T1
	switch key
	{
		case "A": SendInput, {Asc 0195}
		case "N": SendInput, {Asc 0209}
		case "O": SendInput, {Asc 0213}
		case "a": SendInput, {Asc 0227}
		case "n": SendInput, {Asc 0241}
		case "o": SendInput, {Asc 0245}
		case "?": SendInput, {Asc 168}
		case "!": SendInput, {Asc 173}
	}
return

; CEDILLA
^,::
	Input, key, L1 T1
	switch key
	{
		case "C": SendInput, {Asc 0199}
		case "c": SendInput, {Asc 0231}
	}
return

; SLASH
^/::
	Input, key, L1 T1
	switch key
	{
		case "o": SendInput, {Asc 0248}
		case "O": SendInput, {Asc 0216}
	}
return

; POUND SIGN
^3::
	Input, key, L1 T1
	if (key == "$")
		SendInput {Asc 156}
return

#If

; YEN SIGN
^=::
	Input, key, L1 T1
	if (key == "Y")
		SendInput {Asc 190}
return
