; Change: Now *every* file in the source tree is included from this main file
; This will reduce the number of XIncludeFile's in each file, and there is no more need to check dependencies.
; Even platform specific files are always included. Whether their code is compiled
; is decided in each file.

XIncludeFile "global.pb"

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	;- Windows ENUMS
	XIncludeFile "fs\enums.pb"
	XIncludeFile "highlight\enums.pb"
	XIncludeFile "history\enums.pb"
	XIncludeFile "images\enums.pb"
	XIncludeFile "ui\enums.pb"
	XIncludeFile "xml\enums.pb"
	
	XIncludeFile "ide\timers.pb"
	XIncludeFile "ide\regexes.pb"
CompilerElse
	;- ENUMS
	XIncludeFile "fs/enums.pb"
	XIncludeFile "highlight/enums.pb"
	XIncludeFile "history/enums.pb"
	XIncludeFile "images/enums.pb"
	XIncludeFile "ui/enums.pb"
	XIncludeFile "xml/enums.pb"
	
	XIncludeFile "ide/timers.pb"
	XIncludeFile "ide/regexes.pb"
CompilerEndIf

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	XIncludeFile "..\CompilerFlags.pb"
CompilerElse
	XIncludeFile "../CompilerFlags.pb"
CompilerEndIf

XIncludeFile ".." + #Separator + "Build/BuildInfo.pb"
XIncludeFile ".." + #Separator + ".." + #Separator + "DialogManager" + #Separator + "Common.pb" ; must be before Common.pb
XIncludeFile ".." + #Separator + "Common.pb"                                                    ; must be before DebuggerCommon.pb
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "DebuggerCommon.pb"                  ; must be before Declarations.pb
XIncludeFile ".." + #Separator + "Declarations.pb"
XIncludeFile ".." + #Separator + "Macro.pb"
XIncludeFile ".." + #Separator + ".." + #Separator + "PureBasicConfigPath.pb" ; for the config directory
XIncludeFile ".." + #Separator + "FormDesigner/declare.pb"
; must be here to affect all OpenWindow() calls with a macro
XIncludeFile ".." + #Separator + "LinuxWindowIcon.pb"
XIncludeFile ".." + #Separator + "ZLib.pb"

; include the TabBarGadget. Note: It has an EnableExplicit inside
XIncludeFile ".." + #Separator + "TabBarGadget.pbi"
DisableExplicit

; dialog manager
; We need the explorer and scintilla support for it (for Templates window and Projects)
#DIALOG_USE_SCINTILLA = 1
#DIALOG_USE_EXPLORER  = 1

IncludePath ".." + #Separator + ".." + #Separator + "DialogManager" + #Separator ; so that the dialog manager files are found
XIncludeFile "DialogManager.pb"
IncludePath ""

; debugging functions and macros (mostly active in debug mode only)
XIncludeFile ".." + #Separator + "WindowsDebugging.pb"
XIncludeFile ".." + #Separator + "LinuxDebugging.pb"

; should be before the debugger files, as they need some of this
XIncludeFile ".." + #Separator + "WindowsExtensions.pb"
XIncludeFile ".." + #Separator + "LinuxExtensions.pb"
XIncludeFile ".." + #Separator + "MacExtensions.pb"

; debugger external files
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Misc.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "VariableGadget.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Communication_PipeWindows.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Communication_PipeUnix.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Communication.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "DebugOutput.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "AsmDebug.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "MemoryViewer.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "VariableDebug.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "History.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "WatchList.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "DataBreakPoints.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Profiler.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "LibraryViewer.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Purifier.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "DebuggerGUI.pb"


; Plugins for the LibraryViewer
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Plugin_Image.pb"
XIncludeFile ".." + #Separator + #DEFAULT_DebuggerSource + "Plugin_Xml.pb"


; debugger ide-files
XIncludeFile ".." + #Separator + "IDEDebugger.pb"

