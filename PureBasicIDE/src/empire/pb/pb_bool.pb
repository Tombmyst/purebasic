DeclareModule PBBool : UseModule EmpireCommons
	Macro inplace_not(value)
		!v_#value = !v_#value;
	EndMacro
	
	Declare.boolean not_(value.boolean)
EndDeclareModule

Module PBBool
	Procedure.boolean not_(value.boolean)
		PBBool::inplace_not(value)
		ProcedureReturn value
	EndProcedure
EndModule
