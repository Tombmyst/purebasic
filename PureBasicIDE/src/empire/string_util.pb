DeclareModule StringUtil
	Declare.s append_to_string_non_empty(string_.s, item1.s, item2.s = "", item3.s = "")
EndDeclareModule

Module StringUtil
	Procedure.s append_to_string_non_empty(string_.s, item1.s, item2.s = "", item3.s = "")
		Protected result.s = string_
		
		If (item1 <> "")
			result + item1
		EndIf
		
		If (item2 <> "")
			result + item2
		EndIf
		
		If (item3 <> "")
			result + item3
		EndIf
		
		ProcedureReturn result
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 5
; Folding = -
; Optimizer
; EnableXP
; DPIAware