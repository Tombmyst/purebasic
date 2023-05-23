CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	XIncludeFile "headers.pbi"
CompilerElse
	XIncludeFile "headers.pbi"
CompilerEndIf

Procedure.boolean preinit()
	Logger::trace("PreInit sequence")
	
	UseMD5Fingerprint()
	UseCRC32Fingerprint()
	UsePNGImageDecoder()
	
	ProcedureReturn true
EndProcedure

Procedure.boolean init()
	Logger::trace("Init sequence")
	Args::parse_command_line()
	Settings::init()
	
	ProcedureReturn true
EndProcedure

Procedure.boolean load()
	Logger::trace("Load sequence")
	
	ProcedureReturn true
EndProcedure

Procedure.boolean postinit()
	Logger::trace("PostInit sequence")
	
	ProcedureReturn true
EndProcedure

Procedure.boolean main()
	Logger::trace("Main sequence")
	
	ProcedureReturn true
EndProcedure

Procedure.boolean presave()
	Logger::trace("PreSave sequence")
	
	ProcedureReturn true
EndProcedure

Procedure.boolean save()
	Logger::trace("Save sequence")
	Settings::save()
	
	ProcedureReturn true
EndProcedure

Procedure.boolean postsave()
	Logger::trace("PostSave sequence")
	
	ProcedureReturn true
EndProcedure

Procedure end_()
	Logger::trace("End sequence")
	
	ProcedureReturn true
EndProcedure


If (preinit() And init() And load() And postinit())
	main()
EndIf

CompilerIf #__WIN__
	XIncludeFile "..\PureBasic.pb"
CompilerElse
	XIncludeFile "../PureBasic.pb"
CompilerEndIf

If (presave() And save() And postsave() And end_())
EndIf