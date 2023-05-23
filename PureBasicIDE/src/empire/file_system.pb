DeclareModule FileSystem : UseModule EmpireCommons
	Structure UX_PERMISSIONS
		user_can_read.boolean
		user_can_write.boolean
		user_can_execute.boolean
		
		group_can_read.boolean
		group_can_write.boolean
		group_can_execute.boolean
		
		all_can_read.boolean
		all_can_write.boolean
		all_can_execute.boolean
	EndStructure
	
	Structure SCANNED_NODE Extends UX_PERMISSIONS
		is_file.boolean
		is_directory.boolean
		is_hidden.boolean
		is_archive.boolean
		
		is_compressed.boolean
		is_normal.boolean
		is_read_only.boolean
		is_system.boolean
		
		is_link.boolean
		
		creation_date.q
		last_access_date.q
		
		last_modified_date.q
		size.q
		
		name.s
		path.s
	EndStructure
	
	Prototype scan_directory_callback_proto(*scanned_node.FileSystem::SCANNED_NODE, *callback_arg = null)
	
	Macro safe_close_file(file_handle)
		If (file_handle And IsFile(file_handle))
			CloseFile(file_handle)
		EndIf
	EndMacro
	
	Macro file_exists(file)
		Bool(FileSize(file) >= 0)
	EndMacro
	
	Macro is_directory(path)
		Bool(FileSize(path) = -2)
	EndMacro
	
	Macro sep
		CompilerIf #PB_Compiler_OS = #PB_OS_Windows
			"\"
		CompilerElse
			"/"
		CompilerEndIf
	EndMacro
	
	Declare scan_directory(path.s, *callback, recursive.boolean = true, *callback_arg = null, scanner_pattern.s="*.*")
	Declare swap_files(file1.s, file2.s)
EndDeclareModule

Module FileSystem : UseModule EmpireCommons
	Declare _recursive_directory_scanner(path.s, *callback, recursive.boolean, *callback_arg, scanner_pattern.s)
	
	Procedure scan_directory(path.s, *callback, recursive.boolean = true, *callback_arg = null, scanner_pattern.s="*.*")
		If (Not FileSystem::is_directory(path))
			Logger::error("Provided path '" + path + "' is not a valid directory", __LOG__)
			ProcedureReturn
		EndIf
		
		_recursive_directory_scanner(path, *callback, recursive, *callback_arg, scanner_pattern)
	EndProcedure
		
	Procedure _recursive_directory_scanner(path.s, *callback, recursive.boolean, *callback_arg, scanner_pattern.s)
		effective_callback.scan_directory_callback_proto = *callback
		
		dir_examiner.i = ExamineDirectory(#PB_Any, path, scanner_pattern)
		If (Not dir_examiner)
			Logger::error("Could not initiate directory examiner", __LOG__)
			ProcedureReturn
		EndIf
		
		While (NextDirectoryEntry(dir_examiner))
			If (DirectoryEntryName(dir_examiner) = "." Or DirectoryEntryName(dir_examiner) = "..")
				Continue
			EndIf
			
			If (DirectoryEntryType(dir_examiner) = #PB_DirectoryEntry_Directory And recursive)
				_recursive_directory_scanner(Path::join(path, DirectoryEntryName(dir_examiner)), *callback, recursive, *callback_arg, scanner_pattern)
			EndIf
			
			node.FileSystem::SCANNED_NODE
			attributes.l = DirectoryEntryAttributes(dir_examiner)
			
			With node
				CompilerIf #__WIN__
					\is_archive = attributes & #PB_FileSystem_Archive
					\is_compressed = attributes & #PB_FileSystem_Compressed
					\is_hidden = attributes & #PB_FileSystem_Hidden
					\is_normal = attributes & #PB_FileSystem_Normal
					\is_read_only = attributes & #PB_FileSystem_ReadOnly
					\is_system = attributes & #PB_FileSystem_System
				CompilerElse
					\all_can_execute = attributes & #PB_FileSystem_ExecAll
					\all_can_read = attributes & #PB_FileSystem_ReadAll
					\all_can_write = attributes & #PB_FileSystem_WriteAll
					\group_can_execute = attributes & #PB_FileSystem_ExecGroup
					\group_can_read = attributes & #PB_FileSystem_ReadGroup
					\group_can_write = attributes & #PB_FileSystem_WriteGroup	
					\is_link = attributes & #PB_FileSystem_Link
					\user_can_execute = attributes & #PB_FileSystem_ExecUser
					\user_can_read = attributes & #PB_FileSystem_ReadUser
					\user_can_write = attributes & #PB_FileSystem_WriteUser
				CompilerEndIf
				
				\creation_date = DirectoryEntryDate(dir_examiner, #PB_Date_Created)
				\last_access_date = DirectoryEntryDate(dir_examiner, #PB_Date_Accessed)
				\last_modified_date = DirectoryEntryDate(dir_examiner, #PB_Date_Modified)
				
				\is_file = Bool(DirectoryEntryType(dir_examiner) = #PB_DirectoryEntry_File)
				\is_directory = Bool(DirectoryEntryType(dir_examiner) = #PB_DirectoryEntry_Directory)
				
				\name = DirectoryEntryName(dir_examiner)
				\path = Path::join(path, \name)
				\size = DirectoryEntrySize(dir_examiner)
			EndWith
			
			effective_callback(@node, *callback_arg)
		Wend
		
		FinishDirectory(dir_examiner)
	EndProcedure
	
	Procedure swap_files(file1.s, file2.s)
		If (GetPathPart(file1) = GetPathPart(file2))
			RenameFile(file1, file1 + ".swap")
			RenameFile(file2, file1)
			RenameFile(file1 + ".swap", file2)
		Else
			CopyFile(file1, file2 + ".swap")
			DeleteFile(file1, #PB_FileSystem_Force)
			CopyFile(file2, file1)
			RenameFile(file2 + ".swap", file2)
		endif
	EndProcedure
EndModule


CompilerIf __IS_TESTING__ : UseModule EmpireCommons
	Global NewList __file_system_test_possible_node_names.s()
	ListUtil::append_many_s(__file_system_test_possible_node_names(), "dir", "file1.txt", "file2.txt", "dir_a", "dir_b", "file10", "file11.dat")
	
	Procedure __test_callback_scan_dir(*node.FileSystem::SCANNED_NODE, *callback_arg)
		Test::assert(Bool(*node\name <> ""), "Node name shouldn't be null")
		Test::assert(Bool(*node\is_file <> *node\is_directory), "Node cannot be file and directory at the same time and should be defined")
		Test::assert(Bool(ListUtil::contains_s(__file_system_test_possible_node_names(), *node\name)), "Node name should be one of the expected")
	EndProcedure
	
	FileSystem::scan_directory(Path::join(GetPathPart(__FILE__), "tests", "file_system", "scan"), @__test_callback_scan_dir())
CompilerEndIf