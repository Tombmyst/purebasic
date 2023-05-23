DeclareModule PBString
	Declare.s coalesce(a.s, b.s="" ,c.s="" ,d.s="" ,e.s="",f.s="",g.s="",h.s="",i.s="",j.s="")
	Declare.s append_to_string_non_empty(string_.s, item1.s, item2.s = "", item3.s = "")
	Declare.s first_not_empty(s1.s, s2.s="", s3.s="", s4.s="")
	Declare.s join(with_.s, s1.s, s2.s, s3.s="")
	Declare.s join5(with_.s, s1.s, s2.s, s3.s="", s4.s="", s5.s="")
	
	Macro startswith(string_, with_)
		Bool(Left(string_, Len(with_)) = with_)
	EndMacro
	
	Macro endswith(string_, with_)
		Bool(Right(string_, Len(with_)) = with_)
	EndMacro
	
	Macro char_at(string_, pos)
		Mid(string_, pos, 1)
	EndMacro
EndDeclareModule

Module PBString
	Procedure.s coalesce(a.s, b.s="" ,c.s="" ,d.s="" ,e.s="",f.s="",g.s="",h.s="",i.s="",j.s="")
		Protected selected.s = ""

		If (a <> "")
			selected = a
		ElseIf (b <> "")
			selected = b
		ElseIf (c <> "")
			selected = c
		ElseIf (d <> "")
			selected = d
		ElseIf (e <> "")
			selected = e
		ElseIf (f <> "")
			selected = f
		ElseIf (g <> "")
			selected = g
		ElseIf (h <> "")
			selected = h
		ElseIf (i <> "")
			selected = i
		Else
			selected = j
		EndIf
		
		ProcedureReturn selected
	EndProcedure
	
	Procedure.s append_to_string_non_empty(string_.s, item1.s, item2.s = "", item3.s = "")
		Protected result.s = string_
		
		If (item1 <> "")
			result + item1
		EndIf
		
		If (item2 <> "")
			result + item2
		EndIf
		
		If (item3 <> "")
			result + item3
		EndIf
		
		ProcedureReturn result
	EndProcedure
	
	Procedure.s first_not_empty(s1.s, s2.s="", s3.s="", s4.s="")
		If (s1 = "")
			If (s2 = "")
				If (s3 = "")
					If (s4 = "")
						ProcedureReturn ""
					Else
						ProcedureReturn s4
					EndIf
				Else
					ProcedureReturn s3
				EndIf
			Else
				ProcedureReturn s2
			EndIf
		Else
			ProcedureReturn s1
		EndIf
	EndProcedure
	
	Procedure.s join(with_.s, s1.s, s2.s, s3.s="")
		Protected result.s = ""
		
		If (s1 <> "")
			result = result + s1 + with_
		EndIf
		
		If (s2 <> "")
			result = result + s2 + with_
		EndIf
		
		If (s3 <> "")
			result = result + s3 + with_
		EndIf
		
		If (result = "")
			ProcedureReturn ""
		EndIf
		
		ProcedureReturn Left(result, Len(result) - Len(with_))
	EndProcedure
	
	Procedure.s join5(with_.s, s1.s, s2.s, s3.s="", s4.s="", s5.s="")
		Protected result.s = s1 + with_ + s2
		
		If (s3 <> "")
			result = result + with_ + s3
		EndIf
		
		If (s4 <> "")
			result = result + with_ + s4
		EndIf
		
		If (s5 <> "")
			result = result + with_ + s5
		EndIf
		
		ProcedureReturn result
	EndProcedure
EndModule

CompilerIf __IS_TESTING__
	If (PBString::append_to_string_non_empty("roger", "", "raymond", " ") <> "rogerraymond ")
		Debug "Test FAILS at " + #PB_Compiler_File + ": " + #PB_Compiler_Line
	Else
		Debug "Test passes at " + #PB_Compiler_File + ": " + #PB_Compiler_Line
	EndIf
	
	If (PBString::first_not_empty("", "", "roger", "raymond") <> "roger")
		Debug "Test FAILS at " + #PB_Compiler_File + ": " + #PB_Compiler_Line
	Else
		Debug "Test passes at " + #PB_Compiler_File + ": " + #PB_Compiler_Line
	EndIf
	
	If (PBString::join5("%", "solange", "gérard", "roger", "raymond") <> "solange%gérard%roger%raymond")
		Debug "Test FAILS at " + #PB_Compiler_File + ": " + #PB_Compiler_Line
	Else
		Debug "Test passes at " + #PB_Compiler_File + ": " + #PB_Compiler_Line
	EndIf
CompilerEndIf