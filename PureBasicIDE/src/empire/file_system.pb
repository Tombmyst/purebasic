DeclareModule FileSystem : UseModule EmpireCommons
	Macro safe_close_file(file_handle)
		If (file_handle And IsFile(file_handle))
			CloseFile(file_handle)
		EndIf
	EndMacro
	
	Macro file_exists(file)
		Bool(FileSize(file) >= 0)
	EndMacro
	
	Macro is_directory(path)
		Bool(FileSize(path) = -2)
	EndMacro
	
	Macro sep
		CompilerIf #PB_Compiler_OS = #PB_OS_Windows
			"\"
		CompilerElse
			"/"
		CompilerEndIf
	EndMacro

	Declare.s terminate_path_by_separator(path.s)
EndDeclareModule

Module FileSystem
	Procedure.s terminate_path_by_separator(path.s)
		If (Not StringUtil::endswith(path, FileSystem::sep))
			ProcedureReturn path + FileSystem::sep
		EndIf
		
		ProcedureReturn path
	EndProcedure
EndModule