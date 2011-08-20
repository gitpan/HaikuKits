#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

PROTOTYPES: DISABLE

SV*
overlay_rect_limits::new()
	INIT:
		overlay_rect_limits* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new overlay_rect_limits();
		
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
		overlay_rect_limits* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for overlay_rect_limits");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (overlay_rect_limits*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::horizontal_alignment

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->horizontal_alignment);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->horizontal_alignment = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::horizontal_alignment'

SV*
horizontal_alignment(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::horizontal_alignment", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::horizontal_alignment", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::vertical_alignment

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->vertical_alignment);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->vertical_alignment = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::vertical_alignment'

SV*
vertical_alignment(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::vertical_alignment", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::vertical_alignment", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::width_alignment

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->width_alignment);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->width_alignment = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::width_alignment'

SV*
width_alignment(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::width_alignment", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::width_alignment", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::height_alignment

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->height_alignment);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->height_alignment = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::height_alignment'

SV*
height_alignment(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::height_alignment", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::height_alignment", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::min_width

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->min_width);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->min_width = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::min_width'

SV*
min_width(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::min_width", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::min_width", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::max_width

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->max_width);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->max_width = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::max_width'

SV*
max_width(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::max_width", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::max_width", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::min_height

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->min_height);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->min_height = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::min_height'

SV*
min_height(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::min_height", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::min_height", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::max_height

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->max_height);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		cpp_obj->max_height = (int16)SvIV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::max_height'

SV*
max_height(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::max_height", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::max_height", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits::reserved

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		overlay_rect_limits* cpp_obj;
	CODE:
		AV* RETVAL_av;
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		//Converting C array 'cpp_obj->reserved' to Perl arg 'RETVAL'
		RETVAL_av = newAV();
		for (int i = 0; i < 8; i++) {
			SV* element_sv = newSV(0);
			sv_setiv(element_sv, (IV)cpp_obj->reserved[i]);
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
		overlay_rect_limits* cpp_obj;
	CODE:
		AV* value_av;
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (overlay_rect_limits*)SvIV(cpp_obj_sv);
		//Converting Perl arg 'value' to C array 'cpp_obj->reserved'
		value_av = (AV*)SvRV(value);
		for (int i = 0; i < 8; i++) {
			SV** element_sv = av_fetch(value_av, i, 0);
			if (element_sv == NULL) {
				cpp_obj->reserved[i] = 0;
				continue;
			}
			cpp_obj->reserved[i] = (int32)SvIV(*element_sv);
		}

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::overlay_rect_limits

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'overlay_rect_limits::reserved'

SV*
reserved(THIS)
	INPUT:
		overlay_rect_limits* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::overlay_rect_limits::reserved", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::overlay_rect_limits::reserved", TRUE)) |= CVf_LVALUE;

bool
overlay_rect_limits::operator_eq(object, swap)
	INPUT:
		overlay_rect_limits* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
overlay_rect_limits::operator_ne(object, swap)
	INPUT:
		overlay_rect_limits* object;
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
		get_sv("Haiku::overlay_rect_limits::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::overlay_rect_limits::()", XS_Haiku__InterfaceKit_nil, file);

