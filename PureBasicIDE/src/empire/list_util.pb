DeclareModule ListUtil : UseModule EmpireCommons
	Macro append(list_without_parentheses, element)
		AddElement(list_without_parentheses())
		list_without_parentheses() = element
	EndMacro
	
	Macro prepend(list_without_parentheses, element)
		FirstElement(list_without_parentheses())
		list_without_parentheses() = element
	EndMacro
	
	Macro insert(list_without_parentheses, element, index)
		SelectElement(list_without_parentheses(), index) 
		InsertElement(list_without_parentheses())
		list_without_parentheses() = element
	EndMacro
	
	Declare append_many_s(List list_.s(), element_1.s, element_2.s="", element_3.s="", element_4.s="", element_5.s="", element_6.s="", element_7.s="", element_8.s="", element_9.s="", element_10.s="")
	Declare prepend_many_s(List list_.s(), element_1.s, element_2.s="", element_3.s="", element_4.s="", element_5.s="", element_6.s="", element_7.s="", element_8.s="", element_9.s="", element_10.s="")
	Declare insert_many_s(List list_.s(), index.q, element_1.s, element_2.s="", element_3.s="", element_4.s="", element_5.s="", element_6.s="", element_7.s="", element_8.s="", element_9.s="", element_10.s="")
	Declare.boolean contains_s(List list_.s(), element.s)
EndDeclareModule

Module ListUtil
	Procedure append_many_s(List list_.s(), element_1.s, element_2.s="", element_3.s="", element_4.s="", element_5.s="", element_6.s="", element_7.s="", element_8.s="", element_9.s="", element_10.s="")
		append(list_, element_1)
		If (element_2 <> "") : append(list_, element_2) : Else : ProcedureReturn : EndIf
		If (element_3 <> "") : append(list_, element_3) : Else : ProcedureReturn : EndIf
		If (element_4 <> "") : append(list_, element_4) : Else : ProcedureReturn : EndIf
		If (element_5 <> "") : append(list_, element_5) : Else : ProcedureReturn : EndIf
		If (element_6 <> "") : append(list_, element_6) : Else : ProcedureReturn : EndIf
		If (element_7 <> "") : append(list_, element_7) : Else : ProcedureReturn : EndIf
		If (element_8 <> "") : append(list_, element_8) : Else : ProcedureReturn : EndIf
		If (element_9 <> "") : append(list_, element_9) : Else : ProcedureReturn : EndIf
		If (element_10 <> "") : append(list_, element_10) : Else : ProcedureReturn : EndIf
	EndProcedure
	
	Procedure prepend_many_s(List list_.s(), element_1.s, element_2.s="", element_3.s="", element_4.s="", element_5.s="", element_6.s="", element_7.s="", element_8.s="", element_9.s="", element_10.s="")
		NewList temp.s()
		append_many_s(temp(), element_1, element_2, element_3, element_4, element_5, element_6, element_7, element_8, element_9, element_10)
		MergeLists(temp(), list_(), #PB_List_First)
	EndProcedure
	
	Procedure insert_many_s(List list_.s(), index.q, element_1.s, element_2.s="", element_3.s="", element_4.s="", element_5.s="", element_6.s="", element_7.s="", element_8.s="", element_9.s="", element_10.s="")
		NewList temp.s()
		append_many_s(temp(), element_1, element_2, element_3, element_4, element_5, element_6, element_7, element_8, element_9, element_10)
		SelectElement(list_(), index)
		MergeLists(temp(), list_(), #PB_List_Before)
	EndProcedure
	
	Procedure.boolean contains_s(List list_.s(), element.s)
		ForEach (list_())
			If (list_() = element)
				ProcedureReturn true
			EndIf
		Next
		
		ProcedureReturn false
	EndProcedure
EndModule