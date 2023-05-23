DeclareModule Regexes
	Enumeration 1
		#REGEX_HexNumber
		#REGEX_BinNumber
		#REGEX_DecNumber
		#REGEX_FloatNumber
		#REGEX_ScienceNumber
	EndEnumeration
	
	Declare init()
	Declare end_()
	
	Declare.i pb_compiler_path_regex()
EndDeclareModule

Module Regexes
	_pb_compiler_path_regex.i = null
	
	Procedure init()
		_pb_compiler_path_regex = PBRegex::create_regex("compilers[\/\\]?$")
	EndProcedure
	
	Procedure end_()
		PBRegex::safe_free_regex(_pb_compiler_path_regex)
	EndProcedure
	
	Procedure.i pb_compiler_path_regex()
		ProcedureReturn _pb_compiler_path_regex
	EndProcedure
EndModule