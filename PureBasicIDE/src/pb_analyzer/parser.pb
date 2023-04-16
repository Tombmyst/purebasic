DeclareModule Parser
	#SCOPE_UNKNOWN = -1		; special scope value (in addition to the debugger ones)
	#PARSER_VT_SIZE = 27	; number of indexed entries per sorted array
	
	Structure STRUCT_INDEXED_DATA
		*bucket.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
	EndStructure
	
	Structure STRUCT_SORTED_DATA
		*variables.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*arrays.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*linked_lists.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*maps.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*procedures.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*macros.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*imports.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*constants.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*modules.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*prototypes.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*structures.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*interfaces.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*labels.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
		*declarations.Token::STRUCT_TOKEN[#PARSER_VT_SIZE]
	EndStructure
	
	Structure STRUCT_PARSED_LINE
		*first_token.Token::STRUCT_TOKEN
		*last_token.Token::STRUCT_TOKEN
	EndStructure
	
	Structure STRUCT_PARSED_LINES
		line_.STRUCT_PARSED_LINE[0]
	EndStructure
	
	; Sorted parser data for a specific module
	; The module "" identifies the global scope
	Structure STRUCT_SORTED_MODULE
		name.s						; module name in proper case (without and "IMPL::" prefix)
		StructureUnion
			indexed.STRUCT_INDEXED_DATA[TokenTypes::#TOKEN_LAST_SORTED + 1]		; indexed access per #TOKEN_...
			sorted.STRUCT_SORTED_DATA											; named access per \Arrays[x]
		EndStructureUnion
	EndStructure
	
	Structure STRUCT_PER_LINE_SCANNED_DATA  ; REPLACES Common::ParserData
		*parsed_lines.STRUCT_PARSED_LINES	; new list for procedure/autocomplete stuff REPLACES *SourceItemArray
		number_of_lines.l					; currently used array entries (= LineNumber count) REPLACES SourceItemCount
		parsed_lines_array_size.l			; allocated size of the array REPLACES SourceItemSize
		
		; Sorted index data per module. A module name prefixed with "IMPL::" contains the info
		; inside a Module/EndModule block. All module names here are uppercase
		;
		; These are pointers to the SourceItems linked above, so they only stay valid
		; until another scan is done (even for a line). 'SortedValid' indicates this
		;
		; The data is only sorted by first char, the rest is unsorted
		;
		Map modules.STRUCT_SORTED_MODULE()
		*main_module.STRUCT_SORTED_MODULE	; points inside the modules() map
		
		; The Issues are not sorted by name, but simply by line for fast access
		; Note that we still use the *NextSorted and SortedLine fields for this list
		*sorted_issues.Token::STRUCT_TOKEN
		
		is_utf8.b							; When false, means that it is in ASCII. REPLACES Encoding
		sorted_valid.b
	EndStructure
EndDeclareModule	

Module Parser
	
EndModule

CompilerIf SizeOf(Parser::STRUCT_SORTED_DATA) <> (SizeOf(Parser::STRUCT_INDEXED_DATA) * (TokenTypes::#TOKEN_LAST_SORTED + 1))
	CompilerError "Parser structures are out of sync from constants defined in module TokenTypes"
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 30
; Folding = -
; Optimizer
; EnableXP
; DPIAware