DeclareModule IDEConstants ; TODO: most of the following should be configurable via settings
	#MAX_LINE_HISTORY_TO_KEEP = 20
	#MAX_LOG_LINES_TO_KEEP = 256  ; REPLACES: #MAX_ErrorLog
	#MAX_MENU_PROJECT_TARGETS = 100 ; Max number of project targets that can be shown in the menu (reserves menu entries)
	#MAX_RECENT_ITEMS = 100  ; reserves Menu entries (for recent projects and recent files)
	#MAX_TOOLS = 100
	#MAX_USER_LIBRARIES_HELP_FILES = 100
	
	#PROGRAM_NAME = "PureBasic IDE"  ; TODO: rename
	#PROGRAM_VERSION = "0.1"
	
	#HISTORY_DB_FILE = "history.db"
	#PREFERENCES_FILE_NAME = "settings.cfg"
	#TEMPLATE_FILE_NAME = "templates.cfg"
	#TOOLS_FILE_NAME = "tools.cfg"
	#UPDATE_CHECK_FILE = "update_check.json"
EndDeclareModule

Module IDEConstants
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 9
; Folding = -
; Optimizer
; EnableXP
; DPIAware