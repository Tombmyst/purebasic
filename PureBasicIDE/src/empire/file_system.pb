DeclareModule FileSystem : UseModule G
	Declare.boolean is_directory(path.s)
EndDeclareModule

Module FileSystem
	Procedure.boolean is_directory(path.s)
		If FileSize(path) = 2
			ProcedureReturn true
		EndIf
		ProcedureReturn false
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; Folding = -
; Optimizer
; EnableXP
; DPIAware