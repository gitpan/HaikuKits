#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Screen

PROTOTYPES: DISABLE

SV*
BScreen::new(...)
	INIT:
		screen_id id = B_MAIN_SCREEN_ID;
		BScreen* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: id
		if (items > 1) {
			id = *(screen_id*)get_cpp_object(ST(1));
		}
		
		retval = new BScreen(id);
		
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
newForWindow(CLASS, window)
	INPUT:
		char* CLASS;
		BWindow* window;
	INIT:
		BScreen* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: window
		
		retval = new BScreen(window);
		
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
		BScreen* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BScreen");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BScreen*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BScreen::IsValid()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsValid();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BScreen::SetToNext()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->SetToNext();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

color_space
BScreen::ColorSpace()
	INIT:
		color_space retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->ColorSpace();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BScreen::Frame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Frame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BScreen::ID()
	INIT:
		screen_id retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ID();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::screen_id", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BScreen::WaitForRetrace()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->WaitForRetrace();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BScreen::WaitForRetraceWithTimeout(timeout)
	INPUT:
		bigtime_t timeout;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: timeout
		
		retval = THIS->WaitForRetrace(timeout);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

uint8
BScreen::IndexForColor(color)
	INPUT:
		rgb_color color;
	INIT:
		uint8 retval;
	CODE:
		// item 0: THIS
		// item 1: color
		
		retval = THIS->IndexForColor(color);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint8
BScreen::IndexForColorFromRGB(red, green, blue, ...)
	INPUT:
		uint8 red;
		uint8 green;
		uint8 blue;
	INIT:
		uint8 alpha = 255;
		uint8 retval;
	CODE:
		// item 0: THIS
		// item 1: red
		// item 2: green
		// item 3: blue
		// item 4: alpha
		if (items > 4) {
			alpha = (uint8)SvUV(ST(4));
		}
		
		retval = THIS->IndexForColor(red, green, blue, alpha);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BScreen::ColorForIndex(index)
	INPUT:
		uint8 index;
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ColorForIndex(index);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

uint8
BScreen::InvertIndex(index)
	INPUT:
		uint8 index;
	INIT:
		uint8 retval;
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->InvertIndex(index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BScreen::ColorMap()
	INIT:
		const color_map* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ColorMap();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::color_map", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BScreen::DesktopColor()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DesktopColor();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BScreen::DesktopColorForIndex(index)
	INPUT:
		uint32 index;
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->DesktopColor(index);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BScreen::SetDesktopColor(color, ...)
	INPUT:
		rgb_color color;
	INIT:
		bool makeDefault = true;
	CODE:
		// item 0: THIS
		// item 1: color
		// item 2: makeDefault
		if (items > 2) {
			makeDefault = SvTRUE(ST(2));
		}
		
		THIS->SetDesktopColor(color, makeDefault);

void
BScreen::SetDesktopColorForIndex(color, index, ...)
	INPUT:
		rgb_color color;
		uint32 index;
	INIT:
		bool makeDefault = true;
	CODE:
		// item 0: THIS
		// item 1: color
		// item 2: index
		// item 3: makeDefault
		if (items > 3) {
			makeDefault = SvTRUE(ST(3));
		}
		
		THIS->SetDesktopColor(color, index, makeDefault);

bool
BScreen::SetDPMS(state)
	INPUT:
		uint32 state;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: state
		
		retval = THIS->SetDPMS(state);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

uint32
BScreen::DPMSState()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->DPMSState();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint32
BScreen::DPMSCapabilities()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->DPMSCapabilites();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BScreen::operator_eq(object, swap)
	INPUT:
		BScreen* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BScreen::operator_ne(object, swap)
	INPUT:
		BScreen* object;
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
		get_sv("Haiku::Screen::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Screen::()", XS_Haiku__InterfaceKit_nil, file);

