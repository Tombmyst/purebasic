DeclareModule DiffResult
	Enumeration 1
		#MATCH
		#INSERT
		#DELETE_
	EndEnumeration	
EndDeclareModule

Module DiffResult : EndModule

DeclareModule Diff
	; Possible Flags for the Diff() procedure
	EnumerationBinary
		#IGNORE_CASE			; ignore case
		#IGNORE_SPACE_ALL		; ignore all space changes (also inside of lines)
		#IGNORE_SPACE_LEFT		; ignore space changes on the left of a line (indentation)
		#IGNORE_SPACE_RIGHT		; ignore space changes on the right of a line
	EndEnumeration
	
	; A line in the parsed diff file
	Structure STRUCT_DIFF_LINE
		checksum.l		; Crc32 of the line
		length.l		; Line length including newline
		*start			; Line start in original buffer
	EndStructure
	
	; One edit command
	; Note that the line information refers to file A for Match/Delete and file B for Insets
	Structure STRUCT_DIFF_EDIT
		op.l
		
		start_line.l			; 0 based line start
		number_of_lines.l
		length_in_bytes.l
		*start_in_original_buffer
	EndStructure
	
	Structure STRUCT_DIFF_CONTEXT
		Array file_a.STRUCT_DIFF_LINE(1000)
		Array file_b.STRUCT_DIFF_LINE(1000)
		List edits.STRUCT_DIFF_EDIT()
		
		line_count_in_file_a.l
		line_count_in_file_b.l
		
		Array FV.l(0)	; TODO: rename
		Array RV.l(0)	; TODO: rename
	EndStructure
EndDeclareModule

Module Diff
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 4
; Folding = -
; Optimizer
; EnableXP
; DPIAware