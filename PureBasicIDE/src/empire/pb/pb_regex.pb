DeclareModule PBRegex : UseModule EmpireCommons
	Macro safe_free_regex(regex)
		If (IsRegularExpression(regex))
			FreeRegularExpression(regex)
		EndIf
	EndMacro
	
	Macro create_regex(regex_pattern, case_sensitive=false)
		CreateRegularExpression(#PB_Any, regex_pattern, #PB_RegularExpression_NoCase * PBBool::not_(case_sensitive))
	EndMacro
EndDeclareModule

Module PBRegex
	
EndModule