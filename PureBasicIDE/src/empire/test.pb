DeclareModule Test : UseModule EmpireCommons
	Macro assert_crash(condition, message="Assertion failed")
		CompilerIf #PB_Compiler_Debugger
			If Not condition
				MessageRequester("Assertion failed!", message + Chr(13) + "In file: " + #PB_Compiler_File + Chr(13) + "At line: " + #PB_Compiler_Line, #PB_MessageRequester_Error)
				End EmpireErrorCodes::#ASSERTION_FAILED
			EndIf
		CompilerEndIf
	EndMacro
	
	Declare assert(condition.boolean, test_name.s)	
	Declare set_tests_failed()
	Declare.boolean have_tests_failed()
EndDeclareModule

Module Test
	Global _failed.boolean = false
	
	Procedure assert(condition.boolean, test_name.s)
		CompilerIf #PB_Compiler_Debugger
			If (Not condition)
				Logger::error("Test failed: " + test_name)
			Else:
				Logger::success("Test passed (" + test_name + ")")
			EndIf
		CompilerEndIf
	EndProcedure
	
	Procedure set_tests_failed()
		_failed = true
	EndProcedure
	
	Procedure.boolean have_tests_failed()
		ProcedureReturn _failed
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 23
; Folding = --
; Optimizer
; EnableXP
; DPIAware