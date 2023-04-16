
DeclareModule UIEnumWindows : UseModule G
	Runtime Enumeration 1 ; 0 is reserved
		#Startup
		#Main
		#About
		#Preferences
		#FileViewer
		#Goto
		#Find
		#StructureViewer
		#Compiler
		#Option
		CompilerIf #SPIDER_BASIC
			#CreateApp
		CompilerEndIf
		#Grep
		#GrepOutput
		#AddTools
		#EditTools
		#AutoComplete
		;#WINDOW_SortSources
		;#WINDOW_CPUMonitor
		#Template
		#MacroError
		#Warnings
		#ProjectOptions
		#Build
		#Help
		#Diff
		#DiffDirectory
		#DiffDialog
		#FileMonitor
		#EditHistory
		#EditHistoryShutdown
		#Updates
		#Form_Parent
		
		CompilerIf #DEBUG
			#Debugging ; for global use. all gadgets are #PB_Any on this window
		CompilerEndIf
	EndEnumeration
EndDeclareModule

Module UIEnumWindows : EndModule

DeclareModule UIEnumGadgets : UseModule G
	Runtime Enumeration 1 ; 0 is reserved for uninitialized #PB_Any
		#FilesPanel; now a custom drawn CanvasGadget
		#ToolsPanel
		#ToolsPanelFake ; for hidden toolspanel
		#ErrorLog
		
		#ToolsSplitter
		#LogSplitter
		#SourceContainer
		#LogDummy   ; dummy to put in the splitter when log is hidden (replaces the sourcecontainer)
		#ToolsDummy ; dummy to put in when it is not used (to replace the seconds splitter)
		
		#ProjectInfo
		#ProjectInfo_FrameProject
		#ProjectInfo_FrameFiles
		#ProjectInfo_FrameTargets
		#ProjectInfo_Info
		#ProjectInfo_Files
		#ProjectInfo_Targets
		#ProjectInfo_OpenOptions
		#ProjectInfo_OpenCompilerOptions
		
		#Form
		#Form_Canvas
		#Form_ScrollH
		#Form_ScrollV
		#Form_Prop
		#Form_PropObjList
		#Form_GridContainer
		#Form_WindowTabs
		#Form_ObjList
		#Form_SplitterInt
		#Form_Splitter_1st
		#Form_Splitter_2nd
		#Form_Splitter_OK
		#Form_Splitter_Cancel
		
		#Form_Parent_Select_Text
		#Form_Parent_Select
		#Form_Parent_SelectItem
		#Form_Parent_SelectItem_Text
		#Form_Parent_OK
		#Form_Parent_Cancel
		
		#ProcedureBrowser
		
		#ProjectPanel
		
		#Explorer
		#Explorer_Pattern
		#Explorer_Favorites
		#Explorer_AddFavorite
		#Explorer_RemoveFavorite
		#Explorer_Splitter
		
		#AsciiTable
		#Ascii_InsertChar
		#Ascii_InsertAscii
		#Ascii_InsertHex
		#Ascii_InsertHtml
		
		; help viewer gadget (windows only right now)
		#HelpTool_Viewer
		#HelpTool_Back
		#HelpTool_Forward
		#HelpTool_Home
		#HelpTool_Help
		
		#Build_Targets
		#Build_Log
		#Build_WorkContainer
		#Build_DoneContainer
		#Build_CloseWhenDone
		#Build_Abort
		#Build_Copy
		#Build_Save
		#Build_Close
		
		#Preferences_Tree
		#Preferences_Ok
		#Preferences_Cancel
		#Preferences_Apply
		#Preferences_PageUp    ; Not actually a gadget, for now, just a shortcut
		#Preferences_PageDown  ; Not actually a gadget, for now, just a shortcut
		#Preferences_MonitorFileChanges
		#Preferences_SystemMessages
		#Preferences_DebugToLog
		#Preferences_ToolsPanelDelay
		#Preferences_MemorizeMarkers
		#Preferences_ColorSchemes
		#Preferences_ColorSchemeSet
		#Preferences_ExpShortcut
		#Preferences_ExpToolbar
		#Preferences_ExpColor
		#Preferences_ExpFolding
		#Preferences_ExportFile
		#Preferences_GetExportFile
		#Preferences_Export
		#Preferences_ImpShortcut
		#Preferences_ImpToolbar
		#Preferences_ImpColor
		#Preferences_ImpFolding
		#Preferences_ImportFile
		#Preferences_GetImportFile
		#Preferences_OpenImport
		#Preferences_Import
		#Preferences_AutoHidePanel
		#Preferences_NoSplashScreen
		#Preferences_DisplayFullPath
		
		CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
			#Preferences_DisplayDarkMode
		CompilerEndIf
		
		#Preferences_EnableMenuIcons
		#Preferences_DebuggerMode
		#Preferences_AutoClearLog
		#Preferences_DisplayErrorWindow
		#Preferences_DebuggerMemorizeWindows ; first to auto-disable
		#Preferences_WarningMode
		#Preferences_KeepErrorMarks
		#Preferences_DebuggerAlwaysOnTop
		#Preferences_DebuggerBringToTop
		#Preferences_DebuggerStopAtStart
		#Preferences_DebuggerStopAtEnd
		#Preferences_DebuggerLogTimeStamp
		#Preferences_DebuggerTimeout
		#Preferences_KillOnError
		#Preferences_DebugOutUseFont
		#Preferences_DebugOutFont
		#Preferences_DebugIsHex
		#Preferences_DebugOutTimeStamp
		#Preferences_RegisterIsHex
		#Preferences_StackIsHex
		#Preferences_AutoStackUpdate
		#Preferences_MemoryIsHex
		#Preferences_MemoryOneColumn
		#Preferences_VariableIsHex
		#Preferences_ProfilerStartup
		#Preferences_PurifierOpen
		#Preferences_DataBreakpointsOpen
		#Preferences_DebugWindowOpen
		#Preferences_AsmWindowOpen
		#Preferences_MemoryWindowOpen
		#Preferences_VariableWindowOpen
		#Preferences_ProfilerWindowOpen
		#Preferences_HistoryWindowOpen
		#Preferences_LibraryViewerWindowOpen
		#Preferences_WatchlistWindowOpen  ; last auto-disabled
		#Preferences_SaveProjectSettings
		#Preferences_SelectToolsPanelFont
		#Preferences_UseToolsPanelFont
		#Preferences_UseToolsPanelColors
		#Preferences_ToolsPanelFrontColor
		#Preferences_ToolsPanelFrontColorText
		#Preferences_ToolsPanelFrontColorSelect
		#Preferences_ToolsPanelBackColor
		#Preferences_ToolsPanelBackColorText
		#Preferences_ToolsPanelBackColorSelect
		#Preferences_NoIndependentToolsColors
		#Preferences_KeywordList
		#Preferences_KeywordText
		#Preferences_KeywordAdd
		#Preferences_KeywordRemove
		#Preferences_KeywordFile
		#Preferences_GetKeywordFile
		#Preferences_EnableFolding
		#Preferences_FoldStartList  ; first to autodisable
		#Preferences_FoldStartText
		#Preferences_FoldStartAdd
		#Preferences_FoldStartRemove
		#Preferences_FoldEndList
		#Preferences_FoldEndText
		#Preferences_FoldEndAdd
		#Preferences_FoldEndRemove   ; last to autodisable
		#Preferences_MemorizeWindow
		#Preferences_RunOnce
		#Preferences_ShowMainToolbar
		#Preferences_FileHistorySize
		#Preferences_FindHistorySize
		#Preferences_AutoReload
		#Preferences_AutoSave
		;  #GADGET_Preferences_AutoSaveExe
		#Preferences_AutoSaveAll
		#Preferences_TabLength
		#Preferences_RealTab
		#Preferences_MemorizeCursor
		#Preferences_SourcePath
		#Preferences_GetSourcePath
		#Preferences_AlwaysHideLog
		#Preferences_Debugger
		#Preferences_Purifier
		#Preferences_ErrorLog
		#Preferences_Optimizer
		#Preferences_InlineASM
		#Preferences_XPSkin
		#Preferences_VistaAdmin
		#Preferences_VistaUser
		#Preferences_DPIAware
		#Preferences_Thread
		#Preferences_OnError
		#Preferences_CustomCompiler
		#Preferences_SelectCustomCompiler
		#Preferences_ExecutableFormat
		#Preferences_CPU
		#Preferences_NewLineType
		#Preferences_Encoding
		#Preferences_SubSystem
		#Preferences_UseCompileCount
		#Preferences_UseBuildCount
		#Preferences_UseCreateExecutable
		#Preferences_TemporaryExe
		#Preferences_ToolsPanelSide
		#Preferences_AvailableTools
		#Preferences_UsedTools
		#Preferences_AddTool
		#Preferences_RemoveTool
		#Preferences_MoveToolUp
		#Preferences_MoveToolDown
		#Preferences_ToolSettingsContainer
		#Preferences_ToolSettingsScrollArea
		#Preferences_ExplorerMode0
		#Preferences_ExplorerMode1
		#Preferences_ExplorerSavePath
		#Preferences_ExplorerShowHidden
		#Preferences_ProcedureBrowserSort
		#Preferences_ProcedureBrowserGroup
		#Preferences_ProcedureProtoType
		;  #GADGET_Preferences_ColorPickerHistory
		#Preferences_Languages
		#Preferences_LanguageInfo
		;  #GADGET_Preferences_EnableColoring
		#Preferences_EnableBolding
		#Preferences_EnableCaseCorrection
		#Preferences_EnableLineNumbers
		;  #GADGET_Preferences_EnableMarkers
		#Preferences_ExtraWordChars
		#Preferences_ShowWhiteSpace
		#Preferences_ShowIndentGuides
		#Preferences_UseTabIndentForSplittedLines
		#Preferences_EnableBraceMatch
		#Preferences_EnableKeywordMatch
		#Preferences_SelectFont
		#Preferences_CurrentFont
		#Preferences_CharMatch1
		#Preferences_CharMatch2
		#Preferences_CharMatch3
		#Preferences_BoxWidth
		#Preferences_BoxHeight
		#Preferences_AutoPopup
		#Preferences_AddBrackets
		#Preferences_AddSpaces
		#Preferences_AddEndKeywords
		;  #GADGET_Preferences_NoComments
		;  #GADGET_Preferences_NoStrings
		#Preferences_AutoPopupLength
		#Preferences_StructureItems
		#Preferences_ModulePrefix
		#Preferences_PBOptions
		#Preferences_CodeOptions
		#Preferences_SourceOnly
		#Preferences_ProjectOnly
		#Preferences_ProjectAllFiles
		#Preferences_AllFiles
		#Preferences_ShortcutBox
		#Preferences_ShortcutList
		;#GADGET_Preferences_ShortcutControl
		;#GADGET_Preferences_ShortcutAlt
		;#GADGET_Preferences_ShortcutShift
		;#GADGET_Preferences_ShortcutCommand
		;#GADGET_Preferences_ShortcutKey
		#Preferences_SelectShortcut
		#Preferences_ShortcutSet
		#Preferences_ToolbarIconType
		#Preferences_ToolbarIconList
		#Preferences_ToolbarIconName
		#Preferences_ToolbarOpenIcon
		#Preferences_ToolbarActionType
		#Preferences_ToolbarActionList
		#Preferences_ToolbarMoveUp
		#Preferences_ToolbarMoveDown
		#Preferences_ToolbarAdd
		#Preferences_ToolbarDelete
		#Preferences_ToolbarSet
		#Preferences_ToolbarClassic
		#Preferences_ToolbarDefault
		#Preferences_ToolbarList
		#Preferences_FirstColor
		#Preferences_LastColor       = #Preferences_FirstColor + HighlightEnumColorIndices::#COLOR_Last
		#Preferences_FirstSelectColor
		#Preferences_LastSelectColor = #Preferences_FirstSelectColor + HighlightEnumColorIndices::#COLOR_Last
		#Preferences_FirstColorText
		#Preferences_LastColorText   = #Preferences_FirstColorText + HighlightEnumColorIndices::#COLOR_Last
		#Preferences_FirstColorCheck
		#Preferences_LastColorCheck  = #Preferences_FirstColorCheck + HighlightEnumColorIndices::#COLOR_Last
		#Preferences_TemplatesAskDelete
		#Preferences_FirstContainer
		#Preferences_LastContainer   = #Preferences_FirstContainer + 24
		#Preferences_ToolsPanelDelayText
		#Preferences_ToolSettingsTitle
		#Preferences_AutoPopupText
		#Preferences_Themes
		#Preferences_DefaultCompiler
		#Preferences_CompilerList
		#Preferences_AddCompiler
		#Preferences_RemoveCompiler
		#Preferences_ClearCompilers
		#Preferences_CompilerExe
		#Preferences_SelectCompiler
		#Preferences_IndentNo        ; first of option group (IndentMode value)
		#Preferences_IndentBlock
		#Preferences_IndentSensitive ; last of option group (IndentMode value)
		#Preferences_BackspaceUnindent
		#Preferences_IndentList    ; first to auto disable
		#Preferences_IndentKeyword
		#Preferences_IndentBefore
		#Preferences_IndentAfter
		#Preferences_IndentAdd
		#Preferences_IndentRemove  ; last to auto disable
		#Preferences_UseHelpToolF1
		#Preferences_FormVariable
		#Preferences_FormVariableCaption
		#Preferences_FormGrid
		#Preferences_FormEventProcedure
		#Preferences_FormGridSize
		#Preferences_FormSkin
		#Preferences_EnableHistory
		#Preferences_HistoryTimer  ; first to auto disable
		#Preferences_HistoryMaxFileSize
		#Preferences_HistoryPurgeNever
		#Preferences_HistoryPurgeByDays
		#Preferences_HistoryPurgeByDays2
		#Preferences_HistoryPurgeByCount
		#Preferences_HistoryPurgeByCount2
		#Preferences_HistoryDays
		#Preferences_HistoryCount    ; last to auto disable
		#Preferences_HistoryFile
		#Preferences_FilesPanelMultiline
		#Preferences_FilesPanelCloseButtons
		#Preferences_FilesPanelNewButton
		#Preferences_UpdateCheckInterval
		#Preferences_UpdateCheckVersions
		#Preferences_IssueList
		#Preferences_NewIssue
		#Preferences_UpdateIssue
		#Preferences_DeleteIssue
		#Preferences_IssueName  ; first in loop
		#Preferences_IssueExpr
		#Preferences_IssuePriority
		#Preferences_IssueColor
		#Preferences_SelectIssueColor
		#Preferences_IssueCodeNoColor
		#Preferences_IssueCodeBack
		#Preferences_IssueCodeLine
		#Preferences_IssueInTool
		#Preferences_IssueInBrowser ; last in loop
		#Preferences_CodeFileExtensions
		
		CompilerIf #SPIDER_BASIC
			#Preferences_WebBrowser
			#Preferences_SelectWebBrowser
			#Preferences_WebServerPort
			#Preferences_JDK
			#Preferences_SelectJDK
			#Preferences_AppleTeamID
		CompilerEndIf
		
		#FileMonitor_Text
		#FileMonitor_Reload
		#FileMonitor_Cancel
		#FileMonitor_ViewDiff
		
		#Goto_Line
		#Goto_Cancel
		#Goto_Ok
		
		#Find_FindWord
		#Find_ReplaceWord
		#Find_DoReplace
		#Find_Case
		#Find_WholeWord
		#Find_SelectionOnly
		#Find_AutoWrap
		#Find_NoComments
		#Find_NoStrings
		#Find_FindNext
		#Find_FindPrevious
		#Find_Replace
		#Find_ReplaceAll
		#Find_Close
		
		#StructureViewer_Panel
		#StructureViewer_List
		#StructureViewer_Parent
		#StructureViewer_Name
		#StructureViewer_Ok
		#StructureViewer_Cancel
		#StructureViewer_OnTop
		#StructureViewer_InsertName
		#StructureViewer_InsertStruct
		#StructureViewer_InsertCopy
		#StructureViewer_Char0
		#StructureViewer_Char27 = #StructureViewer_Char0 + 27
		
		#Grep_FindWord
		#Grep_Directory
		#Grep_SelectDirectory
		#Grep_UseCurrentDirectory
		#Grep_Pattern
		#Grep_MatchCase
		#Grep_Recurse
		#Grep_NoComments
		#Grep_NoStrings
		#Grep_WholeWord
		#Grep_Cancel
		#Grep_Stop
		#Grep_Find
		
		#GrepOutput_List
		#GrepOutput_Close
		#GrepOutput_Clear
		#GrepOutput_Current
		
		#Compiler_Text
		#Compiler_Details
		#Compiler_List
		#Compiler_Progress
		#Compiler_Abort
		
		#Option_UseMainFile
		#Option_MainFile         ; also for inputfile in project mode
		#Option_SelectMainFile
		#Option_OutputFileLabel  ; only in project mode (hidden in SpiderBasic)
		#Option_OutputFile		; only in project mode (hidden in SpiderBasic)
		#Option_SelectOutputFile	; only in project mode (hidden in SpiderBasic)
		#Option_Debugger
		#Option_Purifier
		#Option_SelectDebugger
		#Option_DebuggerMode
		#Option_SelectWarning
		#Option_WarningMode
		
		#Option_UseCompiler  ; First to be disabled/enabled in "Main file" loop
		#Option_SelectCompiler
		#Option_Optimizer
		CompilerIf #SPIDER_BASIC
			#Option_WindowTheme
			#Option_SelectWindowTheme
			#Option_GadgetTheme
			#Option_SelectGadgetTheme
			#Option_WebServerAddress
		CompilerElse
			#Option_UseIcon
			#Option_SelectIcon
			#Option_IconName
			#Option_EnableThread
			#Option_EnableXP
			#Option_EnableAdmin
			#Option_EnableUser
			#Option_DPIAware
			#Option_EnableOnError
			#Option_ExecutableFormat
			#Option_EnableASM
			#Option_CPU
			#Option_Linker
			#Option_GetLinker
		CompilerEndIf
		#Option_SubSystem
		#Option_UseCompileCount
		#Option_UseBuildCount
		#Option_UseCreateExe
		#Option_BuildCount
		#Option_CompileCount
		#Option_ConstantList
		#Option_ConstantAdd
		#Option_ConstantSet
		#Option_ConstantRemove
		#Option_ConstantClear
		#Option_ConstantLine  ; Last label to be disabled/enabled in the 'Main file' loop
		#Option_CommandLine
		#Option_CurrentDir
		#Option_SelectCurrentDir
		#Option_TemporaryExe
		#Option_ToolsList
		#Option_Ok
		#Option_Cancel
		#Option_Panel
		#Option_IncludeVersion
		#Option_VersionText0
		#Option_VersionText17 = #Option_VersionText0 + 17
		#Option_VersionValue0
		#Option_VersionValue23 = #Option_VersionValue0 + 23
		#Option_RequiredFields
		#Option_Tokens
		#Option_ResourceList
		#Option_ResourceAdd
		#Option_ResourceRemove
		#Option_ResourceClear
		#Option_ResourceFile
		#Option_ResourceSelectFile
		#Option_AddTarget
		#Option_EditTarget
		#Option_CopyTarget
		#Option_RemoveTarget
		#Option_TargetUp
		#Option_TargetDown
		#Option_TargetList
		#Option_DefaultTarget
		#Option_TargetEnabled
		#Option_DefaultTargetMenu ; not real gadgets, but needed to know the difference between gadget and popupmenu action
		#Option_TargetEnabledMenu
		#Option_OpenProject
		
		#AddTools_List ; must be the first (for loop processing)
		#AddTools_New
		#AddTools_Edit
		#AddTools_Delete
		#AddTools_Up
		#AddTools_Down
		#AddTools_OK     ; last loop processed item
		#AddTools_Cancel	; this one never gets disabled
		
		#EditTools_CommandLine
		#EditTools_ChooseCommandLine
		#EditTools_Arguments
		#EditTools_ArgumentsInfo
		#EditTools_WorkingDir
		#EditTools_ChooseWorkingDir
		#EditTools_MenuEntry
		#EditTools_Trigger
		#EditTools_Ok
		#EditTools_Cancel
		#EditTools_RunHidden  ; first for loop processing
									 ;   #GADGET_EditTools_ShortcutControl
									 ;   #GADGET_EditTools_ShortcutAlt
									 ;   #GADGET_EditTools_ShortcutShift
									 ;   #GADGET_EditTools_ShortcutCommand
									 ;   #GADGET_EditTools_ShortcutKey
		#EditTools_Shortcut
		#EditTools_HideEditor
		#EditTools_Reload
		#EditTools_ReloadNew
		#EditTools_ReloadOld
		#EditTools_WaitForQuit
		#EditTools_ConfigLine
		#EditTools_SourceSpecific
		#EditTools_HideFromMenu ; last for loop processing
		
		
		
		;   #GADGET_SortSources_List
		;   #GADGET_SortSources_MoveUp
		;   #GADGET_SortSources_MoveDown
		;   #GADGET_SortSources_OK
		;   #GADGET_SortSources_Cancel
		
		#FileViewer_Panel
		#Startup_Image
		
		#About_Ok
		#About_Image
		#About_Editor
		
		#AutoComplete_List
		#AutoComplete_Abort
		#AutoComplete_Ok
		
		;   #GADGET_CPU_Graph
		;   #GADGET_CPU_List
		;   #GADGET_CPU_OnTop
		;   #GADGET_CPU_Text
		;   #GADGET_CPU_Interval
		;   #GADGET_CPU_Set
		
		#Template_Add     ; first to auto-disable
		#Template_Edit
		#Template_Remove
		#Template_AddDir
		#Template_RemoveDir
		#Template_Up
		#Template_Down
		#Template_Tree     ; last to auto-disable
		#Template_Comment
		#Template_Frame1
		#Template_Frame2
		#Template_Editor
		#Template_SetComment
		#Template_Save
		#Template_Cancel
		#Template_Rename ; not real gadgets, but used for wrappers of the menu
		#Template_Use
		#Template_Splitter
		
		#Color_RGB     ; first handled in loop
		#Color_HSV
		#Color_HSL
		#Color_Wheel
		#Color_Palette
		#Color_Name    ; last handled in loop
		#Color_Canvas1
		#Color_Canvas2
		#Color_Canvas3
		#Color_Label1
		#Color_Label2
		#Color_Label3
		#Color_Scheme
		#Color_Scroll
		#Color_Filter
		#Color_UseAlpha
		#Color_CanvasAlpha
		#Color_Current
		#Color_Input0 ; for R, G, B, A, H, S, L, handled in loops
		#Color_Input1
		#Color_Input2
		#Color_Input3
		#Color_Input4
		#Color_Input5
		#Color_Input6
		#Color_Text0
		#Color_Text1
		#Color_Text2
		#Color_Text3
		#Color_Text4
		#Color_Text5
		#Color_Text6
		#Color_Hex
		#Color_Insert
		#Color_InsertRGB
		#Color_Save
		#Color_History
		
		#Project_Panel
		#Project_File
		#Project_FileStatic
		#Project_ChooseFile
		#Project_Name
		#Project_Comments
		#Project_SetDefault
		#Project_CloseAllFiles
		#Project_OpenLoadLast
		#Project_OpenLoadAll
		#Project_OpenLoadDefault
		#Project_OpenLoadMain
		#Project_OpenLoadNone
		#Project_AddFile
		#Project_NewFile
		#Project_OpenFile
		#Project_RemoveFile
		#Project_ViewFile
		#Project_Explorer
		#Project_ExplorerCombo
		#Project_ExplorerPattern ; not present on OSX
		#Project_FileList
		#Project_FileLoad
		#Project_FileScan
		#Project_FileWarn
		#Project_FilePanel
		#Project_Ok
		#Project_Cancel
		#Project_OpenOptions
		
		#MacroError_Scintilla
		#MacroError_Close
		
		#Warnings_List
		#Warnings_Close
		
		#Diff_Busy
		#Diff_File1
		#Diff_File2
		#Diff_Title1
		#Diff_Title2
		#Diff_Container1
		#Diff_Container2
		#Diff_Splitter
		#Diff_Splitter2
		#Diff_Files
		#Diff_FileTitle
		
		#DiffDialog_File1       ; first to process in loop
		#DiffDialog_File2
		#DiffDialog_Directory1
		#DiffDialog_Directory2
		#DiffDialog_Pattern     ; last to process in loop
		#DiffDialog_ChooseFile1
		#DiffDialog_ChooseFile2
		#DiffDialog_ChooseDirectory1
		#DiffDialog_ChooseDirectory2
		#DiffDialog_CurrentDirectory1
		#DiffDialog_CurrentDirectory2
		#DiffDialog_Recurse
		#DiffDialog_CompareFiles
		#DiffDialog_CompareDirectories
		#DiffDialog_IgnoreCase
		#DiffDialog_IgnoreSpaceAll
		#DiffDialog_IgnoreSpaceLeft
		#DiffDialog_IgnoreSpaceRight
		#DiffDialog_Cancel
		
		#History_Panel
		#History_Source
		#History_Splitter
		#History_SessionCombo
		#History_SessionTree
		#History_FileCombo
		#History_FileList
		#HistoryShutdown_Progress
		
		#Updates_Message
		#Updates_Website
		#Updates_Settings
		#Updates_Ok
		
		#Issues_List
		#Issues_Filter
		#Issues_SingleFile
		#Issues_MultiFile
		#Issues_Export
		
		; Help viewer for Linux and OSX
		#Help_Panel
		#Help_Tree
		#HELP_INDEX_
		#Help_IndexText
		#Help_SearchValue
		#Help_SearchGo
		#Help_SearchResults
		#Help_Forward
		#Help_Back
		#Help_Home
		#Help_Next
		#Help_Previous
		#Help_Viewer
		#Help_Container
		#Help_Splitter
		
		; Linux only
		#Help_Editor
		#Help_Parent
		
		CompilerIf #SPIDER_BASIC
			#WebApp_Name
			#WebApp_Icon
			#WebApp_SelectIcon
			#WebApp_HtmlFilename
			#WebApp_SelectHtmlFilename
			#WebApp_JavaScriptFilename
			#WebApp_JavaScriptPath
			#WebApp_EnableResourceDirectory
			#WebApp_ResourceDirectory
			#WebApp_CopyJavaScriptLibrary
			#WebApp_EnableDebugger
			#WebApp_SelectResourceDirectory
			#WebApp_ExportCommandLine
			#WebApp_ExportArguments
			
			#AndroidApp_Name
			#AndroidApp_Icon
			#AndroidApp_SelectIcon
			#AndroidApp_Version
			#AndroidApp_Code
			#AndroidApp_PackageID
			#AndroidApp_IAPKey
			#AndroidApp_Orientation
			#AndroidApp_FullScreen
			#AndroidApp_AutoUpload
			#AndroidApp_Output
			#AndroidApp_SelectOutput
			#AndroidApp_StartupImage
			#AndroidApp_SelectStartupImage
			#AndroidApp_EnableResourceDirectory
			#AndroidApp_ResourceDirectory
			#AndroidApp_SelectResourceDirectory
			#AndroidApp_EnableDebugger
			#AndroidApp_KeepAppDirectory
			
			#iOSApp_Name
			#iOSApp_Icon
			#iOSApp_SelectIcon
			#iOSApp_Version
			#iOSApp_PackageID
			#iOSApp_Orientation
			#iOSApp_FullScreen
			#iOSApp_AutoUpload
			#iOSApp_Output
			#iOSApp_SelectOutput
			#iOSApp_StartupImage
			#iOSApp_SelectStartupImage
			#iOSApp_EnableResourceDirectory
			#iOSApp_ResourceDirectory
			#iOSApp_SelectResourceDirectory
			#iOSApp_EnableDebugger
			#iOSApp_KeepAppDirectory
			#iOSApp_CheckInstall
			
			#App_Panel
			#App_OK
			#App_Create
			#App_Cancel
		CompilerEndIf
		
	EndEnumeration
