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
EndDeclareModule

Module FileSystem
	
EndModule