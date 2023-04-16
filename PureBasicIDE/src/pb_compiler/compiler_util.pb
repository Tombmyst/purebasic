DeclareModule PBCompilerUtil
	EnumerationBinary  ; Values for MatchCompilerVersion()
		#MATCH_OS
		#MATCH_VERSION
		#MATCH_MINIMUM_VERSION  ; was #MATCH_VersionUp
		#MATCH_BETA
		#MATCH_MINIMUM_BETA_VERSION  ; was #MATCH_BetaUp
		#MATCH_PROCESSOR
	EndEnumeration
	#MATCH_EXACT = #MATCH_OS | #MATCH_VERSION | #MATCH_MINIMUM_VERSION | #MATCH_BETA | #MATCH_MINIMUM_BETA_VERSION | #MATCH_PROCESSOR
EndDeclareModule

Module PBCompilerUtil
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 12
; Folding = -
; Optimizer
; EnableXP
; DPIAware