XIncludeFile ".." + #Separator + "CompilerInterface.pb"
XIncludeFile ".." + #Separator + "Language.pb"
XIncludeFile ".." + #Separator + "ZipManagement.pb"
XIncludeFile ".." + #Separator + "ToolbarManagement.pb"
XIncludeFile ".." + #Separator + "ThemeManagement.pb"
XIncludeFile ".." + #Separator + "HighlightingEngine.pb"
XIncludeFile ".." + #Separator + "HighlightingFunctions.pb"
XIncludeFile ".." + #Separator + "ShortcutManagement.pb"
XIncludeFile ".." + #Separator + "ProjectManagement.pb"
XIncludeFile ".." + #Separator + "FormDesigner/grid.pbi"
XIncludeFile ".." + #Separator + "FormDesigner/undoredo.pb"
XIncludeFile ".." + #Separator + "FormDesigner/helpingfunctions.pb"
XIncludeFile ".." + #Separator + "FormDesigner/gadgetitemswindow.pb"
XIncludeFile ".." + #Separator + "FormDesigner/imageslistwindow.pb"
XIncludeFile ".." + #Separator + "FormDesigner/splitterwindow.pb"
XIncludeFile ".." + #Separator + "FormDesigner/codeviewer.pb"
XIncludeFile ".." + #Separator + "FormDesigner/mainevents.pb"
XIncludeFile ".." + #Separator + "FormDesigner/copypaste.pb"
XIncludeFile ".." + #Separator + "FormDesigner/opensave.pb"
XIncludeFile ".." + #Separator + "FormDesigner/mainwindow.pb"
XIncludeFile ".." + #Separator + "FormDesigner/FormManagement.pb"
XIncludeFile ".." + #Separator + "SourceManagement.pb"
XIncludeFile ".." + #Separator + "SourceParser.pb"
XIncludeFile ".." + #Separator + "UserInterface.pb"
XIncludeFile ".." + #Separator + "Misc.pb"
XIncludeFile ".." + #Separator + "FileSystem.pb"
XIncludeFile ".." + #Separator + "IDEMisc.pb"
XIncludeFile ".." + #Separator + "RecentFiles.pb"
XIncludeFile ".." + #Separator + "AddTools.pb"
XIncludeFile ".." + #Separator + "AboutWindow.pb"
XIncludeFile ".." + #Separator + "FileViewer.pb"
XIncludeFile ".." + #Separator + "GotoWindow.pb"
XIncludeFile ".." + #Separator + "StructureViewer.pb"
XIncludeFile ".." + #Separator + "StructureFunctions.pb"
XIncludeFile ".." + #Separator + "FindWindow.pb"
XIncludeFile ".." + #Separator + "GrepWindow.pb"
XIncludeFile ".." + #Separator + "CompilerWindow.pb"
XIncludeFile ".." + #Separator + "CompilerWarnings.pb"
XIncludeFile ".." + #Separator + "CompilerOptions.pb"
XIncludeFile ".." + #Separator + "AddHelpFiles.pb"
XIncludeFile ".." + #Separator + "AutoComplete.pb"
XIncludeFile ".." + #Separator + "Preferences.pb"
XIncludeFile ".." + #Separator + "Preferences.pb"
XIncludeFile ".." + #Separator + "StandaloneDebuggerControl.pb"
XIncludeFile ".." + #Separator + "ErrorHandler.pb"
XIncludeFile ".." + #Separator + "Commandline.pb"
XIncludeFile ".." + #Separator + "DiffAlgorithm.pb"
XIncludeFile ".." + #Separator + "DiffWindow.pb"
XIncludeFile ".." + #Separator + "LinuxHelp.pb"
XIncludeFile ".." + #Separator + "EditHistory.pb"
XIncludeFile ".." + #Separator + "UpdateCheck.pb"

CompilerIf #SpiderBasic
  XIncludeFile ".." + #Separator + "CreateApp.pb"
CompilerEndIf

; compiled dialogs
XIncludeFile ".." + #Separator + "Build/Find.pb"
XIncludeFile ".." + #Separator + "Build/Grep.pb"
XIncludeFile ".." + #Separator + "Build/Diff.pb"
XIncludeFile ".." + #Separator + "Build/Goto.pb"
XIncludeFile ".." + #Separator + "Build/AddTools.pb"
XIncludeFile ".." + #Separator + "Build/About.pb"
XIncludeFile ".." + #Separator + "Build/Preferences.pb"
XIncludeFile ".." + #Separator + "Build/Templates.pb"
XIncludeFile ".." + #Separator + "Build/StructureViewer.pb"
XIncludeFile ".." + #Separator + "Build/Projects.pb"
XIncludeFile ".." + #Separator + "Build/Build.pb"
XIncludeFile ".." + #Separator + "Build/FileMonitor.pb"
XIncludeFile ".." + #Separator + "Build/History.pb"
XIncludeFile ".." + #Separator + "Build/HistoryShutdown.pb"
XIncludeFile ".." + #Separator + "Build/Updates.pb"

CompilerIf #SpiderBasic
  XIncludeFile ".." + #Separator + "Build/CreateApp.pb"
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 27
; Folding = -
; Optimizer
; EnableXP
; DPIAware