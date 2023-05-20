DeclareModule __UNSORTED__
	;
	;- Misc Constants
	;
	
	#TOOLBAR   = 0
	#TOOLBAR_FileViewer = 1
	#TOOLBAR_Diff = 2
	
	#STATUSBAR = 0
	#STATUSBAR_FileViewer = 1
	
	#MENU      = 0
	#POPUPMENU = 1
	;#POPUPMENU_Help = 2 ; for linux
	;#POPUPMENU_VariableViewer = 3  ; debugger ( reserve this value!)
	;#POPUPMENU_ArrayViewer = 4     ; debugger ( reserve this value!)
	#POPUPMENU_Template = 5
	;#POPUPMENU_TemplateEdit = 6    ; not used
	;#POPUPMENU_Profiler = 7        ; debugger (reserved)
	#POPUPMENU_Options = 8          ; for Project targets in CompilerOptions
	#POPUPMENU_ProjectPanel = 9		; used in ProjectPanel and ProjectInfo
	#POPUPMENU_Targets = 10			; ProjectInfo list
	#POPUPMENU_FilesPanel = 11
	#POPUPMENU_ErrorLog = 12
	#POPUPMENU_TabBar = 13
	
	#PB_MessageRequester_Yes    = 6
	#PB_MessageRequester_No     = 7
	#PB_MessageRequester_Cancel = 2
	#PB_MessageRequester_OkCancel = 1
	
	#INDENT_None      = 0
	#INDENT_Block     = 1
	#INDENT_Sensitive = 2
	
	#ZOOM_Default = 0
	
	#WORDCHARS_Default = "$#*%"
	
	Enumeration
		#TOOLBARICONTYPE_Separator
		#TOOLBARICONTYPE_Space
		#TOOLBARICONTYPE_Internal
		#TOOLBARICONTYPE_External
	EndEnumeration
EndDeclareModule

Module __UNSORTED__
	
EndModule

; Max number of children that any container can have.
;
#MAX_CHILDLIST = 100

Macro Dialog_CompilerOptionsMacro()
  CompilerIf Defined(IDE_ProjectCompilerOptions, #PB_Constant)
    Dialog_ProjectCompilerOptions:
  CompilerElse
    Dialog_CompilerOptions:
  CompilerEndIf
EndMacro

Enumeration 1
  #DIALOG_Window
  #DIALOG_Shortcut ; not a real object, only used during dialog creation
  
  #DIALOG_Button
  #DIALOG_Checkbox
  #DIALOG_Image
  #DIALOG_Option
  #DIALOG_ListView
  #DIALOG_ListIcon
  #DIALOG_Tree
  #DIALOG_Container
  #DIALOG_ComboBox
  #DIALOG_Text
  #DIALOG_String
  #DIALOG_Panel
  #DIALOG_Tab
  #DIALOG_Scroll
  #DIALOG_Frame
  #DIALOG_Item
  #DIALOG_Column
  #DIALOG_Editor
  #DIALOG_Scintilla
  #DIALOG_ScrollBar
  #DIALOG_ProgressBar
  #DIALOG_ExplorerList
  #DIALOG_ExplorerTree
  #DIALOG_ExplorerCombo
  #DIALOG_Splitter
  #DIALOG_ShortcutGadget
  #DIALOG_ButtonImage
  #DIALOG_TrackBar
  #DIALOG_HyperLink
  
  ; virtual packing objects
  #DIALOG_VBox
  #DIALOG_HBox
  #DIALOG_Multibox
  #DIALOG_Singlebox
  #DIALOG_Gridbox
  #DIALOG_Empty
EndEnumeration

; Alignment Properties
;
Enumeration ; also used for left, center, right
  #Dlg_Align_Top = 1 ; do not include 0 for better testing
  #Dlg_Align_Center
  #Dlg_Align_Bottom
EndEnumeration

; Expansion Properties
;
Enumeration
  #Dlg_Expand_Yes = 1
  #Dlg_Expand_No
  #Dlg_Expand_Equal
  #Dlg_Expand_Item
EndEnumeration
