#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::CustomWindow

PROTOTYPES: DISABLE

SV*
Custom_BWindow::new(frame, title, type, flags, ...)
	INPUT:
		BRect frame;
		const char* title;
		window_type type;
		uint32 flags;
	INIT:
		uint32 workspaces = B_CURRENT_WORKSPACE;
		Custom_BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: title
		// item 3: type
		// item 4: flags
		// item 5: workspaces
		if (items > 5) {
			workspaces = (uint32)SvUV(ST(5));
		}
		
		retval = new Custom_BWindow(frame, title, type, flags, workspaces);
		
		retval_sv = create_perl_object((void*)retval, CLASS, true);
		retval->perl_link_data = get_link_data(retval_sv);
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
newFromLookAndFeel(CLASS, frame, title, look, feel, flags, ...)
	INPUT:
		char* CLASS;
		BRect frame;
		const char* title;
		window_look look;
		window_feel feel;
		uint32 flags;
	INIT:
		uint32 workspaces = B_CURRENT_WORKSPACE;
		Custom_BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: title
		// item 3: look
		// item 4: feel
		// item 5: flags
		// item 6: workspaces
		if (items > 6) {
			workspaces = (uint32)SvUV(ST(6));
		}
		
		retval = new Custom_BWindow(frame, title, look, feel, flags, workspaces);
		
		retval_sv = create_perl_object((void*)retval, CLASS, true);
		retval->perl_link_data = get_link_data(retval_sv);
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
newFromArchive(CLASS, archive)
	INPUT:
		char* CLASS;
		BMessage* archive;
	INIT:
		Custom_BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new Custom_BWindow(archive);
		
		retval_sv = create_perl_object((void*)retval, CLASS, true);
		retval->perl_link_data = get_link_data(retval_sv);
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
		Custom_BWindow* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for Custom_BWindow");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (Custom_BWindow*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
Custom_BWindow::operator_eq(object, swap)
	INPUT:
		Custom_BWindow* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
Custom_BWindow::operator_ne(object, swap)
	INPUT:
		Custom_BWindow* object;
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
		get_sv("Haiku::CustomWindow::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::CustomWindow::()", XS_Haiku__InterfaceKit_nil, file);

