; IDE specific constant values for Scintilla

DeclareModule IDE_SCI_Constants
	;- Marker constants

	; NOTE: the values of the markers determine their position when being drawn.
	; (higher number = drawn on top)
	;
	
	; duplicates of the real folding markers, but with a lower priority than the other ones, so our own are on top
	#MARKER_FOLD_V_LINE 						= 0
	#MARKER_FOLD_V_CORNER						= 1
	#MARKER_FOLD_T_CORNER						= 2
	
	#MARKER_PROCEDURE_START						= 3 ; line with a procedure start
	#MARKER_PROCEDURE_BACKGROUND				= 4 ; procedure background setting (lower priority than other background settings!)
	
	; space for ISSUE markers (lower priority than the debugger ones, but above procedure background stuff)
	; note: leave some speace for future internal use (marker range is only 0-24)
	#MARKER_FIRST_ISSUE        					= 5
	#MARKER_LAST_ISSUE         					= 10
	#MAX_ISSUE_MARKER	         				= #MARKER_LAST_ISSUE - #MARKER_FIRST_ISSUE + 1
	
	#MARKER_LINE_MARKER            				= 22 ; line markers REPLACES #MARKER_Marker
	
	#MARKER_WARNING_SYMBOL	     				= 19
	#MARKER_ERROR_SYMBOL	       				= 20 ; merker symbols
	#MARKER_BREAKPOINT_SYMBOL  					= 21
	#MARKER_CURRENT_LINE_SYMBOL 				= 23
	
	#MARKER_CURRENT_LINE_BACKGROUND				= 16 ; line backgrounds REPLACE #MARKER_CurrentLine
	#MARKER_WARNING_LINE_BACKGROUND				= 17
	#MARKER_ERROR_LINE_BACKGROUND				= 18
	#MARKER_BREAKPOINT_LINE_BACKGROUND			= 15
	
	;- Styling related constants

	; Note: styles can go up to 255 now, so no need to impose a max limit on the issue styles
	#STYLE_FIRST_ISSUE							= #STYLE_LASTPREDEFINED + 1
	
	;- Indicator constants

	#INDICATOR_KEYWORD_MATCH					= 0
	#INDICATOR_KEYWORD_MISMATCH					= 1
	#INDICATOR_SELECTION_REPEAT 				= 2
EndDeclareModule

Module IDE_SCI_Constants : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 44
; Folding = -
; Optimizer
; EnableXP
; DPIAware