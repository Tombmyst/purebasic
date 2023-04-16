DeclareModule CRC32
	; Speed improvement:
	; Use the PB internal CRC32 function rather than using the Fingerprint() command to avoid conversion to/from strings
	; This makes a noticable difference when computing file Diffs
	CompilerIf #PB_Compiler_OS = #PB_OS_Windows
		Import ""
			PB_Cipher_CalculateCRC32(*buf, len, crc)
		EndImport
	CompilerElse
		ImportC ""
			PB_Cipher_CalculateCRC32(*buf, len, crc)
		EndImport
	CompilerEndIf
	
	Macro CRC32Fingerprint(Buffer, Length)
		PB_Cipher_CalculateCRC32(Buffer, Length, 0)
	EndMacro
EndDeclareModule

Module CRC32
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 6
; Folding = -
; Optimizer
; EnableXP
; DPIAware