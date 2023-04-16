DeclareModule ZIP
	Structure STRUCT_ZIP_ENTRY
		name.s
		
		crc32.l
		compression.l		; TODO: rename
		compressed.l		; TODO: rename
		uncompressed.l		; TODO: rename
		
		*content
	EndStructure
EndDeclareModule

Module ZIP
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 9
; Folding = -
; Optimizer
; EnableXP
; DPIAware