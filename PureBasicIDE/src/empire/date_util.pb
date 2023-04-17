DeclareModule DateUtil
	Declare.s to_yyyy_mm_dd_hh_ii_ss(date_.l, date_separator.s = "/", datetime_separator.s = " ", time_separator.s = ":")
	
EndDeclareModule

Module DateUtil
	Procedure.s to_yyyy_mm_dd_hh_ii_ss(date_.l, date_separator.s = "/", datetime_separator.s = " ", time_separator.s = ":")
		ProcedureReturn FormatDate("%yyyy" + date_separator + "%mm" + date_separator + "%dd" + datetime_separator + "%hh" + time_separator + "%ii" + time_separator + "%ss", date_)
	EndProcedure
EndModule

CompilerIf #PB_Compiler_IsMainFile
	Debug DateUtil::to_yyyy_mm_dd_hh_ii_ss(Date(2020, 03, 12, 13, 40, 22))
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 11
; Folding = -
; Optimizer
; EnableXP
; DPIAware