DeclareModule Math
	Declare.q max(a.q, b.q)
	Declare.q min(a.q, b.q)
EndDeclareModule

Module Math
	Procedure.q max(a.q, b.q)
		If (a > b)
			ProcedureReturn a
		Else
			ProcedureReturn b
		EndIf
	EndProcedure
	
	Procedure.q min(a.q, b.q)
		If (a < b)
			ProcedureReturn a
		Else
			ProcedureReturn b
		EndIf
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 17
; Folding = -
; Optimizer
; EnableXP
; DPIAware