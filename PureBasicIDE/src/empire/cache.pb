DeclareModule LRUCache : UseModule EmpireCommons
	Declare store_byte(domain.s, key.s, value.b)
	Declare.b get_byte(domain.s, key.s, default_.b=0)
	
	Declare store_unsigned_byte(domain.s, key.s, value.a)
	Declare.a get_unsigned_byte(domain.s, key.s, default_.a=0)
	
	Declare store_word(domain.s, key.s, value.w)
	Declare.w get_word(domain.s, key.s, default_.w=0)
	
	Declare store_unsigned_word(domain.s, key.s, value.u)
	Declare.u get_unsigned_word(domain.s, key.s, default_.u=0)
	
	Declare store_long(domain.s, key.s, value.l)
	Declare.l get_long(domain.s, key.s, default_.l=0)
	
	Declare store_quad(domain.s, key.s, value.q)
	Declare.q get_quad(domain.s, key.s, default_.q=0)
	
	Declare store_float(domain.s, key.s, value.f)
	Declare.f get_float(domain.s, key.s, default_.f=0.0)
	
	Declare store_double(domain.s, key.s, value.d)
	Declare.d get_double(domain.s, key.s, default_.d=0.0)
	
	Declare store_string(domain.s, key.s, value.s)
	Declare.s get_string(domain.s, key.s, default_.s="")
	
	Declare set_max_size(size.l)
	Declare.l get_max_size()
	
	Declare.boolean contains(domain.s, key.s)
EndDeclareModule

