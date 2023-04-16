DeclareModule UIToolbar
	Structure STRUCT_TOOLBAR_ITEM
		name.s
		action.s
		image_handle.i
	EndStructure
	
	Declare.u getToolbarHeight()  ; REPLACES: Commons::ToolbarHeight at 2514
	Declare.w getToolbarOffset()  ; REPLACES: Commons::ToolbarTopOffset at 2514
EndDeclareModule

Module UIToolbar
	Procedure.u getToolbarHeight()
		; TODO: a faire
	EndProcedure
	
	Procedure.w getToolbarOffset()
		; TODO a faire
	EndProcedure
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 19
; Folding = -
; Optimizer
; EnableXP
; DPIAware