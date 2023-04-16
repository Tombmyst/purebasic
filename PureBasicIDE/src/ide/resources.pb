DeclareModule Resources
	Declare load()
EndDeclareModule

Module Resources : UseModule G
	Procedure load()
		
	EndProcedure
	
	DataSection ;- Embedded data
		source_item_names: ;- Source Item Names
		Data.s "Variable"
		Data.s "Array"
		Data.s "List"
		Data.s "Map"
		Data.s "Procedure"
		Data.s "Macro"
		Data.s "Import"
		Data.s "Constant"
		Data.s "Module"
		Data.s "Prototype"
		Data.s "Structure"
		Data.s "Interface"
		Data.s "Label"
		
		source_item_defaults: ;- Source Item Defaults
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b true
		Data.b false
		Data.b false
		Data.b false
		Data.b false
		
		
		token_names: ;- Token Names
		Data.s "PBKeywords"
		Data.s "ASMKeywords"
		Data.s "PBFunctions"
		Data.s "APIFunctions"
		Data.s "PBConstants"
		Data.s "PBStructures"
		Data.s "PBInterfaces"
		
		PBItem_Defaults: ;- Token Defaults
		Data.b true
		Data.b false
		Data.b true
		Data.b false
		Data.b true
		Data.b false
		Data.b false
	EndDataSection
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 7
; Folding = -
; Optimizer
; EnableXP
; DPIAware