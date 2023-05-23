; Change: Now *every* file in the source tree is included from this main file
; This will reduce the number of XIncludeFile's in each file, and there is no more need to check dependencies.
; Even platform specific files are always included. Whether their code is compiled
; is decided in each file.

XIncludeFile "global.pb"

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	XIncludeFile "empire\empire.pb"
	XIncludeFile "util\error_codes.pb"
	XIncludeFile "util\crc32.pb"
	XIncludeFile "util\macros.pb"
	XIncludeFile "util\dialogs_util.pb"
	
	XIncludeFile "__unsorted__.pb"
	
	;- Windows ENUMS
	XIncludeFile "pb_analyzer\token_types.pb"
	XIncludeFile "fs\enums.pb"
	XIncludeFile "highlight\enums.pb"
	XIncludeFile "history\enums.pb"
	XIncludeFile "ide\ide_constants.pb"
	XIncludeFile "ide\autocomplete\autocomplete_items.pb"
	XIncludeFile "ide\source\source_types.pb"
	XIncludeFile "ide\theme\theme_constants.pb"
	XIncludeFile "ide\tools\enums.pb"
	XIncludeFile "xml\enums.pb"
	XIncludeFile "ide\ide_enums.pb"

	; -> should be after most of the constants imports because it uses other constants defined elsewhere
	XIncludeFile "images\enums.pb"
	XIncludeFile "ui\enums.pb"
	
	XIncludeFile "fs\pbfs.pb"
	XIncludeFile "fs\zip.pb"
	
	XIncludeFile "ide\state.pb"
	XIncludeFile "ide\resources.pb"
	XIncludeFile "ide\settings.pb"

	XIncludeFile "ide\scintilla_impl\ide_sci_constants.pb"
	
	XIncludeFile "pb_analyzer\token.pb"
	XIncludeFile "pb_analyzer\parser.pb"
	XIncludeFile "pb_analyzer\procedure_info.pb"
	
	XIncludeFile "ide\colors.pb"
	
	XIncludeFile "ide\selection.pb"
	XIncludeFile "ide\timers.pb"
	XIncludeFile "ide\regexes.pb"
	XIncludeFile "ide\tools\tools.pb"
	
	XIncludeFile "pb_compiler\compiler_constants.pb"
	XIncludeFile "pb_compiler\compiler_structs.pb"
	XIncludeFile "pb_compiler\compiler_util.pb"
	XIncludeFile "pb_compiler\build.pb"
	
	XIncludeFile "ide\source\source.pb"
	XIncludeFile "ide\source\project.pb"
	
	;- IDE BUNDLED TOOLS
	XIncludeFile "ide\updater\updater.pb"
	XIncludeFile "ide\issues_viewer.pb"
	XIncludeFile "ide\diff.pb"
	XIncludeFile "ide\debugger\debugger.pb"
	
	XIncludeFile "pb_compiler\command_line_build.pb"
	
	XIncludeFile "ui\toolbar.pb"
	XIncludeFile "ui\statusbar.pb"
	XIncludeFile "ui\menu.pb"
	
	XIncludeFile "ide\args.pb"
	
	;- APIs
	XIncludeFile "api\tool_api.pb"
	XIncludeFile "api\dialog_window_api.pb"
