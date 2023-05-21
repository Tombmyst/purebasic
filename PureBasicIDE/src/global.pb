; Cannot use yet the following 2 macros:
; 	The auto-complete won't work! So for now, usemodule g
Macro GDefModule(name)
	DeclareModule name : UseModule G
EndMacro

Macro GModule(name)
	Module name : UseModule G
EndMacro
	

; indicates that we are compiling IDE
; used for portable code like the HighlightingEngine.or the FormDesigner
;
#PUREBASIC_IDE = 1

UseMD5Fingerprint()
UseCRC32Fingerprint()
UsePNGImageDecoder()

DeclareModule G
	Macro false : 0 : EndMacro
	Macro true : 1 : EndMacro
	Macro null : 0 : EndMacro
	Macro boolean : b : EndMacro
	Macro __PROC__ : #PB_Compiler_Procedure : EndMacro
	Macro __MODULE__ : #PB_Compiler_Module : EndMacro
	Macro __FILE__ : #PB_Compiler_File : EndMacro
	Macro __LINE__ : #PB_Compiler_Line : EndMacro
		
	Macro __LOG__ : #PB_Compiler_File, #PB_Compiler_Module, #PB_Compiler_Procedure, #PB_Compiler_Line : EndMacro
		
; 	Macro __IS_TESTING__
; 		Defined(__TEST__, #PB_Constant)
; 	EndMacro
	
	CompilerIf #PB_Compiler_OS = #PB_OS_Windows
		IncludeFile "empire\snippets\os_macros.pbi"
	CompilerElse
		IncludeFile "empire/snippets/os_macros.pbi"
	CompilerEndIf
	
	CompilerIf #PB_Compiler_Unicode
		#CHARSIZE = 2
	CompilerElse
		#CHARSIZE = 1
	CompilerEndIf
	
	Macro DQ
		"
	EndMacro
	
	;- Constants
	CompilerIf Defined(DEMO, #PB_Constant) = false
		#DEMO = 0
	CompilerEndIf
	
	CompilerIf Defined(GTKVersion, #PB_Constant) = false
		#GTKVersion = 2 ; gtk2 is our default now...
	CompilerEndIf
	
	CompilerIf Defined(Debug, #PB_Constant) = false
		#DEBUG = false
	CompilerElse
		#DEBUG = true
	CompilerEndIf
	
	CompilerIf Not Defined(SpiderBasic, #PB_Constant)
		#SPIDER_BASIC = false
	CompilerElse
		#SPIDER_BASIC = true
	CompilerEndIf
	
	;- Product info
	CompilerIf #SPIDER_BASIC
		#ProductName$ = "SpiderBasic"
		#ProductWebSite$ = "https://www.spiderbasic.com"
		#ProjectFileNamespace$ = "http://www.purebasic.com/namespace" ; SBP uses PBP namespace
		#UpdateCheckNamespace$ = "http://www.spiderbasic.com/namespace"
		
		#SourceFileExtension  = ".sb"
		#IncludeFileExtension = ".sbi"
		#ProjectFileExtension = ".sbp"
		#FormFileExtension    = ".sbf"
		
		#CatalogFileIDE = "SB_IDE"
		
		Enumeration
			#AppFormatWeb
			#AppFormatiOS
			#AppFormatAndroid
		EndEnumeration
	CompilerElse
		#ProductName$ = "PureBasic"
		#ProductWebSite$ = "https://www.purebasic.com"
		#ProjectFileNamespace$ = "http://www.purebasic.com/namespace"
		#UpdateCheckNamespace$ = "http://www.purebasic.com/namespace"
		
		#SourceFileExtension  = ".pb"
		#IncludeFileExtension = ".pbi"
		#ProjectFileExtension = ".pbp"
		#FormFileExtension    = ".pbf"
		
		#CatalogFileIDE = "PB_IDE"
	CompilerEndIf
	
	;- Limitations:
	;
	#MAX_AddTools           = 100  ; reserves Menu entries
	#MAX_RecentFiles        = 100  ; reserves Menu entries (also for recent projects)
	#MAX_AddHelp            = 100  ; reserves Menu entries
	#MAX_FindHistory        = 100  ; Allocates the Findhistory arrays
	#MAX_MarkersPerFile     = 100  ; allocates the static array in the SourceFile structure
								   ;#MAX_ColorPickerHistory = 30   ; allocates the colorpicker array
	#MAX_ToolbarButtons     = 50   ; allocates static arrays in ToolbarInfo structure
	#MAX_FoldWords          = 100  ; allocates FoldStart, FoldEnd arrays
								   ;#MAX_CPUColors          = 50   ; max number of colors for CPU Monitor
	#MAX_ErrorLog           = 256  ; max number of saved loglines (allocated in SourceFile structure)
	#MAX_LineHistory        = 20   ; max number of remembered line positions (allocated in SourceFile structure) a much greater number does not make sense, as by editing the code, the lines change anyways
	#MAX_Constants          = 32   ; allocates entries in SourceFile structure (use a 2^x number to align the structure (uses byte array))
	#MAX_EpressionHistory   = 30   ; size of the history in the DebugOutput
	#MAX_ThemePreview       = 17   ; Number of icons displayed in theme preview (allocated static image numbers)
	#MAX_ConfigLines        = 300  ; Max lines of config stuff an the source end (allocates global array)
	#MAX_ResourceFiles      = 20   ; Max number of resource files (allocated in CompileTarget structure) DEPRECATED: use CompilerConstants::#MAX_RESOURCE_FILES
	#MAX_MenuTargets        = 100  ; Max number of project targets that can be shown in the menu (reserves menu entries)

	
	Global DefaultEditorFontName$  ; TODO: remove
								   ; OS specific switches
								   ;
	CompilerSelect #PB_Compiler_OS
		CompilerCase #PB_OS_Windows ;- Windows specific switch
; 			#CompileWindows   = true	; this is for the lazy guys :)
; 			#CompileLinux     = false
; 			#CompileMac       = false
			#CompileMacCocoa  = false
			#CompileMacCarbon = false
			#CompileLinuxGtk1 = false  ; to directly check for linux + gtk version, which is often needed
			#CompileLinuxGtk2 = false
			
			#OS_PureBasic = "Windows"  ; TODO: move to os_util
			
			; TODO: move all the following out of global except #CompileXXXXXX
			#Separator = "\"
			#NewLine   = Chr(13) + Chr(10)
			#NewLineLength = 2
			#PATH_CaseInSensitive = true  ; are filenames case sensitive?
			
			
			; Platform specific default values:
			;
			#DEFAULT_BigButtons         = false   ; 1 if all buttons MUST be 25px high.
			#DEFAULT_SplitterWidth      = 4
			
			#DEFAULT_DebuggerSource     = "..\PureBasicDebugger\"
			#DEFAULT_DebuggerStayOnTop  = true  ; these are different, because stayontop doesn't work on linux
			#DEFAULT_DebuggerBringToTop = false
			
			#DEFAULT_ListIconImageSize  = 16 ; on windows 16x16 is required to even display!
			#DEFAULT_ListIconImageOffset= 2	 ; place to put the real 12x12 image
			
			#DEFAULT_VisualDesigner     = "Visual Designer.exe"
			#DEFAULT_CatalogPath        = "Catalogs\"
			#DEFAILT_LibraryViewerPlugin= "Debugger\"
			#DEFAULT_ThemePath          = "Themes\"
			
			#DEFAULT_HelpPath           = "Help\"
			
			If OSVersion() < #PB_OS_Windows_Vista
				DefaultEditorFontName$     = "Courier"
			Else
				DefaultEditorFontName$     = "Consolas" ; More modern than "Courier" on new Windows
			EndIf
			
			#DEFAULT_EditorFontSize     = 10
			
			#DEFAULT_FunctionFile       = "PBFunctionListing.txt"  ; related to Temp$ path
			#DEFAULT_ApiFile            = "Compilers\APIFunctionListing.txt" ; related to PB path
			#DEFAULT_NewLineType        = 0									 ; crlf
			#DEFAULT_DLLExtension       = "dll"
			
			#DEFAULT_ImageBorder        = 0 ; for colorpicker
			
			#DEFAULT_CanWindowStayOnTop = 1 ; is the StayOnTop function implemented? (on gtk1 it isn't)
			
			#DEFAULT_PreferencesTreeWidth = 180 ; with of tree gadget in prefs
			
			#FLAG_Warning               = #MB_ICONWARNING
			#FLAG_Error                 = #MB_ICONERROR
			#FLAG_Question              = #MB_ICONQUESTION
			#FLAG_Info                  = #MB_ICONINFORMATION
			
			
			#PB_MessageRequester_ResultOk = 1
			
		CompilerCase #PB_OS_Linux ;- Linux
; 			#CompileWindows   = false
; 			#CompileLinux     = true
; 			#CompileMac       = false
			#CompileMacCocoa  = false
			#CompileMacCarbon = false
			
			#CompileLinuxGtk2 = true
			
			#OS_PureBasic = "Linux"
			
			#Separator     = "/"
			#NewLine       = Chr(10)
			#NewLineLength = 1
			#PATH_CaseInSensitive = false  ; are filenames case sensitive?
			
			; Platform specific default values:
			;
			#DEFAULT_DebuggerSource     = "../PureBasicDebugger/"
			#DEFAULT_DebuggerStayOnTop  = true
			#DEFAULT_DebuggerBringToTop = true
			
			#DEFAULT_ListIconImageSize  = 12 ; 12x12 looks better on linux
			#DEFAULT_ListIconImageOffset= 0	 ; place to put the real 12x12 image
			
			#DEFAULT_VisualDesigner     = ""     ; will remove the VD entry from the menu
			#DEFAULT_CatalogPath        = "catalogs/"
			#DEFAULT_HelpPath           = "help/"
			#DEFAILT_LibraryViewerPlugin= "debugger/"
			#DEFAULT_ThemePath          = "themes/"
			
			DefaultEditorFontName$      = "Monospace" ; "Misc Fixed" doesn't seems to exists anymore on modern distro
			#DEFAULT_SplitterWidth      = 6
			#DEFAULT_EditorFontSize     = 10
			
			#DEFAULT_FunctionFile       = "pbfunctions.txt"  ; related to Temp$ path
			#DEFAULT_ApiFile            = "compilers/apifunctions.txt" ; related to PB path
			
			#DEFAULT_NewLineType        = 1 ; lf
			#DEFAULT_DLLExtension       = "so"
			
			#DEFAULT_ImageBorder        = 0 ; for colorpicker
			
			#DEFAULT_CanWindowStayOnTop = true
			#DEFAULT_BigButtons         = true
			
			#DEFAULT_PreferencesTreeWidth = 300 ; Linux has bigger fonts, so increase this size
			
			#FLAG_Warning = 0                ; on Windows: #MB_ICONWARNING
			#FLAG_Error = 0					 ; on Windows: #MB_ICONERROR
			#FLAG_Question = 0				 ; on Windows: #MB_ICONQUESTION
			#FLAG_Info = 0					 ; on windows: #MB_ICONINFORMATION
			
			#PB_MessageRequester_ResultOk = 6
			
		CompilerCase #PB_OS_MacOS ;- MacOS
; 			#CompileWindows   = false
; 			#CompileLinux     = false
			#CompileLinuxGtk1 = false  ; to directly check for linux + gtk version, which is often needed
			#CompileLinuxGtk2 = false
			
; 			#CompileMac       = true
			
			CompilerIf Subsystem("carbon")
				#CompileMacCocoa  = false
				#CompileMacCarbon = true
			CompilerElse
				#CompileMacCocoa  = true
				#CompileMacCarbon = false
			CompilerEndIf
			
			#OS_PureBasic = "MacOSX"
			
			#Separator     = "/"
			#NewLine       = Chr(10) ; use unix style newline here too now
			#NewLineLength = 1
			#PATH_CaseInSensitive = 1  ; are filenames case sensitive?
			
			; Platform specific default values:
			;
			#DEFAULT_BigButtons         = false
			#DEFAULT_SplitterWidth      = 4
			
			#DEFAULT_DebuggerSource     = "../PureBasicDebugger/"
			#DEFAULT_DebuggerStayOnTop  = true
			#DEFAULT_DebuggerBringToTop = true
			
			#DEFAULT_ListIconImageSize  = 12 ; 12x12 looks better on linux
			#DEFAULT_ListIconImageOffset= 0	 ; place to put the real 12x12 image
			
			#DEFAULT_VisualDesigner     = ""     ; will remove the VD entry from the menu
			#DEFAULT_CatalogPath        = "catalogs/"
			#DEFAULT_HelpPath           = "help/"
			#DEFAILT_LibraryViewerPlugin= "debugger/"
			#DEFAULT_ThemePath          = "themes/"
			
			DefaultEditorFontName$      = "Monaco"
			#DEFAULT_EditorFontSize     = 14
			
			#DEFAULT_FunctionFile       = "pbfunctions.txt"  ; related to Temp$ path
			#DEFAULT_ApiFile            = "compilers/apifunctions.txt" ; related to PB path
			
			#DEFAULT_NewLineType        = 1 ; lf (on OS X, the norm is now lf, no more 'cr' https://www.purebasic.fr/english/viewtopic.php?f=24&t=55391)
			#DEFAULT_DLLExtension       = "so"
			
			#DEFAULT_ImageBorder        = 0 ; for colorpicker
			
			#DEFAULT_CanWindowStayOnTop = true
			
			#DEFAULT_PreferencesTreeWidth = 180 ; with of tree gadget in prefs
			
			#FLAG_Warning = 0                ; on Windows: #MB_ICONWARNING
			#FLAG_Error = 0					 ; on Windows: #MB_ICONERROR
			#FLAG_Question = 0				 ; on Windows: #MB_ICONQUESTION
			#FLAG_Info = 0					 ; on windows: #MB_ICONINFORMATION
			
			#PB_MessageRequester_ResultOk = 6
			
	CompilerEndSelect
	
	CompilerIf #SPIDER_BASIC
		
		CompilerIf #__WIN__
			#PreferenceFileName$ = "SpiderBasic.prefs"
		CompilerElse
			#PreferenceFileName$ = "spiderbasic.prefs"
		CompilerEndIf
		
	CompilerElse
		
		CompilerIf #__WIN__
			#PreferenceFileName$ = "PureBasic.prefs"
		CompilerElse
			#PreferenceFileName$ = "purebasic.prefs"
		CompilerEndIf
		
	CompilerEndIf

	Structure STRUCT_PTR  ; REPLACES Commons::PTR
		StructureUnion
			unsigned_byte.a[0]
			byte_.b[0] ; even when declaring with an array like this, we still
			char_.c[0] ; can use the single \b, which is perfect for a universal
			word_.w[0] ; pointer variable
			unsigned_word.u[0]
			long_.l[0]
			float_.f[0]
			quad_.q[0]
			double_.d[0]
			integer_.i[0]
			*pointer.PTR[0]
		EndStructureUnion
	EndStructure
EndDeclareModule

Module G : EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 42
; Folding = ----
; Optimizer
; EnableXP
; DPIAware