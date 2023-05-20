DeclareModule PBFileSystem
	; Creates a unique representation of a filename, by doing this:
	;  - replaces any "../directory" parts to get a direct path
	;  - cutting any "./" in the path
	;  - on Windows, replaces all "/" by "\" as both are allowed.
	;
	; The resulting path can be compared for equalness by only taking
	; care or the case sensitivity of the filesystem.
	;
	; Returns "" if the path contains more "../" than directories!
	Declare.s normalize_filename(path.s) ; REPLACES: UniqueFilename
	Declare.s uniformize_separators_according_to_os(path.s)
	
	; Returns true if the two (full) filenames are representing
	; the same file. This function calls UniqueFilename().
	Declare.boolean paths_equal(lhs.s, rhs.s)
	
	; Creates a relative path representation of the (full) FileName$
	; relative to the (full) BasePath$. Note that the full FileName$ is returned
	; if no relative path can be created (different drives), or if there
	; would be too many "../../" involved.
	Declare.s create_relative_path(base_path.s, file_name.s)
	
	; Tries to resolve a (relative or full) FileName$ relative to the
	; (full) BasePath$. The returned filename is made unique with
	; UniqueFilename()
	Declare.s resolve_relative_path(base_path.s, file_name.s)
EndDeclareModule

Module PBFileSystem : UseModule G
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
	
	Procedure.boolean paths_equal(lhs.s, rhs.s)
		lhs = PBFileSystem::normalize_filename(lhs)
		rhs = PBFileSystem::normalize_filename(rhs)
		
		If (lhs <> "" And rhs <> "")
			CompilerIf #__LINUX__
				ProcedureReturn Bool(lhs = rhs)
			CompilerElse
				ProcedureReturn Bool(UCase(lhs) = UCase(rhs))
			CompilerEndIf
		EndIf
		
		ProcedureReturn false
	EndProcedure
	
	Procedure.s create_relative_path(base_path.s, file_name.s)
		If (file_name = "")
			ProcedureReturn ""
		EndIf
		
		base_path = PBFileSystem::normalize_filename(base_path)
		file_name = PBFileSystem::normalize_filename(file_name)
		
		CompilerIf #__WIN__
			If (Mid(base_path, 2, 1) = ":" And Mid(file_name, 2, 1) = ":")
				; Both have drive letters.. check the drive match
				If (UCase(Left(base_path, 1) <> UCase(Left(file_name, 1)))
					ProcedureReturn file_name
				EndIf
			ElseIf (Left(base_path, 2) = "\\" And Left(file_name, 2) = "\\")
				; Both are network paths, check if the computer name matches
				If (UCase(StringField(base_path, 3, "\")) <> UCase(StringField(file_name, 3, "\")))
					ProcedureReturn file_name
				EndIf
			Else
				; Either a mix of Network/non-network paths, or not full paths at all
				ProcedureReturn file_name
			EndIf
		CompilerElse
			If (Left(base_path, 1) <> "/" Or Left(file_name, 1) <> "/")
				ProcedureReturn file_name
			EndIf
		CompilerEndIf
		
		base_path = FileSystem::terminate_path_by_separator(base_path)
		
		old_file_name.s = file_name
		
		PB::xfor(index, Len(base_path), 0, -1)
			If (StringUtil::char_at(base, index) = FileSystem::sep)
				CompilerIf #__LINUX__
					case_mode.b = #PB_String_CaseSensitive
				CompilerElse
					case_mode.b = #PB_String_NoCase
				CompilerEndIf
				
				If (CompareMemoryString(@base_path, @file_name, case_mode, index) = #PB_String_Equal)
					base_path = Right(base_path, Len(base_path) - index)
					file_name = Right(file_name, Len(file_name) - index)
					Break
				EndIf
			EndIf
		Next index
		
		count = CountString(base_path, FileSystem::sep)
		If (count <= 3)
			For index = 1 To count
				file_name = Path::join("..", file_name)
			Next index
		Else
			file_name = old_file_name
		EndIf
		
		ProcedureReturn file_name
	EndProcedure
	
	Procedure.s resolve_relative_path(base_path.s, file_name.s)
		If (base_path = "")
			ProcedureReturn PBFileSystem::normalize_filename(file_name)
		endif
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