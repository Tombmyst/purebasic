DeclareModule CommandLineBuilder
	Declare old_CommandlineProjectBuild()
EndDeclareModule

Module CommandLineBuilder
	Procedure old_CommandlineProjectBuild()
		NewList compiler_targets.PBCompilerStructs::STRUCT_TARGET()
		NewList Summary.s()
		
; 		If LoadProject(CommandLineProjectFile$) ; error messages handled inside
; 			
; 			; determine which targets to build
; 			;
; 			If ListSize(CommandlineTargetNames()) = 0
; 				
; 				; no targets given, build those that have "build all" option set
; 				ForEach ProjectTargets()
; 					If ProjectTargets()\IsEnabled
; 						AddElement(compiler_targets())
; 						compiler_targets() = @ProjectTargets()
; 					EndIf
; 				Next ProjectTargets()
; 				
; 				; if still empty, use default target (one always exists, ensured by LoadProject)
; 				If ListSize(compiler_targets()) = 0
; 					AddElement(compiler_targets())
; 					compiler_targets() = *DefaultTarget
; 				EndIf
; 				
; 			Else
; 				
; 				; compare names
; 				ForEach ProjectTargets()
; 					ForEach CommandlineTargetNames()
; 						If ProjectTargets()\Name$ = CommandlineTargetNames() ; case sensitive
; 							AddElement(compiler_targets())
; 							compiler_targets() = @ProjectTargets()
; 							DeleteElement(CommandlineTargetNames()) ; mark this one as found
; 							Break
; 						EndIf
; 					Next CommandlineTargetNames()
; 				Next ProjectTargets()
; 				
; 				; print message for not found targets
; 				ForEach CommandlineTargetNames()
; 					PrintN(Language("Compiler", "TargetNotFound") + ": "+ CommandlineTargetNames())
; 				Next CommandlineTargetNames()
; 				
; 				If ListSize(compiler_targets()) = 0
; 					PrintN(Language("Compiler", "NoTargets"))
; 					ProcedureReturn
; 				EndIf
; 				
; 			EndIf
; 			
; 			
; 			; need to wait for the default compiler to be ready
; 			; as there is no check for it unless the compiler needs to be switched later
; 			If WaitForCompilerReady()
; 				
; 				; build each target
; 				ClearList(BuildInfo())
; 				OldWarningCount = 0
; 				SuccessCount = 0
; 				FailCount = 0
; 				
; 				ForEach compiler_targets()
; 					If QuietBuild = 0
; 						PrintN(RSet("", 78, "-"))
; 						PrintN("  " + LanguagePattern("Compiler","BuildStart", "%target%", compiler_targets()\Name$))
; 						PrintN(RSet("", 78, "-"))
; 					EndIf
; 					
; 					Result$ = BuildProjectTarget(compiler_targets(), 0, #True, #False)
; 					
; 					; count the emitted warnings during this compile
; 					WarningCount = 0
; 					ForEach BuildInfo()
; 						If BuildInfo()\IsWarning
; 							WarningCount + 1
; 						EndIf
; 					Next BuildInfo()
; 					
; 					If Result$ <> "" And WarningCount = OldWarningCount And QuietBuild = 0
; 						; Failures are logged as errors and warnings give a "success with warnings" line, so add a line for success here too
; 						; do this before executing the tools for a consistent log output
; 						PrintN(Language("Compiler","BuildSuccess"))
; 					EndIf
; 					
; 					; Update the target's build counts and execute any tools
; 					If Result$ <> ""
; 						If compiler_targets()\UseCompileCount      ; this increases both compile+build count
; 							compiler_targets()\CompileCount + 1
; 						EndIf
; 						
; 						If compiler_targets()\UseBuildCount
; 							compiler_targets()\BuildCount + 1
; 						EndIf
; 						
; 						AddTools_ExecutableName$ = Result$
; 						AddTools_Execute(#TRIGGER_AfterCreateExe, compiler_targets())
; 					Else
; 						; add an error message in quiet mode to correctly identify the target
; 						If QuietBuild
; 							PrintN("-- " + LanguagePattern("Compiler", "TargetBuildError", "%target%", compiler_targets()\Name$))
; 						EndIf
; 					EndIf
; 					
; 					AddElement(Summary())
; 					Summary() = "  " + LSet(compiler_targets()\Name$, 58)
; 					
; 					If Result$ = ""
; 						Summary() + "[ " + Language("Compiler","StatusError") + " ]"
; 						FailCount + 1
; 					ElseIf WarningCount > OldWarningCount
; 						Summary() + "[ " + LanguagePattern("Compiler","StatusWarning", "%count%", Str(WarningCount - OldWarningCount)) + " ]"
; 						SuccessCount + 1 ; this is a success too
; 					Else
; 						Summary() + "[ " + Language("Compiler","StatusOk") + " ]"
; 						SuccessCount + 1
; 					EndIf
; 					
; 					OldWarningCount = WarningCount
; 					If QuietBuild = 0
; 						PrintN("")
; 					EndIf
; 				Next compiler_targets()
; 				
; 				; display stats
; 				If QuietBuild = 0
; 					PrintN(RSet("", 78, "-"))
; 					PrintN("")
; 					ForEach Summary()
; 						PrintN(Summary())
; 					Next Summary()
; 					PrintN("")
; 					
; 					If SuccessCount > 0
; 						PrintN("  " + LanguagePattern("Compiler", "BuildStatsNoError", "%count%", Str(SuccessCount)))
; 					EndIf
; 					If FailCount > 0
; 						PrintN("  " + LanguagePattern("Compiler", "BuildStatsError", "%count%", Str(FailCount)))
; 					EndIf
; 					If WarningCount > 0
; 						PrintN("  " + LanguagePattern("Compiler", "BuildStatsWarning", "%count%", Str(WarningCount)))
; 					EndIf
; 					If CompilationAborted
; 						PrintN("  " + Language("Compiler","BuildStatsAborted"))
; 					EndIf
; 					
; 					PrintN("")
; 				EndIf
; 				
; 				; save project to update build counters if needed (show no errors on failure)
; 				If CommandLineBuildReadOnly = #False
; 					SaveProject(#False)
; 				EndIf
; 				
; 				If FailCount = 0
; 					ProcedureReturn true
; 				EndIf
; 				
; 			EndIf
; 			
; 		EndIf
; 		ProcedureReturn false
	EndProcedure
EndModule