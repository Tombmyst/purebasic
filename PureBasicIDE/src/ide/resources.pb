DeclareModule Resources
	Declare load()
	
	Declare.s get_configuration_path()
	Declare.s get_bin_path()	
	
	Macro configuration_path_join_1(path_element)
		Path::join(Resources::get_configuration_path(), path_element)
	EndMacro
	
	Macro bin_path_join_1(path_element)
		Path::join(Resources::get_bin_path(), path_element)
	EndMacro
EndDeclareModule

Module Resources : UseModule G
	Global _cached_configuration_path.s = ""
	
	Procedure load()
		
	EndProcedure
	
	Procedure.s get_configuration_path()  ; REPLACES: all of PureBasicConfigPath.pb
		If (_cached_configuration_path <> "")
			ProcedureReturn _cached_configuration_path
		EndIf
		
		CompilerIf #PB_Compiler_OS = #PB_OS_Windows
			application_data.s = "AppData"
			If (OSVersion() = #PB_OS_Windows_XP)
				application_data = "ApplicationData"
			EndIf
		CompilerEndIf
		
		Protected configuration_path.s
		CompilerIf #SPIDER_BASIC
			CompilerIf #PB_Compiler_OS = #PB_OS_Windows
				configuration_path = Path::join(GetHomeDirectory(), application_data, "Roaming", "SpiderBasic")
			CompilerElse
				configuration_path = Path::join(GetHomeDirectory(), ".spiderbasic")
			CompilerEndIf
		CompilerElse
			CompilerIf #PB_Compiler_OS = #PB_OS_Windows
				configuration_path = Path::join(GetHomeDirectory(), application_data, "Roaming", "PureBasic")
			CompilerElse
				configuration_path = Path::join(GetHomeDirectory(), ".purebasic")
			CompilerEndIf
		CompilerEndIf
		
		If (Not FileSystem::is_directory(configuration_path))
			If (Not CreateDirectory(configuration_path))
				MessageRequester("Fatal Error", "Could not create configuration directory at " + configuration_path)
				End ErrorCodes::#CANNOT_CREATE_CONFIGURATION_DIRECTORY
			EndIf
		EndIf
		
		_cached_configuration_path = configuration_path
		ProcedureReturn configuration_path
	EndProcedure
	
	Procedure.s get_bin_path()
		ProcedureReturn Path::join("..", "bin")
	EndProcedure
	
	DataSection ;- Embedded data
		source_item_names: ;- Source Item Names
		Data.s "Variable"
		Data.s "Array"
		Data.s "List"
		Data.s "Map"
		Data.s "Procedure"
		Data.s "Macro"
		Data.s "Import"
		Data.s "Constant"
		Data.s "Module"
		Data.s "Prototype"
		Data.s "Structure"
		Data.s "Interface"
		Data.s "Label"
		
		source_item_defaults: ;- Source Item Defaults
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b false
		Data.b false
		Data.b false
		Data.b false
		
		
		token_names: ;- Token Names
		Data.s "PBKeywords"
		Data.s "ASMKeywords"
		Data.s "PBFunctions"
		Data.s "APIFunctions"
		Data.s "PBConstants"
		Data.s "PBStructures"
		Data.s "PBInterfaces"
		
		PBItem_Defaults: ;- Token Defaults
		Data.b true
		Data.b false
		Data.b true
		Data.b false
		Data.b true
		Data.b false
		Data.b false
	EndDataSection
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 29
; FirstLine = 4
; Folding = --
; Optimizer
; EnableXP
; DPIAware