CompilerElse
	XIncludeFile "empire/empire.pb"
	XIncludeFile "util/error_codes.pb"
	XIncludeFile "util/crc32.pb"
	XIncludeFile "util/macros.pb"
	XIncludeFile "util/dialogs_util.pb"
	
	XIncludeFile "__unsorted__.pb"
	
	;- ENUMS
	XIncludeFile "pb_analyzer/token_types.pb"
	XIncludeFile "fs/enums.pb"
	XIncludeFile "highlight/enums.pb"
	XIncludeFile "history/enums.pb"
	XIncludeFile "ide/ide_constants.pb"
	XIncludeFile "ide/autocomplete/autocomplete_items.pb"
	XIncludeFile "ide/source/source_types.pb"
	XIncludeFile "ide/theme/theme_constants.pb"
	XIncludeFile "ide/tools/enums.pb"
	XIncludeFile "xml/enums.pb"
	XIncludeFile "ide/ide_enums.pb"
	
	; -> should be after most of the constants imports because it uses other constants defined elsewhere
	XIncludeFile "images/enums.pb"
	XIncludeFile "ui/enums.pb"
	
	XIncludeFile "fs/pbfs.pb"
	XIncludeFile "fs/zip.pb"
	
	XIncludeFile "ide/state.pb"
	XIncludeFile "ide/resources.pb"
	XIncludeFile "ide/settings.pb"
	
	XIncludeFile "ide/scintilla_impl/ide_sci_constants.pb"
	
	XIncludeFile "pb_analyzer/procedure_info.pb"
	XIncludeFile "pb_analyzer/token.pb"
	XIncludeFile "pb_analyzer/parser.pb"
	
	XIncludeFile "ide/colors.pb"
	
	XIncludeFile "ide/selection.pb"
	XIncludeFile "ide/timers.pb"
	XIncludeFile "ide/regexes.pb"
	XIncludeFile "ide/tools/tools.pb"
	
	XIncludeFile "pb_compiler/compiler_constants.pb"
	XIncludeFile "pb_compiler/compiler_structs.pb"
	XIncludeFile "pb_compiler/compiler_util.pb"
	XIncludeFile "pb_compiler/build.pb"
	
	XIncludeFile "ide/source/source.pb"
	XIncludeFile "ide/source/project.pb"
	
	;- IDE BUNDLED TOOLS
	XIncludeFile "ide/updater/updater.pb"
	XIncludeFile "ide/issues_viewer.pb"
	XIncludeFile "ide/diff.pb"
	XIncludeFile "ide/debugger/debugger.pb"
	
	XIncludeFile "pb_compiler/command_line_build.pb"
	
	XIncludeFile "ui/toolbar.pb"
	XIncludeFile "ui/statusbar.pb"
	XIncludeFile "ui/menu.pb"
	
	XIncludeFile "ide/args.pb"
	
	;- APIs
	XIncludeFile "api/tool_api.pb"
	XIncludeFile "api/dialog_window_api.pb"
CompilerEndIf

; CompilerIf #PB_Compiler_OS = #PB_OS_Windows
; 	XIncludeFile "..\CompilerFlags.pb"
; CompilerElse
; 	XIncludeFile "../CompilerFlags.pb"
; CompilerEndIf

; XIncludeFile ".." + Path::#SEPARATOR + "Build/BuildInfo.pb"
; TODO: temporary:
#BUILDINFO_User = "roger gaston"
#BUILDINFO_Branch = "branche"
#BUILDINFO_Revision = "revision"
#BUILDINFO_Version = "123"
; TODO: end of temporary

XIncludeFile ".." + Path::#SEPARATOR + ".." + Path::#SEPARATOR + "DialogManager" + Path::#SEPARATOR + "Common.pb" ; must be before Common.pb
XIncludeFile ".." + Path::#SEPARATOR + "Common.pb"                                                    ; must be before DebuggerCommon.pb
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "DebuggerCommon.pb"                  ; must be before Declarations.pb
XIncludeFile ".." + Path::#SEPARATOR + "Declarations.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Macro.pb"
;XIncludeFile ".." + Path::#SEPARATOR + ".." + Path::#SEPARATOR + "PureBasicConfigPath.pb" ; for the config directory
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/declare.pb"
; must be here to affect all OpenWindow() calls with a macro
XIncludeFile ".." + Path::#SEPARATOR + "LinuxWindowIcon.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ZLib.pb"

; include the TabBarGadget. Note: It has an EnableExplicit inside
XIncludeFile ".." + Path::#SEPARATOR + "TabBarGadget.pbi"
DisableExplicit

; dialog manager
; We need the explorer and scintilla support for it (for Templates window and Projects)
#DIALOG_USE_SCINTILLA = 1
#DIALOG_USE_EXPLORER  = 1

IncludePath ".." + Path::#SEPARATOR + ".." + Path::#SEPARATOR + "DialogManager" + Path::#SEPARATOR ; so that the dialog manager files are found
XIncludeFile "DialogManager.pb"
IncludePath ""

; debugging functions and macros (mostly active in debug mode only)
XIncludeFile ".." + Path::#SEPARATOR + "WindowsDebugging.pb"
XIncludeFile ".." + Path::#SEPARATOR + "LinuxDebugging.pb"

; should be before the debugger files, as they need some of this
XIncludeFile ".." + Path::#SEPARATOR + "WindowsExtensions.pb"
XIncludeFile ".." + Path::#SEPARATOR + "LinuxExtensions.pb"
XIncludeFile ".." + Path::#SEPARATOR + "MacExtensions.pb"

; debugger external files
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Misc.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "VariableGadget.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Communication_PipeWindows.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Communication_PipeUnix.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Communication.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "DebugOutput.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "AsmDebug.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "MemoryViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "VariableDebug.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "History.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "WatchList.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "DataBreakPoints.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Profiler.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "LibraryViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Purifier.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "DebuggerGUI.pb"


; Plugins for the LibraryViewer
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Plugin_Image.pb"
XIncludeFile ".." + Path::#SEPARATOR + #DEFAULT_DebuggerSource + "Plugin_Xml.pb"


