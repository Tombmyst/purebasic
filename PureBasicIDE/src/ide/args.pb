EnableExplicit
DeclareModule Args
	Declare parse_command_line()
EndDeclareModule

Module Args : UseModule G
	Declare _show_version()
	Declare _show_help()
	
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
		Define working_directory.s = GetCurrentDirectory()
		Define current_parameter.s
		Define parameter_index.i, parameters_count.i = CountProgramParameters()
		
		PB::xfor(parameter_index, 0, parameters_count)
			current_parameter = ProgramParameter(parameter_index)
			
			Select current_parameter
				Case "--open_console"
					OpenConsole(IDEConstants::#PROGRAM_NAME + " v. " + IDEConstants::#PROGRAM_VERSION)
					Logger::useConsole()
				Case "--preferences", "-p"
					Settings::args\preferences_file = 
				Case "--templates", "-t"
				Case "--tools", "-o"
				Case "--history", "-H"
				Case "--source-path", "-s"
				Case "--explorer-path", "-e"
				Case "--initial-line", "-l"
				Case "--build", "-b"
				Case "--target", "-T"
				Case "--quiet", "-q"
				Case "--read-only", "-r"
				Case "--help", "-h"
					_show_help()
				Case "--version", "-v"
					_show_version()
				CompilerIf #__WIN__
					Case "--no-ext"
					Case "--local"
					Case "--portable"
				CompilerEndIf
				Case ""
				Default
					
			EndSelect	
		Next parameter_index
	EndProcedure
EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 5
; Folding = --
; Optimizer
; EnableXP
; DPIAware