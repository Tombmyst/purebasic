DeclareModule Functions
	Prototype foreach_character_proto(char.c, index.q)
	
	Declare foreach_character(string_.s, *callback)
EndDeclareModule

Module Functions : UseModule EmpireCommons
	; For each character in *string*, calls *callback* with the character as input.
	; The callback should have the following signature:
	; callback(char.c, index.q)
	;	where *char* is the current char
	;		and *index* is the index we're at (0-based)
	Procedure foreach_character(string_.s, *callback)
		effective.foreach_character_proto = *callback
		*char.Character = @string_
		index.q = 0
		While (*char\c)
			effective(*char\c, index)
			
			index + 1
			*char + #CHARSIZE
		Wend
	EndProcedure
EndModule

CompilerIf __IS_TESTING__
	Logger::info("Testing foreach_character()", EmpireCommons::__LOG__)
	Procedure foreach_character_test(char.c, index.q)
		Select index
			Case 0, 4:
				Test::assert(Bool(char = 'r'), "Should have been equal to 'r'")
			Case 1:
				Test::assert(Bool(char = 'o'), "Should have been equal to 'o'")
			Case 2:
				Test::assert(Bool(char = 'g'), "Should have been equal to 'g'")
			Case 3:
				Test::assert(Bool(char = 'e'), "Should have been equal to 'e'")
			Default:
				Test::assert_crash(0, "Index should not get higher than 4 (was: " + Str(index) + ")") ; should crash, otherwise we could stick in an eternal loop of hell!
		EndSelect
	EndProcedure
	
	Functions::foreach_character("roger", @foreach_character_test())
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 22
; Folding = -
; Optimizer
; EnableXP
; DPIAware