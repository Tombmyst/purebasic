DeclareModule PBCompilerStructs
	Structure STRUCT_TARGET		; REPLACES Commons::CompileTarget
								; INFO: removed EnableUnicode -> always unicode
		
		target_id.a			; unique ID to identify this target (unique while the IDE runs) (up to 255)
		is_project.b		; true if not from a sourcefile
		is_form.b			; not null if this is a form (pointer to FormWindow())
		is_enabled.b
		
		is_default.b
		optimizer_enabled.b
		asm_enabled.b
		multi_thread_enabled.b
		
		xp_theme_enabled.b
		admin_enabled.b
		user_enabled.b
		is_dpi_aware.b
		
		on_error_enabled.b
		debugger_enabled.b
		has_main_file.b
		has_icon.b
		
		executable_format.a
		cpu_type.a
		uses_custom_compiler.b
		uses_custom_debugger.b
		
		debugger_type.a
		uses_custom_warning_mode.b
		warning_mode.a
		should_create_temporary_executable_in_source_dir.b
		
		should_count_compilations.b
		should_count_builds.b
		should_define_create_executable.b
		purifier_enabled.b
		
		purifier_granularity.a		; REPLACES PurifierGranularity$
		defines_version_info.b		; REPLACES VersionInfo
		number_of_resource_files.b
		number_of_predefined_constants.b
		
		run_executable_format.b		; executable format of exe (needed for linux/osx)
		run_requires_admin.b		; vista admin option on compilation REPLACES RunEnableAdmin
		run_debugger_mode.b			; debugger mode of exe
		run_is_main_file_used.b		; if the mainfile option was used
		
		expression_history_size.s
		
		compilation_count.l
		build_count.l
		
		run_compiler_version.l			; numeric version of the compiler used
		last_compiled_lines_number.l	; total number of last compiled lines for estimation
		
		source_file_name.s	; REPLACES FileName$
		main_file.s
		target_name.s
		target_output_file.s
		
		sub_system.s
		icon_file_name.s
		linker_options.s
		compiler_version.s	; version string (without copyright notice)
		
		executable_name.s
		command_line.s
		working_directory.s  ; REPLACES CurrentDirectory$
		run_executable.s	 ; name of the compiled exe
		
		run_source_file_name.s		; name of the source file which was compiled
		run_compiler_path.s			; path of the compiler used
		debugger_watchlist.s		; variables to add to the watchlist. (ProcedureName()>VariableName,...)
		
		enabled_predefined_constants.b[PBCompilerConstants::#MAX_NUMBER_OF_PREDEFINED_CONSTANTS_PER_TARGET]
		
		version_fields.s[24]
		expression_history.s[PBCompilerConstants::#MAX_EXPRESSION_HISTORY_SIZE_PER_TARGET]
		resource_files.s[PBCompilerConstants::#MAX_RESOURCE_FILES_PER_TARGET]
		predefined_constants.s[PBCompilerConstants::#MAX_NUMBER_OF_PREDEFINED_CONSTANTS_PER_TARGET]
	EndStructure
EndDeclareModule

Module PBCompilerStructs
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 87
; FirstLine = 9
; Folding = -
; Optimizer
; EnableXP
; DPIAware