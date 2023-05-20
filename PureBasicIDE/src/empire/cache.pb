DeclareModule LRUCache
	Declare store_byte(key.s, value.b)
	Declare.b get_byte(key.s, default_.b=0)
	
	Declare store_unsigned_byte(key.s, value.a)
	Declare.a get_unsigned_byte(key.s, value.a, default_.a=0)
	
	Declare store_word(key.s, value.w)
	Declare.w get_word(key.s, value.w, default_.a=0)
	
	Declare store_unsigned_word(key.s, value.u)
	Declare.u get_unsigned_word(key.s, value.u, default_.a=0)
	
	Declare store_long(key.s, value.l)
	Declare.l get_long(key.s, value.l, default_.l=0)
	
	Declare store_quad(key.s, value.q)
	Declare.q get_quad(key.s, value.q, default_.q=0)
	
	Declare store_float(key.s, value.f)
	Declare.f get_float(key.s, value.f, default_.f=0.0)
	
	Declare store_double(key.s, value.d)
	Declare.d get_double(key.s, value.d, default_.d=0.0)
	
	Declare store_string(key.s, value.s)
	Declare.s get_string(key.s, value.s, default_.s="")
	
	Declare set_max_size(size.l)
	Declare.l get_max_size()
EndDeclareModule

Module LRUCache : UseModule EmpireCommons
	Structure _STRUCT_CACHE_ITEM
		type.b
		*value
	EndStructure
	
	Enumeration
		#_TYPE_BYTE
		#_TYPE_UNSIGNED_BYTE
		#_TYPE_WORD
		#_TYPE_UNSIGNED_WORD
		#_TYPE_LONG
		#_TYPE_INT
		#_TYPE_QUAD
		#_TYPE_FLOAT
		#_TYPE_DOUBLE
		#_TYPE_STRING
	EndEnumeration
	
	Macro store_item(key, value, type_)
		Logger::trace("Storing " + key + " and value " + Str(value), __LOG__)
		_refresh_lru_list_if_necessary(key)
		_store(key, type, @value)
		AddMapElement(_cache(), key)
		_cache()\type = type_

		Select type_
			Case #_TYPE_BYTE
				PokeB(@_cache()\value, value)
			Case #_TYPE_UNSIGNED_BYTE
				PokeA(@_cache()\value, value)
			Case #_TYPE_WORD
				PokeW(@_cache()\value, value)
			Case #_TYPE_UNSIGNED_WORD
				PokeU(@_cache()\value, value)
			Case #_TYPE_LONG
				PokeL(@_cache()\value, value)
			Case #_TYPE_QUAD
				PokeQ(@_cache()\value, value)
			Case #_TYPE_FLOAT
				PokeF(@_cache()\value, value)
			Case #_TYPE_DOUBLE
				PokeD(@_cache()\value, value)
			Case #_TYPE_STRING
				PokeS(@_cache()\value, Str(value))
		EndSelect
		
	EndMacro
	
	Declare _store(key.s, type.b, *value)
	Declare _refresh_lru_list_if_necessary(key.s)
	Declare _move_to_front(key.s)
	Declare _remove_last_if_necessary()
	
	Global _max_size.l = 256
	Global _current_size.l = 0
	Global NewMap _cache._STRUCT_CACHE_ITEM()
	Global NewList _recent_used_items.s()
	
	Procedure store_byte(key.s, value.b) : store_item(key, value, #_TYPE_BYTE) : EndProcedure
	Procedure store_unsigned_byte(key.s, value.a) : store_item(key, value, #_TYPE_UNSIGNED_BYTE) : EndProcedure
	Procedure store_word(key.s, value.w) : store_item(key, value, #_TYPE_WORD) : EndProcedure
	Procedure store_unsigned_word(key.s, value.u) : store_item(key, value, #_TYPE_UNSIGNED_WORD) : EndProcedure
	Procedure store_long(key.s, value.l) : store_item(key, value, #_TYPE_LONG) : EndProcedure
	Procedure store_quad(key.s, value.q) : store_item(key, value, #_TYPE_QUAD) : EndProcedure
	Procedure store_float(key.s, value.f) : store_item(key, value, #_TYPE_FLOAT) : EndProcedure
	Procedure store_double(key.s, value.d) : store_item(key, value, #_TYPE_DOUBLE) : EndProcedure
	Procedure store_string(key.s, value.s) : store_item(key, value, #_TYPE_STRING) : EndProcedure
	
	Procedure.b get_byte(key.s, default_.b=0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.a get_unsigned_byte(key.s, default_.a=0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.w get_word(key.s, default_.w=0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.u get_unsigned_word(key.s, default_.u=0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.l get_long(key.s, default_.l=0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.q get_quad(key.s, default_.q=0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.f get_word(key.s, default_.f=0.0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.d get_double(key.s, default_.d=0.0)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.s get_string(key.s, default_.s="")
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
			ProcedureReturn _cache()\value
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure _store(key.s, type.b, *value)
		Logger::trace(Str(*value), __LOG__)
		_remove_last_if_necessary()
		
		ResetList(_recent_used_items())
		InsertElement(_recent_used_items())
		_recent_used_items() = key
		
		_current_size + 1
	EndProcedure
	
	Procedure _refresh_lru_list_if_necessary(key.s)
		If (FindMapElement(_cache(), key))
			_move_to_front(key)
		Else
			_remove_last_if_necessary()
		EndIf
	EndProcedure
		
	Procedure _move_to_front(key.s)
		Logger::trace("Moving " + key + " to front", __LOG__)
		ForEach (_recent_used_items())
			If (_recent_used_items() = key)
				Break
			EndIf
		Next
		
		MoveElement(_recent_used_items(), #PB_List_First)
	EndProcedure
	
	Procedure _remove_last_if_necessary()
		If (_current_size = _max_size)
			Logger::trace("Deleting last element", __LOG__)
			LastElement(_recent_used_items())
			DeleteMapElement(_cache(), _recent_used_items())
			DeleteElement(_recent_used_items())
			_current_size - 1
		EndIf
	EndProcedure
EndModule


CompilerIf __IS_TESTING__
	Logger::setLogLevel(LogLevel::#_TRACE, LogOutlet::#_CONSOLE)
	LRUCache::store_byte("roger", 123)
	LRUCache::store_string("rogere", "solange")
	Procedure __test_lru_cache()
		LRUCache::store_byte("patate", 124)
		LRUCache::store_string("raoul", "carlos")
		Define var.b = 125 
		Define var2.s = "raymonde"
		LRUCache::store_byte("raymond", var)
		LRUCache::store_string("berangere", var2)
	EndProcedure
	
	__test_lru_cache()
	
	Test::assert(Bool(LRUCache::get_byte("roger") = 123), "Stored byte")
	Test::assert(Bool(LRUCache::get_byte("patate") = 124), "Stored byte in procedure")
	Test::assert(Bool(LRUCache::get_byte("raymond") = 125), "Stored byte in procedure from variable")
	
; 	Test::assert(Bool(LRUCache::get_string("rogere") = "solange"), "Stored string")
; 	Test::assert(Bool(LRUCache::get_string("raoul") = "carlos"), "Stored string in procedure")
; 	Test::assert(Bool(LRUCache::get_string("berangere") = "raymonde"), "Stored string in procedure from variable")
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 37
; Folding = --
; Optimizer
; EnableXP
; DPIAware