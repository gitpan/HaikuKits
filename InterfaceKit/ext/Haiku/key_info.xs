#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::key_info

PROTOTYPES: DISABLE

SV*
key_info::new()
	INIT:
		key_info* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new key_info();
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

# Note that this method is not prefixed by the class name.
#
# This is because if we prefix the class name the first argument is
# automatically converted into the THIS pointer, and we no longer have
# access to the Perl object. But we need that access in order to determine
# whether we're allowed to delete the C++ object, and to clean up the Perl
# object.
void
DESTROY(perl_obj)
	INPUT:
		SV* perl_obj;
	INIT:
		key_info* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for key_info");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (key_info*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::key_info::modifiers

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		key_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (key_info*)SvIV(cpp_obj_sv);
		sv_setuv(RETVAL, (UV)cpp_obj->modifiers);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		key_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (key_info*)SvIV(cpp_obj_sv);
		cpp_obj->modifiers = (uint32)SvUV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::key_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'key_info::modifiers'

SV*
modifiers(THIS)
	INPUT:
		key_info* THIS;
	INIT:
		SV* cpp_obj_sv;
		SV* tie_obj;
		HV* tie_obj_stash;
	CODE:
		RETVAL = newSV(0);
		// make our object into an SV* and make a reference to it
		cpp_obj_sv = newSViv((IV)THIS);	// do I need to make this mortal?
		tie_obj = newRV_noinc(cpp_obj_sv);
		
		// bless the reference into the proper class
		tie_obj_stash = gv_stashpv("Haiku::key_info::modifiers", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::key_info::modifiers", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::key_info::key_states

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		key_info* cpp_obj;
	CODE:
		AV* RETVAL_av;
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (key_info*)SvIV(cpp_obj_sv);
		//Converting C array 'cpp_obj->key_states' to Perl arg 'RETVAL'
		RETVAL_av = newAV();
		for (int i = 0; i < 16; i++) {
			SV* element_sv = newSV(0);
			sv_setuv(element_sv, (UV)cpp_obj->key_states[i]);
			av_push(RETVAL_av, element_sv);
		}
		RETVAL = newRV_noinc((SV*) RETVAL_av);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		key_info* cpp_obj;
	CODE:
		AV* value_av;
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (key_info*)SvIV(cpp_obj_sv);
		//Converting Perl arg 'value' to C array 'cpp_obj->key_states'
		value_av = (AV*)SvRV(value);
		for (int i = 0; i < 16; i++) {
			SV** element_sv = av_fetch(value_av, i, 0);
			if (element_sv == NULL) {
				cpp_obj->key_states[i] = 0;
				continue;
			}
			cpp_obj->key_states[i] = (uint8)SvUV(*element_sv);
		}

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::key_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'key_info::key_states'

SV*
key_states(THIS)
	INPUT:
		key_info* THIS;
	INIT:
		SV* cpp_obj_sv;
		SV* tie_obj;
		HV* tie_obj_stash;
	CODE:
		RETVAL = newSV(0);
		// make our object into an SV* and make a reference to it
		cpp_obj_sv = newSViv((IV)THIS);	// do I need to make this mortal?
		tie_obj = newRV_noinc(cpp_obj_sv);
		
		// bless the reference into the proper class
		tie_obj_stash = gv_stashpv("Haiku::key_info::key_states", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::key_info::key_states", TRUE)) |= CVf_LVALUE;

bool
key_info::operator_eq(object, swap)
	INPUT:
		key_info* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
key_info::operator_ne(object, swap)
	INPUT:
		key_info* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::key_info::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::key_info::()", XS_Haiku__InterfaceKit_nil, file);

