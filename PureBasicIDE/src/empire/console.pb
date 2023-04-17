DeclareModule Console : UseModule EmpireCommons
	Declare open(title.s = "")
	Declare close()
	Declare.boolean is_opened()
EndDeclareModule

Module Console
	_is_console_opened.boolean = false
	
	Procedure open(title.s = "")
		If (Not _is_console_opened)
			OpenConsole(title)
			_is_console_opened = true
		EndIf
	EndProcedure
	
	Procedure close()
		If (_is_console_opened)
			CloseConsole()
			_is_console_opened = false
		EndIf
	EndProcedure
	
	Procedure.boolean is_opened()
		ProcedureReturn _is_console_opened
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 24
; Folding = -
; Optimizer
; EnableXP
; DPIAware