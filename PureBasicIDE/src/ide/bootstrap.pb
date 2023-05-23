DeclareModule Bootstrap
	Declare.boolean start()
EndDeclareModule

Module Bootstrap
	Declare.boolean _start_linux()
	Declare.boolean _start_mac()
	Declare.boolean _start_win()
	
	Procedure.boolean start()
		CompilerIf #__LINUX__
			ProcedureReturn _start_linux()
		CompilerElseIf #__MAC__
			ProcedureReturn _start_mac()
		CompilerElseIf #__WIN__
			ProcedureReturn _start_win()
		CompilerElse
			CompilerError "Unknown OS"
		CompilerEndIf
	EndProcedure
	
	Procedure.boolean _start_linux()
		
	EndProcedure
	
	Procedure.boolean _start_mac()
		
	EndProcedure
	
	Procedure.boolean _start_win()
		
	EndProcedure
EndModule