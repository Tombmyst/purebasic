DeclareModule iif : UseModule EmpireCommons
	Declare.b bb(boolResult.boolean, onTrue.b, onFalse.b)
	Declare.a aa(boolResult.boolean, onTrue.a, onFalse.a)
	Declare.w ww(boolResult.boolean, onTrue.w, onFalse.w)
	Declare.u uu(boolResult.boolean, onTrue.u, onFalse.u)
	Declare.l ll(boolResult.boolean, onTrue.l, onFalse.l)
	Declare.i ii(boolResult.boolean, onTrue.i, onFalse.i)
	Declare.q qq(boolResult.boolean, onTrue.q, onFalse.q)
	Declare.f ff(boolResult.boolean, onTrue.f, onFalse.f)
	Declare.d dd(boolResult.boolean, onTrue.d, onFalse.d)
	Declare.s ss(boolResult.boolean, onTrue.s, onFalse.s)
EndDeclareModule

Module iif
	Macro _tif(boolResult, onTrue, onFalse)
		If boolResult
			ProcedureReturn onTrue
		EndIf
		ProcedureReturn onFalse
	EndMacro
	
	Procedure.b bb(boolResult.boolean, onTrue.b, onFalse.b)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.a aa(boolResult.boolean, onTrue.a, onFalse.a)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.w ww(boolResult.boolean, onTrue.w, onFalse.w)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.u uu(boolResult.boolean, onTrue.u, onFalse.u)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.l ll(boolResult.boolean, onTrue.l, onFalse.l)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.i ii(boolResult.boolean, onTrue.i, onFalse.i)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.q qq(boolResult.boolean, onTrue.q, onFalse.q)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.f ff(boolResult.boolean, onTrue.f, onFalse.f)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.d dd(boolResult.boolean, onTrue.d, onFalse.d)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
	
	Procedure.s ss(boolResult.boolean, onTrue.s, onFalse.s)
		_tif(boolResult, onTrue, onFalse)
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 2
; Folding = ---
; Optimizer
; EnableXP
; DPIAware