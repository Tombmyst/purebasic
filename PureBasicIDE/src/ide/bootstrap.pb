EnableExplicit
DeclareModule Bootstrap : UseModule G
	Declare.boolean start()
EndDeclareModule

Module Bootstrap
	Declare.boolean _start_linux()
	Declare.boolean _start_mac()
	Declare.boolean _start_win()
	
	Declare _update_purebasic_versions_if_needed()
	Declare _discover_purebasic_installations()
	Declare.s _validate_installation_path_for_compiler(installation_path.s)
	Declare _maybe_add_installation(installation_path.s)
	
	
	Procedure.boolean start()
		_update_purebasic_versions_if_needed()
		
		
		CompilerIf #__LINUX__
			ProcedureReturn _start_linux()
		CompilerElseIf #__MAC__
			ProcedureReturn _start_mac()
		CompilerElseIf #__WIN__
			ProcedureReturn _start_win()
		CompilerElse
			CompilerError "Unknown OS"
		CompilerEndIf
	EndProcedure
	
	Procedure.boolean _start_linux()
		
	EndProcedure
	
	Procedure.boolean _start_mac()
		_update_purebasic_versions_if_needed()
	EndProcedure
	
	Procedure.boolean _start_win()
		_update_purebasic_versions_if_needed()
	EndProcedure
	
	Procedure _update_purebasic_versions_if_needed()
		If (ListSize(Settings::settings\purebasic_versions()) = 0)
			_discover_purebasic_installations()
		EndIf
	EndProcedure
	
	Procedure _discover_purebasic_installations()
		installation_path.s = GetEnvironmentVariable("PUREBASIC_HOME")
		If (Len(installation_path) > 0)
			installation_path = _validate_installation_path_for_compiler(Path::join(installation_path, "compilers", "pbcompiler"))
			_maybe_add_installation(installation_path)
			installation_path = _validate_installation_path_for_compiler(ReplaceString(installation_path, "pbcompiler", "pbcompilerc"))
			_maybe_add_installation(installation_path)
		EndIf
		
		installation_path = GetPathPart(ProgramFilename())
		If (MatchRegularExpression(Regexes::pb_compiler_path_regex(), installation_path))
			installation_path = _validate_installation_path_for_compiler(Path::join(installation_path, "pbcompiler"))
			_maybe_add_installation(installation_path)
			installation_path = _validate_installation_path_for_compiler(ReplaceString(installation_path, "pbcompiler", "pbcompilerc"))
			_maybe_add_installation(installation_path)
		Else
			installation_path = _validate_installation_path_for_compiler(Path::join(installation_path, "compilers", "pbcompiler"))
			_maybe_add_installation(installation_path)
			installation_path = _validate_installation_path_for_compiler(ReplaceString(installation_path, "pbcompiler", "pbcompilerc"))
			_maybe_add_installation(installation_path)
		EndIf
	EndProcedure
	
	Procedure.s _validate_installation_path_for_compiler(installation_path.s)
		CompilerIf #__WIN__
			installation_path + ".exe"
		CompilerEndIf
		
		If (FileSystem::file_exists(installation_path))
			ProcedureReturn installation_path
		EndIf
		
		ProcedureReturn ""
	EndProcedure
	
	Procedure _maybe_add_installation(installation_path.s)
		If (installation_path)
			version.s = PBCompilerUtil::get_compiler_version_at_path(installation_path)
			If (Len(version) = 0)
				ProcedureReturn
			EndIf
			
			version_struct.Settings::PB_VERSION_INFO
			PBCompilerUtil::parse_compiler_version_string(version, @version_struct)
			
			version_struct\path = installation_path
			version_struct\last_update_date = Date()
			
			ListUtil::append(Settings::settings\purebasic_versions, version_struct)
		EndIf
	EndProcedure
	
	
EndModule