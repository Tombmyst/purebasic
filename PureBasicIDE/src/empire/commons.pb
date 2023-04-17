Macro __IS_TESTING__
	Defined(__TEST__, #PB_Constant)
EndMacro

DeclareModule EmpireCommons
	Macro false : 0 : EndMacro
	Macro true : 1 : EndMacro
	Macro null : 0 : EndMacro
	Macro boolean : b : EndMacro
	
	Macro __LOG__ : #PB_Compiler_File, #PB_Compiler_Module, #PB_Compiler_Procedure, #PB_Compiler_Line : EndMacro
		
	CompilerIf #PB_Compiler_OS = #PB_OS_Windows
		IncludeFile "snippets\os_macros.pbi"
	CompilerElse
		IncludeFile "snippets/os_macros.pbi"
	CompilerEndIf
	
	CompilerIf #PB_Compiler_Unicode
		#CHARSIZE = 2
	CompilerElse
		#CHARSIZE = 1
	CompilerEndIf
	
	Declare crash(message.s, code.l = 1000)
EndDeclareModule

Module EmpireCommons
	Procedure crash(message.s, code.l = 1000)
		MessageRequester("Fatal", message)
		End code
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 22
; Folding = --
; Optimizer
; EnableXP
; DPIAware