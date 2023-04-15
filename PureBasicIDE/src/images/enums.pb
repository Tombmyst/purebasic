DeclareModule ImageEnumHandles
	Enumeration 1 ; 0 is reserved for uninitialized #PB_Any objects
		#Startup
		#PureBasicLogo
		
		#ToolsPanelLeft
		#ToolsPanelRight
		
		#FileViewer_Open
		#FileViewer_Close
		#FileViewer_Left
		#FileViewer_Right
		
		#Preferences_FirstColor
		#Preferences_LastColor = #Preferences_FirstColor + #COLOR_Last
		
		#Preferences_ToolsPanelFrontColor
		#Preferences_ToolsPanelBackColor
		
		#Preferences_IssueColor
		
		#FilePanel_New
		#FilePanel_Project
		
		CompilerIf #CompileLinux
			#LinuxWindowIcon
		CompilerEndIf
		
		;   #IMAGE_CPU_Real
		;   #IMAGE_CPU_Temp
		
		#Template_Add
		#Template_Edit
		#Template_Remove
		#Template_AddDir
		#Template_RemoveDir
		#Template_Template
		#Template_Dir
		#Template_Up
		#Template_Down
		
		#Option_AddTarget
		#Option_EditTarget
		#Option_CopyTarget
		#Option_RemoveTarget
		#Option_TargetUp
		#Option_TargetDown
		#Option_DefaultTarget
		#Option_NormalTarget
		#Option_DisabledTarget
		
		#ProjectPanel_InternalFiles ; first in loop
		#ProjectPanel_ExternalFiles
		#ProjectPanel_Directory
		#ProjectPanel_File
		#ProjectPanel_FileScanned
		#ProjectPanel_Open
		#ProjectPanel_AddFile
		#ProjectPanel_RemoveFile
		#ProjectPanel_RescanFile ; last in loop
		
		#IssueSingleFile
		#IssueMultiFile
		#IssueExport
		#AllIssues
		#Priority0  ; first in loop
		#Priority1
		#Priority2
		#Priority3
		#Priority4  ; last in loop
		
		#FormIcons_Cursor
		#FormIcons_Button
		#FormIcons_ButtonImage
		#FormIcons_Calendar
		#FormIcons_Canvas
		#FormIcons_CheckBox
		#FormIcons_ComboBox
		#FormIcons_Container
		#FormIcons_Date
		#FormIcons_Editor
		#FormIcons_ExplorerCombo
		#FormIcons_ExplorerList
		#FormIcons_ExplorerTree
		#FormIcons_Frame3D
		#FormIcons_HyperLink
		#FormIcons_Image
		#FormIcons_IPAddress
		#FormIcons_ListIcon
		#FormIcons_ListView
		#FormIcons_Menu
		#FormIcons_Option
		#FormIcons_Panel
		#FormIcons_ProgressBar
		#FormIcons_ScrollArea
		#FormIcons_ScrollBar
		#FormIcons_Spin
		#FormIcons_Splitter
		#FormIcons_Status
		#FormIcons_String
		#FormIcons_Text
		#FormIcons_ToolBar
		#FormIcons_TrackBar
		#FormIcons_Tree
		#FormIcons_Web
		
		; Form images
		#Img_Up
		#Img_Down
		#Img_Delete
		#Img_Combo
		#Img_Spin
		#Img_Date
		#Img_ArrowDown
		
		#Img_MacCheckbox
		#Img_MacCheckboxSel
		#Img_MacOption
		#Img_MacOptionSel
		#Img_MacTrackbar
		#Img_MacTrackbarV
		
		#Img_MacDis
		#Img_MacClose
		#Img_MacMin
		#Img_MacMax
		#Img_MacSubMenu
		
		#Img_Win7MinDis
		#Img_Win7MaxDis
		#Img_Win7Close
		#Img_Win7Min
		#Img_Win7Max
		
		#Img_Win7Checkbox
		#Img_Win7CheckboxSel
		#Img_Win7Option
		#Img_Win7OptionSel
		#Img_Win7Trackbar
		#Img_Win7TrackbarV
		
		#Img_Win8Close
		#Img_Win8Min
		#Img_Win8Max
		#Img_Win8Checkbox
		#Img_Win8CheckboxSel
		#Img_Win8Option
		#Img_Win8OptionSel
		#Img_Win8Spin
		#Img_Win8ArrowDown
		#Img_Win8ScrollLeft
		#Img_Win8ScrollRight
		#Img_Win8ScrollUp
		#Img_Win8ScrollDown
		
		#Img_LinuxClose
		#Img_LinuxMin
		#Img_LinuxMax
		
		#Img_WindowsIcon
		#Img_ScrollLeft
		#Img_ScrollRight
		#Img_ScrollUp
		#Img_ScrollDown
		
		#Img_Plus
		
		#Drawing_Img
		#TDrawing_Img
		
		
		#Build_TargetNotDone
		#Build_TargetOK
		#Build_TargetError
		#Build_TargetWarning
		
		#ToolBar_Space
		#ToolBar_Missing
		
		#Help_Back
		#Help_Forward
		#Help_Home
		#Help_Previous
		#Help_Next
		#Help_OpenHelp
		
		#Diff_Open1
		#Diff_Open2
		#Diff_Refresh
		#Diff_Colors
		#Diff_Swap
		#Diff_Vertical
		#Diff_HideFiles
		#Diff_Up
		#Diff_Down
		#Diff_ShowTool
		#Diff_Equal ; first in loop
		#Diff_Add
		#Diff_Delete
		#Diff_Modify ; last in loop
		
		#Color_Content1
		#Color_Content2
		
		#Explorer_AddFavorite
		#Explorer_RemoveFavorite
		#Explorer_File
		#Explorer_FilePB
		#Explorer_Directory
		
		#History_Session
		#History_File
		#History_First
		#History_Last = #History_First + #HISTORY_Last
		
		#FirstThemePreview ; for loading individual icons. the composed preview images are #PB_Any
		#LastThemePreview  = #FirstThemePreview + #MAX_ThemePreview
		
	EndEnumeration
EndDeclareModule

Module ImageEnumHandles : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 216
; Folding = -
; Optimizer
; EnableXP
; DPIAware