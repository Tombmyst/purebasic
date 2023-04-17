EnableExplicit

DeclareModule LogLevel : UseModule EmpireCommons
	Enumeration
		#_ALL
		#_TRACE
		#_DEBUG
		#_SUCCESS
		#_INFO
		#_WARN
		#_ERROR
		#_SEVERE
		#_FATAL
	EndEnumeration
	
	Declare.b to_level(level_string.s)
EndDeclareModule

Module LogLevel 
	Procedure.b to_level(level_string.s)
		Select Trim(LCase(level_string))
			Case "trace": ProcedureReturn #_TRACE	
			Case "debug": ProcedureReturn #_DEBUG
			Case "success": ProcedureReturn #_SUCCESS
			Case "info": ProcedureReturn #_INFO
			Case "warn": ProcedureReturn #_WARN
			Case "error": ProcedureReturn #_ERROR
			Case "severe": ProcedureReturn #_SEVERE
			Case "fatal": ProcedureReturn #_FATAL
			Default:
				crash("Unknown level: " + level_string)
		EndSelect
	EndProcedure
EndModule

DeclareModule LogOutlet
	EnumerationBinary
		#_CONSOLE
		#_FILE
	EndEnumeration
EndDeclareModule

Module LogOutlet : EndModule

DeclareModule Logger : UseModule EmpireCommons
	Declare useConsole()
	Declare setLogFile(file.s, should_append.boolean = false)
	
	Declare trace(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare dbg(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare success(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare info(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare warn(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare error(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare severe(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare fatal(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	
	Declare setLogLevel(level.b, outlet.b)
EndDeclareModule

Module Logger
	Global _uses_console.boolean = false
	Global _logFileHandle.i = null
	Global _logLevelConsole.b = LogLevel::#_SUCCESS
	Global _logLevelFile.b = LogLevel::#_INFO
	
	Declare _log(level.b, message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
	Declare.s _produceLogString(level.b, message.s, fileName.s, moduleName.s, procedureName.s, lineNumber.i)
	Declare.s _logLevelToString(level.b)
	Declare _logLevelToColor(level.b, *fore, *back)
	Declare.s _handleFileModuleProcedureLineNumber(fileName.s, moduleName.s, procedureName.s, lineNumber.i)
	Declare.boolean _should_log(level.b)
	
	CompilerIf Defined(__LOG_LEVEL__, #PB_Constant) = false
		#__LOG_LEVEL__ = ""
	CompilerEndIf
	
	_logLevelConsole = LogLevel::to_level(StringUtil::first_not_empty(#__LOG_LEVEL__, GetEnvironmentVariable("PB_IDE_LOG_LEVEL")))
	Debug "Setting level to: " + _logLevelConsole
	
	Procedure useConsole()
		_uses_console = true
	EndProcedure
	
	Procedure setLogFile(file.s, should_append.boolean = false)
		FileSystem::safe_close_file(_logFileHandle)
		_logFileHandle = OpenFile(#PB_Any, file, iif::ii(should_append, #PB_File_Append|#PB_File_NoBuffering, #PB_File_NoBuffering))
	EndProcedure
	
	Procedure setLogLevel(level.b, outlet.b)
		Select (outlet)
			Case LogOutlet::#_CONSOLE
				_logLevelConsole = level
			Case LogOutlet::#_FILE
				_logLevelFile = level
		EndSelect
	EndProcedure
	
	Procedure trace(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_TRACE, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure dbg(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_DEBUG, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure success(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_SUCCESS, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure info(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_INFO, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure warn(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_WARN, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure error(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_ERROR, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure severe(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_SEVERE, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure fatal(message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		_log(LogLevel::#_FATAL, message, fileName, moduleName, procedureName, lineNumber)
	EndProcedure
	
	Procedure _log(level.b, message.s, fileName.s="", moduleName.s="", procedureName.s="", lineNumber.i=-1)
		If Not _should_log(level)
			Debug "patate"
			Debug level
			Debug _logLevelConsole
			ProcedureReturn
		EndIf
		
		logString.s = _produceLogString(level, message, fileName, moduleName, procedureName, lineNumber)
		
		If (_uses_console And level >= _logLevelConsole)
			fore.b = 0
			back.b = 0
			_logLevelToColor(level, @fore, @back)
			ConsoleColor(fore, back)
			PrintN(logString)
			ConsoleColor(7, 0)
		ElseIf (level >= _logLevelConsole)
			Debug logString
		EndIf
		
		If (level >= _logLevelFile And IsFile(_logFileHandle))
			WriteStringN(_logFileHandle, logString)
		EndIf
		
	EndProcedure
	
	Procedure.s _produceLogString(level.b, message.s, fileName.s, moduleName.s, procedureName.s, lineNumber.i)
		ProcedureReturn "[" + DateUtil::to_yyyy_mm_dd_hh_ii_ss(Date()) + "] [" + _logLevelToString(level) + "] " + _handleFileModuleProcedureLineNumber(fileName, moduleName, procedureName, lineNumber) + " " + message
	EndProcedure
	
	Procedure.s _logLevelToString(level.b)
		Select (level)
			Case LogLevel::#_TRACE : ProcedureReturn "TRACE"
			Case LogLevel::#_DEBUG : ProcedureReturn "DEBUG"
			Case LogLevel::#_SUCCESS : ProcedureReturn "SUCCESS"
			Case LogLevel::#_INFO : ProcedureReturn "INFO"
			Case LogLevel::#_WARN : ProcedureReturn "WARN"
			Case LogLevel::#_ERROR : ProcedureReturn "ERROR"
			Case LogLevel::#_SEVERE : ProcedureReturn "SEVERE"
			Case LogLevel::#_FATAL : ProcedureReturn "FATAL"
			Default : ProcedureReturn ""
		EndSelect
	EndProcedure
	
	Procedure _logLevelToColor(level.b, *fore, *back)
		Select (level)
			Case LogLevel::#_TRACE
				PokeB(*fore, 8)
				PokeB(*back, 0)
			Case LogLevel::#_SUCCESS
				PokeB(*fore, 2)
				PokeB(*back, 0)
			Case LogLevel::#_INFO
				PokeB(*fore, 3)
				PokeB(*back, 0)
			Case LogLevel::#_WARN
				PokeB(*fore, 14)
				PokeB(*back, 0)
			Case LogLevel::#_ERROR
				PokeB(*fore, 12)
				PokeB(*back, 0)
			Case LogLevel::#_SEVERE
				PokeB(*fore, 5)
				PokeB(*back, 0)
			Case LogLevel::#_FATAL
				PokeB(*fore, 0)
				PokeB(*back, 12)
			Default
				PokeB(*fore, 7)
				PokeB(*back, 0)
		EndSelect
	EndProcedure
	
	Procedure.s _handleFileModuleProcedureLineNumber(fileName.s, moduleName.s, procedureName.s, lineNumber.i)
		If (fileName = "" And moduleName = "" And procedureName = "" And lineNumber = -1)
			ProcedureReturn ""
		EndIf
		
		If moduleName = ""
			moduleName = "<root>"
		EndIf
		
		If procedureName = ""
			procedureName = ""
		Else
			procedureName = procedureName + "()"
		EndIf
		
		ProcedureReturn "[" + StringUtil::join("::", fileName, moduleName, procedureName) + ", at " + Str(lineNumber) + "]"
	EndProcedure
	
	Procedure.boolean _should_log(level.b)
		ProcedureReturn Bool(level >= _logLevelConsole Or level >= _logLevelFile)
	EndProcedure
EndModule

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 219
; FirstLine = 163
; Folding = -----
; Optimizer
; EnableXP
; DPIAware