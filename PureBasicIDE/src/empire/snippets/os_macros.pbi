CompilerSelect #PB_Compiler_OS
	CompilerCase #PB_OS_Windows
		CompilerIf #PB_Compiler_Processor = #PB_Processor_x86 Or #PB_Compiler_Processor = #PB_Processor_Arm32
			Debug "OS: win 32"
			#__WIN__ = 1
			#__MAC__ = 0
			#__LINUX__ = 0
			#__64BITS__ = 0
		CompilerElse
			Debug "OS: win 64"
			#__WIN__ = 1
			#__MAC__ = 0
			#__LINUX__ = 0
			#__64BITS__ = 1
		CompilerEndIf
	CompilerCase #PB_OS_MacOS
		CompilerIf #PB_Compiler_Processor = #PB_Processor_x86 Or #PB_Compiler_Processor = #PB_Processor_Arm32
			Debug "OS: mac 32"
			#__WIN__ = 0
			#__MAC__ = 1
			#__LINUX__ = 0
			#__64BITS__ = 0
		CompilerElse
			Debug "OS: mac 64"
			#__WIN__ = 0
			#__MAC__ = 1
			#__LINUX__ = 0
			#__64BITS__ = 1
		CompilerEndIf
	CompilerCase #PB_OS_Linux
		CompilerIf #PB_Compiler_Processor = #PB_Processor_x86 Or #PB_Compiler_Processor = #PB_Processor_Arm32
			Debug "OS: linux 32"
			#__WIN__ = 0
			#__MAC__ = 0
			#__LINUX__ = 1
			#__64BITS__ = 0
		CompilerElse
			Debug "OS: linux 64"
			#__WIN__ = 0
			#__MAC__ = 0
			#__LINUX__ = 1
			#__64BITS__ = 1
		CompilerEndIf
	CompilerDefault
		CompilerError "Unsuported OS (yet)"
CompilerEndSelect
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 41
; Folding = -
; Optimizer
; EnableXP
; DPIAware