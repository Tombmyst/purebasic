XIncludeFile "commons.pb"

XIncludeFile "error_codes.pb"
XIncludeFile "pb_helpers.pb"

XIncludeFile "console.pb"


XIncludeFile "inline_if.pb"

XIncludeFile "string_util.pb"
XIncludeFile "math.pb"
XIncludeFile "date_util.pb"

XIncludeFile "fs_path.pb"
XIncludeFile "file_system.pb"

XIncludeFile "logger.pb"

XIncludeFile "test.pb"
XIncludeFile "functions.pb"

; CompilerIf #PB_Compiler_OS = #PB_OS_Windows
; 	
; CompilerElse
; 	
; CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 18
; Optimizer
; EnableXP
; DPIAware