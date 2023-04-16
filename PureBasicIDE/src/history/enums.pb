DeclareModule HistoryEnumEvents
	Enumeration
		#Create
		#Open
		#Close
		#Save
		#SaveAs
		#Reload
		#Edit
		
		#LAST = #Edit ; highest event num
	EndEnumeration
EndDeclareModule

Module HistoryEnumEvents : EndModule


DeclareModule HistoryEnumDBs
	Enumeration
		#DB
	EndEnumeration
EndDeclareModule

Module HistoryEnumDBs : EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 10
; Folding = -
; Optimizer
; EnableXP
; DPIAware