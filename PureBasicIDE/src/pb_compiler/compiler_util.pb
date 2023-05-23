EnableExplicit
DeclareModule PBCompilerUtil
	EnumerationBinary  ; Values for MatchCompilerVersion()
		#MATCH_OS
		#MATCH_VERSION
		#MATCH_MINIMUM_VERSION  ; was #MATCH_VersionUp
		#MATCH_BETA
		#MATCH_MINIMUM_BETA_VERSION  ; was #MATCH_BetaUp
		#MATCH_PROCESSOR
	EndEnumeration
	#MATCH_EXACT = #MATCH_OS | #MATCH_VERSION | #MATCH_MINIMUM_VERSION | #MATCH_BETA | #MATCH_MINIMUM_BETA_VERSION | #MATCH_PROCESSOR
	
	Declare.s get_compiler_version_at_path(path.s)
	Declare parse_compiler_version_string(version.s, *out.Settings::PB_VERSION_INFO)
EndDeclareModule

Module PBCompilerUtil : UseModule G
	Procedure.s get_compiler_version_at_path(path.s)
		If (Not FileSystem::file_exists(path))
			Logger::error("'" + path + "' is not a valid file", __LOG__)
			ProcedureReturn ""
		EndIf
		
		pid.i = RunProgram(path, "--version", GetPathPart(path), #PB_Program_Open | #PB_Program_Read)
		If (Not pid)
			Logger::error("Could not get compiler version for '" + path + "': Could not run program", __LOG__, true)
			ProcedureReturn ""
		EndIf
		
		Delay(5)
		version.s = ""
		While (AvailableProgramOutput(pid))
			version + ReadProgramString(pid)
		Wend
		CloseProgram(pid)
		
		If (Len(version) > 0)
			Logger::success("Successfully found version '" + version + "' for compiler '" + path + "'", __LOG__)
		Else
			Logger::error("Could not find version for compiler '" + path + "'", __LOG__)
		EndIf
		
		ProcedureReturn version
	EndProcedure
	
	Procedure parse_compiler_version_string(version.s, *out.Settings::PB_VERSION_INFO)
		*out\version = Trim(StringField(version, 2, " "))
		*out\os_version = Trim(StringField(StringField(version, 1, ") "), 2, " ("))
		
		*out\is_lts = Bool(UCase(Trim(StringField(version, 3, " "))) = "LTS")
		*out\is_c_backend = Bool(StringUtil::startswith(StringField(version, 1, " - "), "C Backend"))
	EndProcedure
EndModule

CompilerIf __IS_TESTING__
	Define test_parse_compiler_version_string__struct.Settings::PB_VERSION_INFO
	PBCompilerUtil::parse_compiler_version_string("PureBasic 6.02 LTS (Linux - x64) - (c) 2023 Fantaisie Software", @test_parse_compiler_version_string__struct)
	
	Test::assert(Bool(test_parse_compiler_version_string__struct\is_c_backend = false), "is_c_backend should be false", __FILE__)
	Test::assert(Bool(test_parse_compiler_version_string__struct\is_lts = true), "is_lts should be true", __FILE__)
	Test::assert(Bool(test_parse_compiler_version_string__struct\os_version = "Linux - x64"), "os_version should be 'Linux - x64'", __FILE__)
	Test::assert(Bool(test_parse_compiler_version_string__struct\version = "6.02"), "version should be '6.02'", __FILE__)
CompilerEndIf