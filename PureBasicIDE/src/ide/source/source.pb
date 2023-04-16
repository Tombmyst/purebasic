DeclareModule Source
	Structure STRUCT_SOURCE
		newline_type.b  						; From Settings::#NEWLINE_XXXX
		source_type.b							; From SourceTypes
		exists_on_disk.b
		has_parser_data_changed.b
		
		is_dirty.b
		is_dirty_displayed.b  					; REPLACES: DisplayModified
		is_fold_toggled.b	  					; last state of the "toggle folds" menu command REPLACES: ToggleFolds
		is_error_log_enabled.b					; REPLACES: ErrorLog
		
		should_be_excluded_from_history.b		; exclude from history (too large size)
		is_newly_created_file.b					; true if the file was new and not saved yet
		
		last_write_date.l
		current_column_display.l
		
		current_cursor_column_position_in_bytes.l
		current_cursor_column_position_in_chars.l
		
		current_line.l
		last_line.l
		
		procedure_browser_scroll.l				; last scroll position in procedure browser
		modified_since_update.l					; TODO: rename
		
		log_size.l
		
		editor_gadget_handle.i
		line_numbers.i							; TODO: rename + change type accordingly to what this field does
		
		line_numbers_width.l					; TODO: rename + change type accordingly to what this field does
		line_number_count.l						; TODO: rename + change type accordingly to what this field does
		
		debugger_id.i
		project_file_struct_ptr.i				; Pointer to a STRUCT_PROJECT_FILE. NULL when not part of a project. IMPORTANT: must not be typed otherwise will induce circular ref.
		
		form_file_struct_ptr.i
		
		disk_file_size.q
		
		disk_file_md5.s
		history_name.s							; either the filename or a unique id string for unsaved files
		log_lines.s[IDEConstants::#MAX_LOG_LINES_TO_KEEP]
		
		parsed_data.Parser::STRUCT_PER_LINE_SCANNED_DATA
		
		line_history.l[IDEConstants::#MAX_LINE_HISTORY_TO_KEEP]
		
		List unknown_ide_options.s()  			; buffer with strings that are unknown in the project settings block.
	EndStructure
EndDeclareModule

Module Source
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 50
; Folding = -
; Optimizer
; EnableXP
; DPIAware