CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	XIncludeFile "headers.pbi"
CompilerElse
	XIncludeFile "headers.pbi"
CompilerEndIf

Procedure.boolean preinit()
	
EndProcedure

Procedure.boolean init()
	Args::parse_command_line()
EndProcedure

Procedure.boolean load()
	
EndProcedure

Procedure.boolean postinit()
	
EndProcedure

Procedure.boolean main()
	XIncludeFile "PureBasic.pb"
EndProcedure

Procedure.boolean presave()
	
EndProcedure

Procedure.boolean save()
	
EndProcedure

Procedure.boolean postsave()
	
EndProcedure

Procedure end_()
	
EndProcedure


If (preinit() And init() And load() And postinit())
	main()
EndIf

If (presave() And save() And postsave() And end_())
EndIf