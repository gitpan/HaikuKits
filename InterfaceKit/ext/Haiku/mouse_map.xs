#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::mouse_map

PROTOTYPES: DISABLE

SV*
mouse_map::new()
	INIT:
		mouse_map* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new mouse_map();
		
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
		mouse_map* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for mouse_map");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (mouse_map*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::mouse_map::button

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		mouse_map* cpp_obj;
	CODE:
		AV* RETVAL_av;
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (mouse_map*)SvIV(cpp_obj_sv);
		//Converting C array 'cpp_obj->button' to Perl arg 'RETVAL'
		RETVAL_av = newAV();
		for (int i = 0; i < B_MAX_MOUSE_BUTTONS; i++) {
			SV* element_sv = newSV(0);
			sv_setuv(element_sv, (UV)cpp_obj->button[i]);
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
		mouse_map* cpp_obj;
	CODE:
		AV* value_av;
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (mouse_map*)SvIV(cpp_obj_sv);
		//Converting Perl arg 'value' to C array 'cpp_obj->button'
		value_av = (AV*)SvRV(value);
		for (int i = 0; i < B_MAX_MOUSE_BUTTONS; i++) {
			SV** element_sv = av_fetch(value_av, i, 0);
			if (element_sv == NULL) {
				cpp_obj->button[i] = 0;
				continue;
			}
			cpp_obj->button[i] = (uint32)SvUV(*element_sv);
		}

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::mouse_map

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'mouse_map::button'

SV*
button(THIS)
	INPUT:
		mouse_map* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::mouse_map::button", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::mouse_map::button", TRUE)) |= CVf_LVALUE;

bool
mouse_map::operator_eq(object, swap)
	INPUT:
		mouse_map* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
mouse_map::operator_ne(object, swap)
	INPUT:
		mouse_map* object;
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
		get_sv("Haiku::mouse_map::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::mouse_map::()", XS_Haiku__InterfaceKit_nil, file);