Module LRUCache : UseModule EmpireCommons
	Structure _STRUCT_CACHE_ITEM
		type.b
		StructureUnion
			value_b.b
			value_a.a
			value_w.w
			value_u.u
			value_l.l
			value_q.q
			value_f.f
			value_d.d
		EndStructureUnion
		value_str.s
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
	
	Macro make_effective_key(domain, key)
		domain + "~~" + key
	EndMacro
	
	Macro store_item(domain, key, value, type_)
		effective_key.s = make_effective_key(domain, key)
		Logger::trace("Storing " + effective_key + " and value " + Str(value), __LOG__)
		_refresh_lru_list_if_necessary(effective_key)
		_store(effective_key, type, @value)
		AddMapElement(_cache(), effective_key)
		_cache()\type = type_

		Select type_
			Case #_TYPE_BYTE
				_cache()\value_b = value
			Case #_TYPE_UNSIGNED_BYTE
				_cache()\value_a = value
			Case #_TYPE_WORD
				_cache()\value_w = value
			Case #_TYPE_UNSIGNED_WORD
				_cache()\value_u = value
			Case #_TYPE_LONG
				_cache()\value_l = value
			Case #_TYPE_QUAD
				_cache()\value_q = value
			Case #_TYPE_FLOAT
				_cache()\value_f = value
			Case #_TYPE_DOUBLE
				_cache()\value_d = value
		EndSelect
	EndMacro
	
	Declare _store(key.s, type.b, *value)
	Declare _refresh_lru_list_if_necessary(key.s)
	Declare _move_to_front(key.s)
	Declare.boolean _remove_last_if_necessary()
	Declare store_item_str(domain.s, key.s, value.s)
	
	Global _max_size.l = 256
	Global _current_size.l = 0
	Global NewMap _cache._STRUCT_CACHE_ITEM()
	Global NewList _recent_used_items.s()
	
	Procedure store_byte(domain.s, key.s, value.b) : store_item(domain, key, value, #_TYPE_BYTE) : EndProcedure
	Procedure store_unsigned_byte(domain.s, key.s, value.a) : store_item(domain, key, value, #_TYPE_UNSIGNED_BYTE) : EndProcedure
	Procedure store_word(domain.s, key.s, value.w) : store_item(domain, key, value, #_TYPE_WORD) : EndProcedure
	Procedure store_unsigned_word(domain.s, key.s, value.u) : store_item(domain, key, value, #_TYPE_UNSIGNED_WORD) : EndProcedure
	Procedure store_long(domain.s, key.s, value.l) : store_item(domain, key, value, #_TYPE_LONG) : EndProcedure
	Procedure store_quad(domain.s, key.s, value.q) : store_item(domain, key, value, #_TYPE_QUAD) : EndProcedure
	Procedure store_float(domain.s, key.s, value.f) : store_item(domain, key, value, #_TYPE_FLOAT) : EndProcedure
	Procedure store_double(domain.s, key.s, value.d) : store_item(domain, key, value, #_TYPE_DOUBLE) : EndProcedure
	Procedure store_string(domain.s, key.s, value.s) : store_item_str(domain, key, value) : EndProcedure
	
	Procedure store_item_str(domain.s, key.s, value.s)
		effective_key.s = make_effective_key(domain, key)
		
		Logger::trace("Storing '" + key + "' and value " + value, __LOG__)
		_refresh_lru_list_if_necessary(effective_key)
		_store(effective_key, type, @value)
		AddMapElement(_cache(), effective_key)
		_cache()\type = #_TYPE_STRING
		_cache()\value_str = value
	EndProcedure
	
	Procedure.b get_byte(domain.s, key.s, default_.b=0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_b
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.a get_unsigned_byte(domain.s, key.s, default_.a=0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_a
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.w get_word(domain.s, key.s, default_.w=0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_w
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.u get_unsigned_word(domain.s, key.s, default_.u=0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_u
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.l get_long(domain.s, key.s, default_.l=0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_l
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.q get_quad(domain.s, key.s, default_.q=0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_q
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.f get_float(domain.s, key.s, default_.f=0.0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_f
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.d get_double(domain.s, key.s, default_.d=0.0)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_d
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure.s get_string(domain.s, key.s, default_.s="")
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			_move_to_front(effective_key)
			ProcedureReturn _cache()\value_str
		Else
			ProcedureReturn default_
		EndIf
	EndProcedure
	
	Procedure _store(key.s, type.b, *value)
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
		ForEach (_recent_used_items())
			If (_recent_used_items() = key)
				Break
			EndIf
		Next
		
		MoveElement(_recent_used_items(), #PB_List_First)
	EndProcedure
	
	Procedure.boolean _remove_last_if_necessary()
		If (_current_size >= _max_size)
			
			LastElement(_recent_used_items())
			DeleteMapElement(_cache(), _recent_used_items())
			DeleteElement(_recent_used_items())
			_current_size - 1
			
			ProcedureReturn true
		EndIf
		
		ProcedureReturn false
	EndProcedure
	
	Procedure.l get_max_size()
		ProcedureReturn _max_size
	EndProcedure
	
	Procedure set_max_size(size.l)
		_max_size = size
		
		While (_remove_last_if_necessary()) : Wend
	EndProcedure
	
	Procedure.boolean contains(domain.s, key.s)
		effective_key.s = make_effective_key(domain, key)
		
		If (FindMapElement(_cache(), effective_key))
			ProcedureReturn true
		EndIf
		
		ProcedureReturn false
	EndProcedure
EndModule


CompilerIf __IS_TESTING__
	Logger::setLogLevel(LogLevel::#_TRACE, LogOutlet::#_CONSOLE)
	
	LRUCache::store_byte("", "roger", 123)
	LRUCache::store_string("", "rogere", "solange")
	LRUCache::store_float("", "a_float", 3.14)
	
	Procedure __test_lru_cache()
		LRUCache::store_byte("", "patate", 124)
		LRUCache::store_string("", "raoul", "carlos")
		LRUCache::store_double("", "a_double", 4.343434)
		Define var.b = 125 
		Define var2.s = "raymonde"
		Define var3.f = 1.23
		LRUCache::store_byte("", "raymond", var)
		LRUCache::store_string("", "berangere", var2)
		LRUCache::store_float("", "b_float", var3)
	EndProcedure
	
	__test_lru_cache()
	
	Test::assert(Bool(LRUCache::get_byte("", "roger") = 123), "Stored byte")
	Test::assert(Bool(LRUCache::get_byte("", "patate") = 124), "Stored byte in procedure")
	Test::assert(Bool(LRUCache::get_byte("", "raymond") = 125), "Stored byte in procedure from variable")
	
	Test::assert(Bool(LRUCache::get_string("", "rogere") = "solange"), "Stored string")
	Test::assert(Bool(LRUCache::get_string("", "raoul") = "carlos"), "Stored string in procedure")
	Test::assert(Bool(LRUCache::get_string("", "berangere") = "raymonde"), "Stored string in procedure from variable")

	Test::assert(Bool(LRUCache::get_float("", "a_float") = 3.14), "Stored float")
	Test::assert(Bool(LRUCache::get_double("", "a_double") = 4.343434), "Stored float in procedure (a double actually)")
	Test::assert(Bool(LRUCache::get_float("", "b_float") = 1.23), "Stored float in procedure from variable")
CompilerEndIf