EnableExplicit
DeclareModule Args
	Declare parse_command_line()
EndDeclareModule

Module Args : UseModule G
	Declare _show_version()
	Declare _show_help()
	Declare _parse_file_regex(parameter.s)
	Declare _parse_file_normal(parameter.s)
	
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
				Case "--open_console"
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
					Settings::args\build_project_file = PBFileSystem::resolve_relative_path(working_directory, ProgramParameter(parameter_index)))
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
					If (StringUtil::startswith(current_parameter, "regex->"))
						_parse_file_regex(current_parameter)
					Else
						_parse_file_normal(current_parameter)
					EndIf
			EndSelect	
		Next parameter_index
	EndProcedure
	
	Procedure _parse_file_regex(parameter.s)
		
	EndProcedure
	
	Procedure _parse_file_normal(parameter.s)
		
	EndProcedure
EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 5
; Folding = --
; Optimizer
; EnableXP
; DPIAware