#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info

PROTOTYPES: DISABLE

SV*
scroll_bar_info::new()
	INIT:
		scroll_bar_info* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new scroll_bar_info();
		
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
		scroll_bar_info* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for scroll_bar_info");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (scroll_bar_info*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info::proportional

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		RETVAL = boolSV(cpp_obj->proportional);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		cpp_obj->proportional = SvTRUE(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'scroll_bar_info::proportional'

SV*
proportional(THIS)
	INPUT:
		scroll_bar_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::scroll_bar_info::proportional", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::scroll_bar_info::proportional", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info::double_arrows

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		RETVAL = boolSV(cpp_obj->double_arrows);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		cpp_obj->double_arrows = SvTRUE(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'scroll_bar_info::double_arrows'

SV*
double_arrows(THIS)
	INPUT:
		scroll_bar_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::scroll_bar_info::double_arrows", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::scroll_bar_info::double_arrows", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info::knob

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->knob);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		cpp_obj->knob = (int32)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'scroll_bar_info::knob'

SV*
knob(THIS)
	INPUT:
		scroll_bar_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::scroll_bar_info::knob", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::scroll_bar_info::knob", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info::min_knob_size

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->min_knob_size);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		scroll_bar_info* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (scroll_bar_info*)SvIV(cpp_obj_sv);
		cpp_obj->min_knob_size = (int32)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::scroll_bar_info

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'scroll_bar_info::min_knob_size'

SV*
min_knob_size(THIS)
	INPUT:
		scroll_bar_info* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::scroll_bar_info::min_knob_size", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::scroll_bar_info::min_knob_size", TRUE)) |= CVf_LVALUE;

bool
scroll_bar_info::operator_eq(object, swap)
	INPUT:
		scroll_bar_info* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
scroll_bar_info::operator_ne(object, swap)
	INPUT:
		scroll_bar_info* object;
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
		get_sv("Haiku::scroll_bar_info::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::scroll_bar_info::()", XS_Haiku__InterfaceKit_nil, file);

