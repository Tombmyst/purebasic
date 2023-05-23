DeclareModule State
	Declare.b get_mode()
	Declare set_mode(mode.b)
EndDeclareModule

Module State
	Global _mode.b = IDEEnums::#IDE_MODE_NORMAL
	
	Procedure.b get_mode()
		ProcedureReturn _mode
	EndProcedure
	
	Procedure set_mode(mode.b)
		_mode = mode
	EndProcedure
EndModule