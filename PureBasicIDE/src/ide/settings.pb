EnableExplicit
DeclareModule Settings : UseModule G
	Enumeration
		#SAVE_SETTINGS_AT_END_OF_FILE
		#SAVE_SETTINGS_PER_FILE_CFG
		#SAVE_SETTINGS_PER_FOLDER_CFG
		#SAVE_SETTINGS_DO_NOT_SAVE
		; TODO: add for new project format (all centralized)
	EndEnumeration
	
	Enumeration
		#NEWLINE_CRLF
		#NEWLINE_LF
	EndEnumeration
	
	Enumeration
		#ISSUE_PRIORITY_INFO
		#ISSUE_PRIORITY_LOW
		#ISSUE_PRIORITY_MEDIUM
		#ISSUE_PRIORITY_HIGH
		#ISSUE_PRIORITY_BLOCKER
	EndEnumeration
	
	Enumeration
		#ISSUE_COLOR_MODE_NO_COLOR
		#ISSUE_COLOR_MODE_PATTERN_ONLY  ; REPLACES 1=background
		#ISSUE_COLOR_MODE_WHOLE_LINE
	EndEnumeration
	
	Structure STRUCT_COLOR_SETTING
		user_value.l			; Value as set by the user (even if disabled)
		settings_value.l		; Temp storage while prefs window is open REPLACES: PrefsValue
		display_value.l			; Actual value currently in use (when color is disabled, this is the fallback actually used)
		
		is_enabled.b
	EndStructure
	
	Structure STRUCT_INDENT_ENTRY_SETTING
		keyword.s
		
		length.l  ; TODO: of what, in what?
		indent_units_before_keyword.b
		indent_units_after_keyword.b
	EndStructure
	
	Structure STRUCT_ISSUE_SETTING
		name.s
		regex.s  ; REPLACES: Expression$
		compiled_regex.i
		
		color.l
		style.l		; code style (if ColorMode=1) -1 if not used
		
		marker.l	; code marker (if ColorMode=2) -1 if not used
		
		priority.b
		color_mode.b  ; REPLACES: CodeMode
		should_show_in_issues_viewer.b
		should_show_in_procedures_viewer.b
	EndStructure
	
	Structure ARGS
		quiet_build.boolean
		build_read_only.boolean
		no_extensions.boolean
		is_local.boolean
		
		is_portable.boolean
		
		initial_source_line.l
		
		preferences_file.s
		templates_file.s
		
		tools_file.s
		history_database_file.s
		
		source_path.s
		explorer_path.s
		
		source.s
		build_project_file.s
		
		update_check_file.s
		List targets.s()
		
		List files_to_open.s()
	EndStructure
	
	Structure SETTINGS
		version.l
		
		purebasic_installation_path.s
	EndStructure
	
	Define args.ARGS
	Define settings.SETTINGS
	
	Declare.boolean load()
	Declare.boolean save()
EndDeclareModule

Module Settings
	Declare _init_settings_first_time()
	
	Procedure _init_settings_first_time()
		
	EndProcedure
	
	Procedure.boolean load()
		If (FileSystem::file_exists(Resources::get_settings_path()))
			handle.i = LoadJSON(#PB_Any, Resources::get_settings_path())
			If (Not handle)
				Logger::warn("Could not load JSON from file '" + Resources::get_settings_path() + "'", __LOG__, true)	
				ProcedureReturn false
			EndIf
			
			ExtractJSONStructure(JSONValue(handle), @settings, SETTINGS)
			
			If (settings\version < 1)
				Logger::warn("The settings file was able to load, but could not extract settings from it", __LOG__, true)
			Else
				Logger::success("Successfully loaded settings", __LOG__)
				FreeJSON(handle)
				ProcedureReturn true
			EndIf
			FreeJSON(handle)
		EndIf
		
		ProcedureReturn false
	EndProcedure
	
	Procedure.boolean save()
		handle.i = CreateJSON(#PB_Any)
		If (Not handle)
			Logger::error("Could not create a JSON instance", __LOG__, true)
			ProcedureReturn false
		EndIf
		
		InsertJSONStructure(JSONValue(handle), @settings, SETTINGS)
		
		If (Not SaveJSON(handle, Resources::get_settings_path() + ".bak"))
			Logger::error("Could not save settings", __LOG__, true)
			ProcedureReturn false
		EndIf
		
		FileSystem::swap_files(Resources::get_settings_path(), Resources::get_settings_path() + ".bak")
		DeleteFile(Resources::get_settings_path() + ".bak")
		FreeJSON(handle)
		Logger::success("Successfully saved settings", __LOG__)
		ProcedureReturn true
	EndProcedure
EndModule