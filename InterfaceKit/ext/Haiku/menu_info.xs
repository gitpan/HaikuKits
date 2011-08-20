#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

PROTOTYPES: DISABLE

SV*
menu_info::new()
	INIT:
		menu_info* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new menu_info();
		
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
		menu_info* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for menu_info");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (menu_info*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::font_size

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->font_size);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		cpp_obj->font_size = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::font_size'

SV*
font_size(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::font_size", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::font_size", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::f_family

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		STRLEN RETVAL_sv_length;
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		RETVAL = newSVpv((char*)cpp_obj->f_family, 0);	// 0 lets Perl calculate length
		
		RETVAL_sv_length = SvCUR(RETVAL);
		if (RETVAL_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			RETVAL_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(RETVAL, RETVAL_sv_length);
		}
		
		if (is_utf8_string((const U8*)cpp_obj->f_family, (STRLEN)RETVAL_sv_length)) {
			SvUTF8_on(RETVAL);
		}
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		STRLEN value_sv_length = SvCUR(value);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		
		if (value_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			char* last_char;
			value_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(value, value_sv_length);
			last_char = SvEND(value);	// pointer to last character
			*last_char = '\0';
		}
		
		memcpy((void*)&cpp_obj->f_family, (void*)SvPV(value, value_sv_length), value_sv_length);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::f_family'

SV*
f_family(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::f_family", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::f_family", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::f_style

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		STRLEN RETVAL_sv_length;
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		RETVAL = newSVpv((char*)cpp_obj->f_style, 0);	// 0 lets Perl calculate length
		
		RETVAL_sv_length = SvCUR(RETVAL);
		if (RETVAL_sv_length > B_FONT_STYLE_LENGTH + 1) {
			RETVAL_sv_length = B_FONT_STYLE_LENGTH + 1;
			SvCUR_set(RETVAL, RETVAL_sv_length);
		}
		
		if (is_utf8_string((const U8*)cpp_obj->f_style, (STRLEN)RETVAL_sv_length)) {
			SvUTF8_on(RETVAL);
		}
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		STRLEN value_sv_length = SvCUR(value);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		
		if (value_sv_length > B_FONT_STYLE_LENGTH + 1) {
			char* last_char;
			value_sv_length = B_FONT_STYLE_LENGTH + 1;
			SvCUR_set(value, value_sv_length);
			last_char = SvEND(value);	// pointer to last character
			*last_char = '\0';
		}
		
		memcpy((void*)&cpp_obj->f_style, (void*)SvPV(value, value_sv_length), value_sv_length);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::f_style'

SV*
f_style(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::f_style", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::f_style", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::background_color

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		sv_setsv(RETVAL, create_perl_object((void*)&cpp_obj->background_color, "Haiku::rgb_color", true));
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		must_not_delete_cpp_object(value, true);
		cpp_obj->background_color = *(rgb_color*)get_cpp_object(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::background_color'

SV*
background_color(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::background_color", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::background_color", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::separator

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->separator);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		cpp_obj->separator = (int32)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::separator'

SV*
separator(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::separator", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::separator", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::click_to_open

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		RETVAL = boolSV(cpp_obj->click_to_open);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		cpp_obj->click_to_open = SvTRUE(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::click_to_open'

SV*
click_to_open(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::click_to_open", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::click_to_open", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info::triggers_always_shown

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		RETVAL = boolSV(cpp_obj->triggers_always_shown);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		menu_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (menu_info*)SvIV(cpp_obj_sv);
		cpp_obj->triggers_always_shown = SvTRUE(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::menu_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'menu_info::triggers_always_shown'

SV*
triggers_always_shown(THIS)
	INPUT:
		menu_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::menu_info::triggers_always_shown", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::menu_info::triggers_always_shown", TRUE)) |= CVf_LVALUE;

bool
menu_info::operator_eq(object, swap)
	INPUT:
		menu_info* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
menu_info::operator_ne(object, swap)
	INPUT:
		menu_info* object;
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
		get_sv("Haiku::menu_info::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::menu_info::()", XS_Haiku__InterfaceKit_nil, file);

