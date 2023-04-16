DeclareModule Token
	; Represents data held for the SourceParser.pb code
	; (used by SourceFile and ProjectFile structures)
	;
	Structure STRUCT_TOKEN  ; REPLACES: Common::SourceItem
		*next.STRUCT_TOKEN			; Linked list per Source Line
		*previous.STRUCT_TOKEN
		*next_sorted.STRUCT_TOKEN	; (single) Linked list per sorted code data
		
		type.w
		position.w					; Character position in source line (only for code items, -1 if unused)
		length.w					; Character length (only for code items)
		full_length.w				; length including the call prototype (for #ITEM_UnknownBraced + Import detection + structure+extends combinations)
		
		name.s
		module_prefix.s				; the module prefix (if any)
		
		; Item specific String data
		StructureUnion
			string_data.s			; generic name (for item comparing)
			proto_type.s			; Procedure, Macro, Declare, Prototype
			data_type.s				; Variable, Array, Linkedlist. Can be separated: <parsed type><chr(10)><guessed type>, so always use StringField here
			content.s				; Structure, Interface: extended interface/structure +  Chr(10) separated list of entries stored only for Project files, parsed directly when needed else
		EndStructureUnion
		
		; Item specific numeric data
		StructureUnion
			numeric_data.l			; generic name (for item comparing)
			keyword.l				; Keywords
			scope.l		  			; Variables etc (uses #SCOPE_XXX from the debugger)
			is_definition.l			; Labels: #true if it is the def, #fals if it is ?LabelName
			is_assignment.l 		; Constants: #true if the constant is followed by a =
			issue_index.l		   	; Issues: index in the Issues() list (REPLACES "Issue")
		EndStructureUnion
		
		sorted_line.l				; line number (only valid for sorted code items!)
	EndStructure
	
	Structure STRUCT_TOKEN_LINE ; REPLACES Common::SourceItemPair
		*token.STRUCT_TOKEN
		line.l
	EndStructure
EndDeclareModule

Module Token
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 18
; Folding = -
; Optimizer
; EnableXP
; DPIAware