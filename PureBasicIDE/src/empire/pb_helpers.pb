DeclareModule PB
	; When coming from languages where the for loop excludes *end_* itself
	; this can be error prone, hence this short macro
	Macro xfor(var, start, end_, step_ = 1)
		For var = start To end_ - 1 Step step_
	EndMacro
EndDeclareModule

Module PB
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 2
; Folding = -
; Optimizer
; EnableXP
; DPIAware