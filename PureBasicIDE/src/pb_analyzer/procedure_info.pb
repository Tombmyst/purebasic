; Temporary module for this structure.
; TODO: a crisser din vidanges
DeclareModule ProcedureInfo
	Enumeration
		#PROCEDURE
		#MACRO
		#MARKER
		#ISSUE
	EndEnumeration
	
	Structure STRUCT_
		name.s
		prototype_.s	; TODO: rename to signature
		line.l  		; 1 based
		type.b			
	EndStructure
EndDeclareModule

Module ProcedureInfo : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1
; Folding = -
; Optimizer
; EnableXP
; DPIAware