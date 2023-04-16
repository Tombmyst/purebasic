DeclareModule Project
	Structure STRUCT_PROJECT_SOURCE_FILE_CONFIG
		should_load_at_startup.b
		should_file_be_scanned_for_autocomplete.b
		should_show_in_panel.b
		should_show_warning_on_file_change.b
		
		file_name.s
		panel_state.s 								; string of "0"/"1" for every parent directory of the file to indicate whether it is expanded in panel (empty if ShowPanel=0)
		
		sort_index.l
	EndStructure
	
	Structure STRUCT_PROJECT_SOURCE_FILE Extends STRUCT_PROJECT_SOURCE_FILE_CONFIG
		*source.Source::STRUCT_SOURCE							; null when file not loaded
		*parsed_data.Parser::STRUCT_PER_LINE_SCANNED_DATA		; null when file loaded
		
		last_open.l		; TODO: rename + retype
		md5.s
	EndStructure
EndDeclareModule

Module Project
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 13
; Folding = -
; Optimizer
; EnableXP
; DPIAware