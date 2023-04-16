DeclareModule TokenTypes
	; Note: MUST be kept in sync with the data section and ParserData structures!
	Enumeration
		  ; The first entries correspond to the Sorted[] array in the ParserData structure
  		; These entries also correspond to the AutoCompleteOptions()/VariableViewerOptions() array.
		#TOKEN_VARIABLE  			; variable, but could also be item in Structure def etc
		#TOKEN_ARRAY
		#TOKEN_LINKED_LIST
		#TOKEN_MAP
		#TOKEN_PROCEDURE
		#TOKEN_MACRO   				; A FunctionMacro can be known by the Prototype$ field, so no need to separate those
		#TOKEN_IMPORT  				; Not used in code data, only in sorted data (actual items are all #ITEM_UnknownBraced)
		#TOKEN_CONSTANT
		#TOKEN_DECLARE_MODULE		; used for module tracking and also for autocomplete of module names
		#TOKEN_PROTOTYPE
		#TOKEN_STRUCTURE
		#TOKEN_INTERFACE
		#TOKEN_LABEL
		#TOKEN_DECLARE
		
		; Items following are not in the Sorted[] array
		#TOKEN_FOLD_START			; for the folding only
		#TOKEN_FOLD_END
		#TOKEN_MACRO_END			; so we know what stuff to ignore later on
		#TOKEN_PROCEDURE_END		; for procedure background color
		#TOKEN_DEFINE
		#TOKEN_KEYWORD
		#TOKEN_COMMENT_MARK			; ";-" marks
		#TOKEN_ISSUE				; code issues markers in comments
		#TOKEN_UNKNOWN_BRACED		; could be array, list or function call. needs to be resolved later
		
		; Module boundaries (separate items for fast search)
		#TOKEN_END_DECLARE_MODULE
		#TOKEN_MODULE
		#TOKEN_USE_MODULE
		#TOKEN_UNUSE_MODULE
		
		
		#TOKEN__LAST
	EndEnumeration
	
	#TOKEN_LAST_SORTED = #TOKEN_DECLARE	; last item in "sorted source data"
	#TOKEN_LAST_OPTION = #TOKEN_LABEL	; last item in prefs options
	#TOKEN_UNKNOWN = -1					; possible result of ResolveItemType()
	
EndDeclareModule

Module TokenTypes : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 43
; Folding = -
; Optimizer
; EnableXP
; DPIAware