EndDeclareModule

Module UIEnumGadgets : EndModule

DeclareModule UIEnumMenus : UseModule G
	Enumeration 0
		#New     ; first item that can have a shortcut assigned in the preferences. Must have value 0!!
		#Open
		#Save
		#SaveAs
		#SaveAll
		#Reload
		#Close
		#CloseAll
		#DiffCurrent
		#EncodingPlain
		#EncodingUtf8
		#NewlineWindows
		#NewlineLinux
		#NewlineMacOS
		;#MENU_SortSources
		
		CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
			#PreferenceNotUsed
			#EditHistory
			#ExitNotUsed
		CompilerElse
			#Preference
			#EditHistory
			#Exit
		CompilerEndIf
		
		#Undo                 ; first to AutoDisable (UpdateMenuStates())
		#Redo
		#Cut
		#Copy
		#Paste
		#PasteAsComment
		#CommentSelection
		#UnCommentSelection
		#AutoIndent
		#SelectAll
		#Goto
		#JumpToKeyword
		#LastViewedLine
		#ToggleThisFold
		#ToggleFolds
		#AddMarker
		#JumpToMarker
		#ClearMarkers
		#Find
		#FindNext
		#FindPrevious       ; last to AutoDisable
		#FindInFiles
		#Replace
		
		#NewProject
		#OpenProject
		#CloseProject
		#ProjectOptions
		#AddProjectFile
		#RemoveProjectFile
		#OpenProjectFolder
		
		; Form menu constants
		#NewForm
		#FormSwitch
		#DUPLICATE_
		#FormImageManager
		
		#CompileRun
		#RunExe
		#SyntaxCheck
		#DebuggerCompile
		#NoDebuggerCompile
		#RestartCompiler
		#CompilerOption
		#CreateExecutable
		#BuildAllTargets
		
		#Debugger
		#Stop
		#Run
		#Step
		#StepX
		#StepOver
		#StepOut
		#Kill
		#BreakPoint
		#BreakClear
		#DataBreakPoints
		#ShowLog
		#ClearLog
		#CopyLog
		#ClearErrorMarks
		#DebugOutput
		#Watchlist
		#VariableList
		#Profiler
		#History
		#Memory
		#LibraryViewer
		#DebugAsm
		#Purifier
		;#MENU_CPUMonitor
		
		#VisualDesigner
		#StructureViewer
		#FileViewer
		#VariableViewer
		#ColorPicker
		#AsciiTable
		#Explorer
		#ProcedureBrowser
		#Issues
		#ProjectPanel
		#Templates
		#Diff
		#AddTools
		
		#Help
		#UpdateCheck
		
		CompilerIf #PB_Compiler_OS = #PB_OS_MacOS
			#AboutNotUsed
		CompilerElse
			#About
		CompilerEndIf
		
		#NextOpenedFile
		#PreviousOpenedFile
		
		#ShiftCommentRight
		#ShiftCommentLeft
		
		#SelectBlock
		#DeselectBlock
		
		#MoveLinesUp
		#MoveLinesDown
		
		#DeleteLines
		#DuplicateSelection
		
		#UpperCase
		#LowerCase
		#InvertCase
		#SelectWord
		
		#ZoomIn
		#ZoomOut
		#ZoomDefault
		
		#AutoComplete
		#AutoComplete_OK ; can now have a custom shortcut too
		#AutoComplete_Abort
		
		#ProcedureListUpdate
		
		#LastShortcutItemDummy ; to avoid changing #MENU_LastShortcutItem every time
		#LastShortcutItem = #LastShortcutItemDummy-1
		
		#Form_AddItem
		#Form_EditItems
		#DeleteFormObj
		#Rename
		#RemoveColor
		#RemoveFont
		#RemoveEventFile
		#AlignLeft
		#AlignTop
		#AlignWidth
		#AlignHeight
		#Columns
		#ToolbarButton
		#ToolbarToggleButton
		#ToolbarSeparator
		#ToolbarDelete
		#ToolbarDeleteItem
		#StatusImage
		#StatusLabel
		#StatusProgressBar
		#StatusDelete
		#StatusDeleteItem
		#Menu_Item
		#Menu_Separator
		#Menu_Delete
		#Menu_DeleteItem  ; Last Item that can have a Shortcut assigned in the prefs
		
		#FileViewer_Open
		#FileViewer_Close
		#FileViewer_Next
		#FileViewer_Previous
		
		#Diff_Open1
		#Diff_Open2
		#Diff_Refresh
		#Diff_Colors
		#Diff_Swap
		#Diff_Vertical
		#Diff_HideFiles
		#Diff_ShowTool
		#Diff_Up
		#Diff_Down
		#Diff_ShowFiles ; shortcut only
		
		#RecentFiles_Start
		#RecentFiles_End    = #RecentFiles_Start + (IDEConstants::#MAX_RECENT_ITEMS * 2)
		
		#AddTools_Start
		#AddTools_End       = #AddTools_Start + IDEConstants::#MAX_TOOLS
		
		#AddHelpFiles_Start
		#AddHelpFiles_End   = #AddHelpFiles_Start + IDEConstants::#MAX_USER_LIBRARIES_HELP_FILES
		
		#DefaultTarget_Start
		#DefaultTarget_End    = #DefaultTarget_Start + IDEConstants::#MAX_MENU_PROJECT_TARGETS
		
		#BuildTarget_Start
		#BuildTarget_End    = #BuildTarget_Start + IDEConstants::#MAX_MENU_PROJECT_TARGETS
		
		
		#Help_Enter
		
		CompilerIf #PB_Compiler_OS = #PB_OS_Windows Or #PB_Compiler_OS = #PB_OS_MacOS ; to handle autocomplete in scintilla
			#Scintilla_Enter
			#Scintilla_Tab
			#Scintilla_ShiftTab
		CompilerEndIf
		
		#Template_Use
		#Template_New
		#Template_Edit
		#Template_Remove
		#Template_NewDir
		#Template_RemoveDir
		#Template_Rename
		#Template_Up
		#Template_Down
		
		#ProjectPanel_Open         ; first in Case ... To ...
		#ProjectPanel_OpenViewer
		#ProjectPanel_OpenExplorer
		#ProjectPanel_Rescan
		#ProjectPanel_Add
		#ProjectPanel_Remove       ; last in Case ... To ...
		
		#ProjectInfo_EditTarget
		#ProjectInfo_DefaultTarget
		#ProjectInfo_EnableTarget
		
		;   #MENU_TemplateEdit_Cut
		;   #MENU_TemplateEdit_Copy
		;   #MENU_TemplateEdit_Paste
		;   #MENU_TemplateEdit_SelectAll
		
		#MacroError_Close
		#Warnings_Close
		
		CompilerIf #DEBUG
			#Debugging
		CompilerEndIf
		
		CompilerIf #CompileMacCocoa
			#AutocompleteUp   ; keyboard shortcuts for the autocomplete window on Cocoa
			#AutocompleteDown
			#AutocompleteEscape
		CompilerEndIf
		
		; For the "Space" option in the Toolbar, we add an empty icon.
		; however, for the DisableToolBarButton() to work, each "space button" requires its own
		; unique ID. So the IDs after this one are used for that.
		;
		#FirstUnused
		
		; Menu entries used by the FilesPanel menu
		;
		#FirstOpenFile = #FirstUnused + 1000
	EndEnumeration
	
	
	CompilerIf #CompileMac
		; Warning, these are negative values
		#Preference = #PB_Menu_Preferences
		#Exit  = #PB_Menu_Quit
		#About = #PB_Menu_About
	CompilerEndIf
EndDeclareModule

Module UIEnumMenus : EndModule

DeclareModule UIEnumFonts
	Enumeration 1 ; 0 is reserved for uninitialized #PB_Any objects
		#Editor
		#Editor_Bold
		#Preferences_CurrentFont
		#ToolsPanel
		#DebugOut
		
		CompilerIf #CompileWindows
			#ToolsPanelFake
		CompilerEndIf
		
		CompilerIf #PB_Compiler_OS = #PB_OS_Linux
			#Help_Text
			#Help_Title
			#Help_Bold
			#Help_Example
		CompilerEndIf
	EndEnumeration
EndDeclareModule

Module UIEnumFonts : EndModule

DeclareModule UIEnumDragDrop
	Enumeration
		;#DRAG_Profiler = 0  - reserved for debugger
		#DRAG_SortSources = 1
		#DRAG_Preferences_Toolbar
		#DRAG_Preferences_ToolsFromAvailable
		#DRAG_Preferences_ToolsFromUsed
		#DRAG_AddTools
		#DRAG_Templates
	EndEnumeration
EndDeclareModule

Module UIEnumDragDrop : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1152
; FirstLine = 1097
; Folding = -----
; Optimizer
; EnableXP
; DPIAware