DeclareModule Tools
	Structure STRUCT_TOOLS_DATA
		command_line.s
		arguments.s
		working_directory.s
		menu_item_name.s
		
		config_line.s
		
		hide_from_menu.b
		
		; TODO: all of the following, rename + retype
		shortcut.l
		trigger.l
		flags.l
		reload_source.l
		hide_editor.l
		source_specific.l
		de_activate_tool.l
	EndStructure
EndDeclareModule

Module Tools
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 18
; Folding = -
; Optimizer
; EnableXP
; DPIAware