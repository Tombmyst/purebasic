;- Highlighting Colors
;
; Colors now managed in an array for easier extension and less code
;
; NOTE: The values of these constants must correspond to the keys in the
;       language section that display them. The order in which the settings
;       are displayed in the prefs is independent, as it can be set in the dialog xml
;       The first index must be 0 so #COLOR_Last+1 is the total number of colors
;
;       Also the order of the Keys and color sets at the bottom of Preferences.pb
;       must match this order
;
DeclareModule HighlightEnumColorIndices
	Enumeration 0
		#COLOR_ASMKeyword
		#COLOR_GlobalBackground ; #COLOR_BACKGROUND is a winapi constant!
		#COLOR_BasicKeyword
		#COLOR_Comment
		#COLOR_Constant
		#COLOR_Label
		#COLOR_NormalText
		#COLOR_Number
		#COLOR_Operator
		#COLOR_Pointer
		#COLOR_PureKeyword
		#COLOR_Separator
		#COLOR_String
		#COLOR_Structure
		#COLOR_LineNumber
		#COLOR_LineNumberBack
		#COLOR_Marker
		#COLOR_CurrentLine
		#COLOR_Selection
		#COLOR_SelectionFront
		#COLOR_Cursor
		#COLOR_DebuggerLine
		#COLOR_DebuggerLineSymbol
		#COLOR_DebuggerError
		#COLOR_DebuggerErrorSymbol
		#COLOR_DebuggerBreakPoint
		#COLOR_DebuggerBreakpointSymbol
		#COLOR_DisabledBack
		#COLOR_GoodBrace
		#COLOR_BadBrace
		#COLOR_ProcedureBack
		#COLOR_CustomKeyword
		#COLOR_DebuggerWarning
		#COLOR_DebuggerWarningSymbol
		#COLOR_Whitespace
		#COLOR_Module
		#COLOR_SelectionRepeat
		#COLOR_PlainBackground
		
		#COLOR_Last = #COLOR_PlainBackground
	EndEnumeration
EndDeclareModule

Module HighlightEnumColorIndices : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 14
; Folding = -
; Optimizer
; EnableXP
; DPIAware