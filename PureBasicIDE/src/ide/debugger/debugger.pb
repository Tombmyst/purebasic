DeclareModule Debugger : UseModule G
	CompilerIf #PB_Compiler_Debugger
		; Useful to ensures a ProcessEvent() is NEVER called in the debugger callback as it can generate very weird bug
		; (new debugger event is processed While being in a debugger event. It is wrong, As it can changes the display order, and creates weird bug).
		;
		in_debbuger_callback.b = false
	CompilerEndIf
EndDeclareModule

Module Debugger
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 10
; Folding = -
; Optimizer
; EnableXP
; DPIAware