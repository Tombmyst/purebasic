EnableExplicit
DeclareModule Args
	#SOURCE_FILE_REGEX_IDENTIFIER = "regex->"
	
	Declare parse_command_line()
EndDeclareModule

Module Args : UseModule G
	Declare _show_version()
	Declare _show_help()
	Declare _parse_file_regex(path.s, file_regex.s)
	Declare _parse_file_normal(parameter.s)
	Declare _regex_file_scanner_callback(*scanned_node.FileSystem::SCANNED_NODE, *callback_arg)
	Declare _normal_file_scanner_callback(*scanned_node.FileSystem::SCANNED_NODE, *callback_arg)
	
	Procedure _show_version()
		If (Console::is_opened())
			Print(IDEConstants::#PROGRAM_NAME)
			Print(" Version: ")
			PrintN(IDEConstants::#PROGRAM_VERSION)
		Else
			MessageRequester(IDEConstants::#PROGRAM_NAME, IDEConstants::#PROGRAM_NAME + Chr(13) + "Version: " + IDEConstants::#PROGRAM_VERSION, #PB_MessageRequester_Info)
		EndIf
	EndProcedure
	
	Procedure _show_help()
		
	EndProcedure
	
	Procedure parse_command_line()
		Define working_directory.s = Path::terminate_path_by_separator(GetCurrentDirectory())
		Define current_parameter.s
		Define parameter_index.i = 0
		Define parameters_count.i = CountProgramParameters()
		
		PB::xfor(parameter_index, 0, parameters_count)
			current_parameter = ProgramParameter(parameter_index)
			
			Select current_parameter
				Case "--open-console"
					OpenConsole(IDEConstants::#PROGRAM_NAME + " v. " + IDEConstants::#PROGRAM_VERSION)
					Logger::useConsole()
				Case "--preferences", "-p"
					parameter_index + 1
					Settings::args\preferences_file = PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index))
				Case "--templates", "-t"
					parameter_index + 1
					Settings::args\templates_file = PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index))
				Case "--tools", "-o"
					parameter_index + 1
					Settings::args\tools_file = PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index))
				Case "--history", "-H"
					parameter_index + 1
					Settings::args\history_database_file = PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index))
				Case "--source-path", "-s"
					parameter_index + 1
					Settings::args\source_path = Path::terminate_path_by_separator(PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index)))
				Case "--explorer-path", "-e"
					parameter_index + 1
					Settings::args\explorer_path = Path::terminate_path_by_separator(PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index)))
				Case "--initial-line", "-l"
					parameter_index + 1
					Settings::args\initial_source_line = Val(ProgramParameter(parameter_index))
				Case "--build", "-b"
					parameter_index + 1
					Settings::args\build_project_file = PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index))
				Case "--target", "-T"
					parameter_index + 1
					AddElement(Settings::args\targets())
					Settings::args\targets() = Trim(ProgramParameter(parameter_index))
				Case "--quiet", "-q"
					Settings::args\quiet_build = true
				Case "--read-only", "-r"
					Settings::args\build_read_only = true
				Case "--help", "-h"
					_show_help()
				Case "--version", "-v"
					_show_version()
				CompilerIf #__WIN__
				Case "--no-ext"
					Settings::args\no_extensions = true
				Case "--local"
					directory.s = GetPathPart(ProgramFilename())
					With Settings::args
						\preferences_file = directory + IDEConstants::#PREFERENCES_FILE_NAME
						\templates_file = directory + IDEConstants::#TEMPLATE_FILE_NAME
						\tools_file = directory + IDEConstants::#TOOLS_FILE_NAME
						\history_database_file = directory + IDEConstants::#HISTORY_DB_FILE
						\update_check_file = directory + IDEConstants::#UPDATE_CHECK_FILE
					EndWith
				Case "--portable"
					Settings::args\no_extensions = true
					directory.s = GetPathPart(ProgramFilename())
					With Settings::args
						\preferences_file = directory + IDEConstants::#PREFERENCES_FILE_NAME
						\templates_file = directory + IDEConstants::#TEMPLATE_FILE_NAME
						\tools_file = directory + IDEConstants::#TOOLS_FILE_NAME
						\history_database_file = directory + IDEConstants::#HISTORY_DB_FILE
						\update_check_file = directory + IDEConstants::#UPDATE_CHECK_FILE
					EndWith
				CompilerEndIf
				Case "" ; filter out the empty string
				Default
					If (FindString(current_parameter, "regex->"))
						_parse_file_regex(StringField(current_parameter, 1, Args::#SOURCE_FILE_REGEX_IDENTIFIER), StringField(current_parameter, 2, Args::#SOURCE_FILE_REGEX_IDENTIFIER))
					Else
						_parse_file_normal(current_parameter)
					EndIf
			EndSelect	
		Next parameter_index
		
		If (Settings::args\update_check_file = "")
			Settings::args\update_check_file = Resources::configuration_path_join_1(IDEConstants::#UPDATE_CHECK_FILE)
		EndIf
	EndProcedure
	
	Procedure _parse_file_regex(path.s, file_regex.s)
		CompilerIf Path::#IS_FS_CASE_SENSITIVE
			flags.i = null
		CompilerElse
			flags.i = #PB_RegularExpression_NoCase
		CompilerEndIf
		
		file_scanner_regex.i = CreateRegularExpression(#PB_Any, file_regex, flags)
		If (Not file_scanner_regex)
			Logger::error("Could not create regex with '" + file_regex + "'. Error: " + RegularExpressionError(), __LOG__)
			ProcedureReturn
		EndIf
		
		path = PBFileSystem::resolve_relative_path(GetCurrentDirectory(), path)
		path = Path::terminate_path_by_separator(path)
		FileSystem::scan_directory(path, @_regex_file_scanner_callback(), true, file_scanner_regex)
		FreeRegularExpression(file_scanner_pattern)
	EndProcedure
	
	Procedure _parse_file_normal(parameter.s)
		If (Not FindString(parameter, "*", 1) And Not FindString(parameter, "?", 1))
			ListUtil::append(Settings::args\files_to_open, parameter)
		Else
			path.s = PBFileSystem::resolve_relative_path(GetCurrentDirectory(), GetPathPart(path))
			path = Path::terminate_path_by_separator(path)
			
			FileSystem::scan_directory(path, @_normal_file_scanner_callback(), true, null, GetFilePart(parameter))
		EndIf
	EndProcedure
	
	Procedure _regex_file_scanner_callback(*scanned_node.FileSystem::SCANNED_NODE, *callback_arg)
		If (*scanned_node\is_file And MatchRegularExpression(*callback_arg, *scanned_node\name))
			ListUtil::append(Settings::args\files_to_open, *scanned_node\path)
		EndIf
	EndProcedure
	
	Procedure _normal_file_scanner_callback(*scanned_node.FileSystem::SCANNED_NODE, *callback_arg)
		If (*scanned_node\is_file)
			ListUtil::append(Settings::args\files_to_open, *scanned_node\path)
		EndIf
	EndProcedure
EndModule
