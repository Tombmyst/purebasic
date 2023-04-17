DeclareModule FileSystem : UseModule EmpireCommons
	Declare.boolean is_directory(path.s)
	
	Macro safe_close_file(file_handle)
		If (file_handle And IsFile(file_handle))
			CloseFile(file_handle)
		EndIf
	EndMacro
	
	Macro file_exists(file)
		Bool(FileSize(file) >= 0)
	EndMacro
EndDeclareModule

Module FileSystem
	Procedure.boolean is_directory(path.s)
		If FileSize(path) = -2
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