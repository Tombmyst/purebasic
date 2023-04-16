DeclareModule Macros
	CompilerIf #PB_Compiler_Unicode = 0
		Macro peekAscii(ptr)
			PeekS(ptr)
		EndMacro
		
		Macro peekAsciiLength(ptr, length)
			PeekS(ptr, length)
		EndMacro
		
		Macro peekUnicode(ptr)
			PeekS(ptr, -1, #PB_Unicode)
		EndMacro
		
		Macro pokeAscii(ptr, text)
			PokeS(ptr, text)
		EndMacro
		
		Macro pokeUnicode(ptr, text)
			PokeS(ptr, text, -1, #PB_Unicode)
		EndMacro
		
		Macro readAsciiStringFromFile(file_handle)  ; REPLACES readAsciiString
			ReadString(file_handle)
		EndMacro
		
		Macro memoryAsciiLength(ptr)
			MemoryStringLength(ptr)
		EndMacro
		
		Macro ToAscii(string_)
			@string_
		EndMacro
	CompilerElse
		; not really a macro, but this is a macro in non-unicode mode, that's why it is here
		Procedure toAscii(string_.s)
			Static *Buffer
			
			If *Buffer
				FreeMemory(*Buffer)
			EndIf
			
			*Buffer = AllocateMemory(StringByteLength(string_, #PB_Ascii) + 1)
			PokeS(*Buffer, string_, -1, #PB_Ascii)
			ProcedureReturn *Buffer
		EndProcedure
		
		Procedure ToUTF8(string_)
			Static *Buffer
			
			If *Buffer
				FreeMemory(*Buffer)
			EndIf
			
			*Buffer = AllocateMemory(StringByteLength(string_, #PB_UTF8) + 1)
			PokeS(*Buffer, string_, -1, #PB_UTF8)
			ProcedureReturn *Buffer
		EndProcedure
		
		Macro peekAscii(ptr)
			PeekS(ptr, -1, #PB_Ascii)
		EndMacro
		
		Macro peekUnicode(ptr)
			PeekS(ptr)
		EndMacro
		
		Macro peekAsciiLength(ptr, length)
			PeekS(ptr, length, #PB_Ascii)
		EndMacro
		
		Macro pokeAscii(ptr, text)
			PokeS(ptr, text, -1, #PB_Ascii)
		EndMacro
		
		Macro pokeUnicode(ptr, text)
			PokeS(ptr, text)
		EndMacro
		
		Macro readAsciiString(file_handle)
			ReadString(file_handle, #PB_Ascii)
		EndMacro
		
		Macro memoryAsciiLength(ptr)
			MemoryStringLength(ptr, #PB_Ascii)
		EndMacro
	CompilerEndIf
	
	; this is the only way to have it work in all cases, including unicode on PPC (no quad!)
	Macro asciiConst(a, b, c, d)
		((a) << 24 | (b) << 16 | (c) << 8 | (d))
	EndMacro
	
	Macro asciiConst3(a, b, c)
		((a) << 16 | (b) << 8 | (c))
	EndMacro
	
	Macro memoryStringLengthBytes(ptr)
		(MemoryStringLength(ptr)*#CharSize)
	EndMacro
	
	; If we interpret a UTF8 string as Ascii, we get the size in bytes which is perfect
	Macro memoryUTF8LengthBytes(ptr)
		MemoryStringLength(ptr, #PB_Ascii)
	EndMacro
	
	
	; This is for debugging mostly
	Macro debugPointer(ptr)
		RSet(Hex(ptr, #PB_Integer), SizeOf(INTEGER)*2, "0")
	EndMacro
	
	Macro ensureListIconSelection(gadget_handle)
		If GetGadgetState(gadget_handle) = -1
			SetGadgetState(gadget_handle, 0)
		EndIf
	EndMacro
EndDeclareModule

Module Macros
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 114
; FirstLine = 43
; Folding = -----
; Optimizer
; EnableXP
; DPIAware