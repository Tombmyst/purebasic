DeclareModule Path
	CompilerIf #PB_Compiler_OS = #PB_OS_Windows
		#SEPARATOR = "\"
	CompilerElse
		#SEPARATOR = "/"
	CompilerEndIf
	
	Declare.s join(element1.s, element2.s, element3.s = "", element4.s = "", element5.s = "", element6.s = "")
EndDeclareModule

Module Path
	Procedure.s join(element1.s, element2.s, element3.s = "", element4.s = "", element5.s = "", element6.s = "")
		Protected result.s = element1 + #SEPARATOR + element2
		
		If (element3 <> "")
			result = result + #SEPARATOR + element3
		EndIf
		
		If (element4 <> "")
			result = result + #SEPARATOR + element4
		EndIf
		
		If (element5 <> "")
			result = result + #SEPARATOR + element5
		EndIf
		
		If (element6 <> "")
			result = result + #SEPARATOR + element6
		EndIf
		
		ProcedureReturn result
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 27
; Folding = -
; Optimizer
; EnableXP
; DPIAware