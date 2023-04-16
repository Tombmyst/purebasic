DeclareModule PBCompiler
	Structure STRUCT_COMPILER
		compiler_path.s			; REPLACES: Executable$
		compiler_file_md5.s		; REPLACES: MD5$
		version_string.s
		
		sort_index.l
		
		version_number.w		; numeric version (431, 440, etc...)
		
		is_validated.b			; The given compiler passed the GetCompilerVersion() test (or the MD5 matched)
	EndStructure
	
	Structure STRUCT_COMPILER_WARNING
		in_file.s
		relative_file.s
		message.s
		line.l
	EndStructure
EndDeclareModule

Module Compiler
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 17
; Folding = -
; Optimizer
; EnableXP
; DPIAware