DeclareModule IssuesViewer
	Structure STRUCT_FOUND_ISSUE
		text.s
		
		position.l		; 1-based position in comment
		length.l
		
		index_in_issues_list.l
		style.l
		
		priority.b
	EndStructure
EndDeclareModule

Module IssuesViewer
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 8
; Folding = -
; Optimizer
; EnableXP
; DPIAware