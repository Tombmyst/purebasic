DeclareModule Path
	CompilerIf #PB_Compiler_OS = #PB_OS_Windows
		#SEPARATOR = "\"
	CompilerElse
		#SEPARATOR = "/"
	CompilerEndIf
	
	Declare.s terminate_path_by_separator(path.s)
	Declare.s join(element1.s, element2.s, element3.s = "", element4.s = "", element5.s = "", element6.s = "")
EndDeclareModule

Module Path
	Declare.s _join_path(to_.s, what.s)
	
	Procedure.s join(element1.s, element2.s, element3.s = "", element4.s = "", element5.s = "", element6.s = "")
		Protected result.s = _join_path(element1, element2)
		
		If (element3 <> "")
			result = _join_path(result, element3)
			If (element4 <> "")
				result = _join_path(result, element4)
				If (element5 <> "")
					result = _join_path(result, element5)
					If (element6 <> "")
						result = _join_path(result, element6)
					EndIf
				EndIf
			EndIf
		EndIf
		
		ProcedureReturn result
	EndProcedure
	
	Procedure.s terminate_path_by_separator(path.s)
		If (Not StringUtil::endswith(path, Path::#SEPARATOR))
			ProcedureReturn path + Path::#SEPARATOR
		EndIf
		
		ProcedureReturn path
	EndProcedure
	
	Procedure.s _join_path(to_.s, what.s)
		If (Right(to_, 1) <> #SEPARATOR)
			to_ = to_ + #SEPARATOR
		EndIf
		
		If (Left(what, 1) = #SEPARATOR)
			what = Right(what, Len(what) - 1)
		EndIf
			
		ProcedureReturn to_ + what
	EndProcedure
EndModule