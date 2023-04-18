DeclareModule PBFileSystem
	Declare.s normalize_filename(path.s) ; REPLACES: UniqueFilename
	Declare.s uniformize_separators_according_to_os(path.s)
EndDeclareModule

Module PBFileSystem : UseModule G
	; Creates a unique representation of a filename, by doing this:
	;  - replaces any "../directory" parts to get a direct path
	;  - cutting any "./" in the path
	;  - on Windows, replaces all "/" by "\" as both are allowed.
	;
	; The resulting path can be compared for equalness by only taking
	; care or the case sensitivity of the filesystem.
	;
	; Returns "" if the path contains more "../" than directories!
	;
	Procedure.s normalize_filename(path.s)
		If path = ""
			ProcedureReturn ""
		EndIf
		
		path = uniformize_separators_according_to_os(path)
		separator_code.c = Asc(#Separator)
		
		*current_char.Character = @FileName$
		While *current_char\c
			
			If *current_char\c = separator_code
				If PeekS(*current_char, 4) = #Separator + ".." + #Separator
					; remove the previous directory name
					*previous_char.Character = *current_char - #CHARSIZE
					While *previous_char >= @FileName$
						If *previous_char\c = separator_code
							Break
						EndIf
						*previous_char - #CHARSIZE
					Wend
					
					If *previous_char < @FileName$
						; oops, more ".." in the string than directories!
						ProcedureReturn ""
					EndIf
					
					; poking in the string is ok, since it can only get shorter by this
					PokeS(*previous_char, PeekS(*current_char + 3 * #CHARSIZE))
					
					; Make sure the cursor stays inside the string.
					; Otherwise, if removing a large dir towards the string end, *current_char might
					; end up outside of the valid string and create an endless loop
					*current_char = *previous_char
					
				ElseIf PeekS(*current_char, 3) = #Separator + "." + #Separator
					; simply remove this reference to the own directory
					PokeS(*current_char, PeekS(*current_char + 2 * #CHARSIZE))
					
				Else
					*current_char + #CHARSIZE
				EndIf
				
			Else
				*current_char + #CHARSIZE
			EndIf
		Wend
	EndProcedure
	
	Procedure.s uniformize_separators_according_to_os(path.s)
		CompilerIf #__WIN__
			ProcedureReturn ReplaceString(path, "/", "\")
		CompilerElse
			ProcedureReturn ReplaceString(path, "\", "/")
		CompilerEndIf
	EndProcedure
EndModule

CompilerIf __IS_TESTING__
	UseModule G
	Test::assert(Bool(PBFileSystem::uniformize_separators_according_to_os("roger/gontrand\telesphore") = "roger\gontrand\telesphore"), "Test uniformize_separators_accord_to_os() normal")
	Test::assert(Bool(PBFileSystem::uniformize_separators_according_to_os("roger") = "roger"), "Test uniformize_separators_accord_to_os() no separators")
	Test::assert(Bool(PBFileSystem::uniformize_separators_according_to_os("") = ""), "Test uniformize_separators_accord_to_os() empty string")
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 5
; Folding = --
; Optimizer
; EnableXP
; DPIAware