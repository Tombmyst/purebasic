DeclareModule ToolAPI
	; Should match PBIDE interface for compat
	Interface ToolsPanelInterface
		CreateFunction(PanelItemID.i)		; called when the panelitem was created (external Tools should call UseGadgetList(PanelItemID) before adding gadgets)
		DestroyFunction()					; called when the item is destroyed
		
		ResizeHandler(PanelWidth, PanelHeight)   ; called after the panel is resized
		EventHandler(EventGadgetID)				 ; called for unhandled events in the main window (isn't necessarily an event for this item, so always check)
		
		PreferenceLoad()    ; called when the preferences are loaded (each tool should have it's own group!)
		PreferenceSave()	; called when the preferences are saved to file
		
		PreferenceStart()   ; called when the preferences window is opened.. you should make a copy of all preferences and work with them from now on, so after a 'Cancel' nothing will be changed
		PreferenceApply()	; called when 'Ok' or 'Apply' is hit.. you should apply the temporary preferences options to the real ones. Note: the tool will be destroyed/recreated to refresh it, so no need to do that.
		PreferenceCreate()	; this item is selected for configuration.. create the needed gadgets (in the current gadgetlist)
		PreferenceDestroy()	; another item is selected for configuration.. save changes and destroy the gadgets
		PreferenceEvents(EventGadgetID) ; unhandled gadget events of the Prefs window are passed here to be handled
		PreferenceChanged(IsConfigOpen)	; must return 1 if any changes were done to this tools preference settings
	EndInterface
	
	Structure ToolsPanelFunctions
		CreateFunction.i
		DestroyFunction.i
		
		ResizeHandler.i
		EventHandler.i
		
		PreferenceLoad.i
		PreferenceSave.i
		
		PreferenceStart.i
		PreferenceApply.i
		PreferenceCreate.i
		PreferenceDestroy.i
		PreferenceEvents.i
		PreferenceChanged.i
	EndStructure
	
	Structure ToolsPanelEntry
		*FunctionsVT   ; VirtualTable of ToolsPanelFunctions
		
		; values setup by the Plugin Manager. They should never be changed by the plugin!
		;
		ExternalPlugin.i    ; set to the #PB_Any value of the dll of an external plugin.. don't change!
		IsSeparateWindow.l
		ToolWindowID.i
		ToolWindowX.l
		ToolWindowY.l
		ToolWindowWidth.l
		ToolWindowHeight.l
		ToolMinWindowWidth.l
		ToolMinWindowHeight.l
		ToolStayOnTop.i        ; a #PB_Any Gadget
		IsToolStayOnTop.l
		
		; values set up in the init procedure
		;
		NeedPreferences.l      ; set to 1 if the PreferenceLoad/Save() functions are implemented
		NeedConfiguration.l	   ; set to 1 if the tool has any options in the Preferences Window (PreferenceCreate, PReferenceDestroy, Preferenceevents functions)
		NeedDestroyFunction.l  ; set to 1 if the DestroyFunction() function is implemented
							   ; all other functions MUST be implemented for each tool!
		
		PreferencesWidth.l  ; required with to put the preferences gadgets
		PreferencesHeight.l	; required height to put the preferences gadgets
		ToolID$				; a string that identifies the tool (must be unique! (case doesn't matter))
		
		; language identifyer strings (to be set by the init function)
		; these are needed to create the panel and in the preferences window
		; for external plugins, these should be set to the real strings
		;
		PanelTitle$        ; title in the PanelGadget
		ToolName$		   ; tool name (used in the Preferences)
	EndStructure
	
	
	; The ToolsPanelEntry_Real structure is used everywhere in the Main program
	; this allows the Tools to create their own structure which extends "ToolsPanelEntry",
	; and add up to 400 bytes of custom data that is still handled by the main program
	;
	Structure ToolsPanelEntry_Real Extends ToolsPanelEntry
		CustomData.b[400]
	EndStructure
EndDeclareModule

Module ToolAPI
	
EndModule
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 34
; FirstLine = 3
; Folding = -
; Optimizer
; EnableXP
; DPIAware