; debugger ide-files
XIncludeFile ".." + Path::#SEPARATOR + "IDEDebugger.pb"

XIncludeFile ".." + Path::#SEPARATOR + "CompilerInterface.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Language.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ZipManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ToolbarManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ThemeManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "HighlightingEngine.pb"
XIncludeFile ".." + Path::#SEPARATOR + "HighlightingFunctions.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ShortcutManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ProjectManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/grid.pbi"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/undoredo.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/helpingfunctions.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/gadgetitemswindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/imageslistwindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/splitterwindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/codeviewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/mainevents.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/copypaste.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/opensave.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/mainwindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FormDesigner/FormManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "SourceManagement.pb"
XIncludeFile ".." + Path::#SEPARATOR + "SourceParser.pb"
XIncludeFile ".." + Path::#SEPARATOR + "UserInterface.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Misc.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FileSystem.pb"
XIncludeFile ".." + Path::#SEPARATOR + "IDEMisc.pb"
XIncludeFile ".." + Path::#SEPARATOR + "RecentFiles.pb"
XIncludeFile ".." + Path::#SEPARATOR + "AddTools.pb"
XIncludeFile ".." + Path::#SEPARATOR + "AboutWindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FileViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "GotoWindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "StructureViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "StructureFunctions.pb"
XIncludeFile ".." + Path::#SEPARATOR + "FindWindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "GrepWindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "CompilerWindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "CompilerWarnings.pb"
XIncludeFile ".." + Path::#SEPARATOR + "CompilerOptions.pb"
XIncludeFile ".." + Path::#SEPARATOR + "AddHelpFiles.pb"
XIncludeFile ".." + Path::#SEPARATOR + "AutoComplete.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Preferences.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Preferences.pb"
XIncludeFile ".." + Path::#SEPARATOR + "StandaloneDebuggerControl.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ErrorHandler.pb"
;XIncludeFile ".." + Path::#SEPARATOR + "Commandline.pb"
XIncludeFile ".." + Path::#SEPARATOR + "DiffAlgorithm.pb"
XIncludeFile ".." + Path::#SEPARATOR + "DiffWindow.pb"
XIncludeFile ".." + Path::#SEPARATOR + "LinuxHelp.pb"
XIncludeFile ".." + Path::#SEPARATOR + "EditHistory.pb"
XIncludeFile ".." + Path::#SEPARATOR + "UpdateCheck.pb"

CompilerIf #SpiderBasic
  XIncludeFile ".." + Path::#SEPARATOR + "CreateApp.pb"
CompilerEndIf

; compiled dialogs
XIncludeFile ".." + Path::#SEPARATOR + "Build/Find.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Grep.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Diff.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Goto.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/AddTools.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/About.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Preferences.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Templates.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/StructureViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Projects.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Build.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/FileMonitor.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/History.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/HistoryShutdown.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Build/Updates.pb"

CompilerIf #SpiderBasic
  XIncludeFile ".." + Path::#SEPARATOR + "Build/CreateApp.pb"
CompilerEndIf

IncludeFile ".." + Path::#SEPARATOR + "Build/CompilerOptions.pb"
#IDE_ProjectCompilerOptions = 1
IncludeFile ".." + Path::#SEPARATOR + "Build/CompilerOptions.pb"


; toolspanel plugins
XIncludeFile ".." + Path::#SEPARATOR + "AsciiTable.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Explorer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ProjectPanel.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ColorPicker.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ProcedureBrowser.pb"
XIncludeFile ".." + Path::#SEPARATOR + "VariableViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "HelpTool.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Issues.pb"

; windows specific
XIncludeFile ".." + Path::#SEPARATOR + "WindowsMisc.pb"
XIncludeFile ".." + Path::#SEPARATOR + "WindowsHelp.pb"

; linux specific
XIncludeFile ".." + Path::#SEPARATOR + "LinuxMisc.pb"
XIncludeFile ".." + Path::#SEPARATOR + "HelpViewer.pb"

; macos specific
XIncludeFile ".." + Path::#SEPARATOR + "MacMisc.pb"

; highlighting files
XIncludeFile ".." + Path::#SEPARATOR + "ScintillaHighlighting.pb"
XIncludeFile ".." + Path::#SEPARATOR + "CodeViewer.pb"
XIncludeFile ".." + Path::#SEPARATOR + "DisplayMacroError.pb"
XIncludeFile ".." + Path::#SEPARATOR + "Templates.pb"
XIncludeFile ".." + Path::#SEPARATOR + "ToolsPanel.pb"

; crossplatform debugging helpers
XIncludeFile ".." + Path::#SEPARATOR + "Debugging.pb"
