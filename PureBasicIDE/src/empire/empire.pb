XIncludeFile "commons.pb"

CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	XIncludeFile "pb\pbpp.pbi"
CompilerElse
	XIncludeFile "pb/pbpp.pbi"
CompilerEndIf

XIncludeFile "error_codes.pb"
XIncludeFile "pb_helpers.pb"

XIncludeFile "console.pb"
XIncludeFile "logger.pb"
XIncludeFile "test.pb"
XIncludeFile "cache.pb"

XIncludeFile "inline_if.pb"
XIncludeFile "date_util.pb"

XIncludeFile "list_util.pb"
XIncludeFile "string_util.pb"
XIncludeFile "math.pb"

XIncludeFile "fs_path.pb"
XIncludeFile "file_system.pb"

XIncludeFile "functions.pb"
UnuseModule EmpireCommons
; CompilerIf #PB_Compiler_OS = #PB_OS_Windows
; 	
; CompilerElse
; 	
; CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 8
; Optimizer
; EnableXP
; DPIAware