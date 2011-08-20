#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Point

PROTOTYPES: DISABLE

SV*
BPoint::new(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BPoint* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: x
		// item 2: y
		
		retval = new BPoint(x, y);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

# Note that this method is not prefixed by the class name.
#
# This is because for prefixed methods, xsubpp will turn the first perl
# argument into the CLASS variable (a char*) if the method name is 'new',
# and into the THIS variable (the object pointer) otherwise. So we need to
# trick xsubbpp by leaving off the prefix and defining CLASS ourselves
SV*
newFromPoint(CLASS, point)
	INPUT:
		char* CLASS;
		BPoint point;
	INIT:
		BPoint* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: point
		
		retval = new BPoint(point);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

# Note that this method is not prefixed by the class name.
#
# This is because for prefixed methods, xsubpp will turn the first perl
# argument into the CLASS variable (a char*) if the method name is 'new',
# and into the THIS variable (the object pointer) otherwise. So we need to
# trick xsubbpp by leaving off the prefix and defining CLASS ourselves
SV*
newEmpty(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BPoint* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BPoint();
		
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
		BPoint* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BPoint");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BPoint*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

void
BPoint::Set(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->Set(x, y);

void
BPoint::ConstrainTo(rect)
	INPUT:
		BRect rect;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		THIS->ConstrainTo(rect);

void
BPoint::PrintToStream()
	CODE:
		// item 0: THIS
		
		THIS->PrintToStream();

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Point::x

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BPoint* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BPoint*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->x);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BPoint* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BPoint*)SvIV(cpp_obj_sv);
		cpp_obj->x = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Point

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BPoint::x'

SV*
x(THIS)
	INPUT:
		BPoint* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::Point::x", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Point::x", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Point::y

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BPoint* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BPoint*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->y);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BPoint* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BPoint*)SvIV(cpp_obj_sv);
		cpp_obj->y = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Point

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BPoint::y'

SV*
y(THIS)
	INPUT:
		BPoint* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::Point::y", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Point::y", TRUE)) |= CVf_LVALUE;

SV*
BPoint::operator_neg(object, swap)
	INPUT:
		SV* object;	// don't try to convert it
		IV swap;
	OVERLOAD: neg
	CODE:
		BPoint* result = new BPoint();
		*result = -*THIS;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::Point"));
	OUTPUT:
		RETVAL

bool
BPoint::operator_eq(object, swap)
	INPUT:
		BPoint object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BPoint::operator_ne(object, swap)
	INPUT:
		BPoint object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

SV*
BPoint::operator_add(object, swap)
	INPUT:
		BPoint object;
		IV swap;
	OVERLOAD: +
	CODE:
		BPoint* result;
		*result = *THIS + object;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::Point"));
	OUTPUT:
		RETVAL

SV*
BPoint::operator_sub(object, swap)
	INPUT:
		BPoint object;
		IV swap;
	OVERLOAD: -
	CODE:
		BPoint* result;
		*result = *THIS - object;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::Point"));
	OUTPUT:
		RETVAL

SV*
BPoint::operator_iadd(object, swap)
	INPUT:
		BPoint object;
		IV swap;
	OVERLOAD: +=
	CODE:
		*THIS += object;
		RETVAL = ST(0);
		SvREFCNT_inc(RETVAL);	// so it can safely pass through the stack
	OUTPUT:
		RETVAL

SV*
BPoint::operator_isub(object, swap)
	INPUT:
		BPoint object;
		IV swap;
	OVERLOAD: -=
	CODE:
		*THIS -= object;
		RETVAL = ST(0);
		SvREFCNT_inc(RETVAL);	// so it can safely pass through the stack
	OUTPUT:
		RETVAL

SV*
B_ORIGIN()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ORIGIN, "Haiku::Point", true));
		dualize(RETVAL, "B_ORIGIN");
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Point::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Point::()", XS_Haiku__InterfaceKit_nil, file);

