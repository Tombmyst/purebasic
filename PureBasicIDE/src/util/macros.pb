DeclareModule Macros
	CompilerIf #PB_Compiler_Unicode = 0
		Macro peek_ascii(ptr)
			PeekS(ptr)
		EndMacro
		
		Macro peek_ascii_length(ptr, length)
			PeekS(ptr, length)
		EndMacro
		
		Macro peek_unicode(ptr)
			PeekS(ptr, -1, #PB_Unicode)
		EndMacro
		
		Macro poke_ascii(ptr, text)
			PokeS(ptr, text)
		EndMacro
		
		Macro poke_unicode(ptr, text)
			PokeS(ptr, text, -1, #PB_Unicode)
		EndMacro
		
		Macro read_ascii_string_from_file(file_handle)  ; REPLACES readAsciiString
			ReadString(file_handle)
		EndMacro
		
		Macro memory_ascii_length(ptr)
			MemoryStringLength(ptr)
		EndMacro
		
		Macro to_ascii(string_)
			@string_
		EndMacro
	CompilerElse
		; not really a macro, but this is a macro in non-unicode mode, that's why it is here
		Declare.i to_ascii(string_.s)
		Declare.i to_utf8(string_.s)
		
		
		Macro peekAscii(ptr)
			PeekS(ptr, -1, #PB_Ascii)
		EndMacro
		
		Macro peek_unicode(ptr)
			PeekS(ptr)
		EndMacro
		
		Macro peek_ascii_length(ptr, length)
			PeekS(ptr, length, #PB_Ascii)
		EndMacro
		
		Macro poke_ascii(ptr, text)
			PokeS(ptr, text, -1, #PB_Ascii)
		EndMacro
		
		Macro poke_unicode(ptr, text)
			PokeS(ptr, text)
		EndMacro
		
		Macro read_ascii_string_from_file(file_handle)
			ReadString(file_handle, #PB_Ascii)
		EndMacro
		
		Macro memory_ascii_length(ptr)
			MemoryStringLength(ptr, #PB_Ascii)
		EndMacro
	CompilerEndIf
	
	; this is the only way to have it work in all cases, including unicode on PPC (no quad!)
	Macro ascii_const(a, b, c, d)
		((a) << 24 | (b) << 16 | (c) << 8 | (d))
	EndMacro
	
	Macro ascii_const3(a, b, c)
		((a) << 16 | (b) << 8 | (c))
	EndMacro
	
	Macro memory_string_length_bytes(ptr)
		(MemoryStringLength(ptr)*#CharSize)
	EndMacro
	
	; If we interpret a UTF8 string as Ascii, we get the size in bytes which is perfect
	Macro memory_utf8_length_bytes(ptr)
		MemoryStringLength(ptr, #PB_Ascii)
	EndMacro
	
	
	; This is for debugging mostly
	Macro debug_pointer(ptr)
		RSet(Hex(ptr, #PB_Integer), SizeOf(INTEGER)*2, "0")
	EndMacro
	
	Macro ensure_list_icon_selection(gadget_handle)
		If GetGadgetState(gadget_handle) = -1
			SetGadgetState(gadget_handle, 0)
		EndIf
	EndMacro
EndDeclareModule

Module Macros
	CompilerIf #PB_Compiler_Unicode = 1
		Procedure.i to_ascii(string_.s)
			Static *Buffer
			
			If *Buffer
				FreeMemory(*Buffer)
			EndIf
			
			*Buffer = AllocateMemory(StringByteLength(string_, #PB_Ascii) + 1)
			PokeS(*Buffer, string_, -1, #PB_Ascii)
			ProcedureReturn *Buffer
		EndProcedure
		
		Procedure.i to_utf8(string_.s)
			Static *Buffer
			
			If *Buffer
				FreeMemory(*Buffer)
			EndIf
			
			*Buffer = AllocateMemory(StringByteLength(string_, #PB_UTF8) + 1)
			PokeS(*Buffer, string_, -1, #PB_UTF8)
			ProcedureReturn *Buffer
		EndProcedure
	CompilerEndIf
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 36
; FirstLine = 26
; Folding = -----
; Optimizer
; EnableXP
; DPIAware