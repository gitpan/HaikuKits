#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::CustomTextView

PROTOTYPES: DISABLE

SV*
Custom_BTextView::new(frame, name, textRect, resizingMode, flags)
	INPUT:
		BRect frame;
		const char* name;
		BRect textRect;
		uint32 resizingMode;
		uint32 flags;
	INIT:
		Custom_BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: textRect
		// item 4: resizingMode
		// item 5: flags
		
		retval = new Custom_BTextView(frame, name, textRect, resizingMode, flags);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
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
newWithFontAndColor(CLASS, frame, name, textRect, font, color, resizingMode, flags)
	INPUT:
		char* CLASS;
		BRect frame;
		const char* name;
		BRect textRect;
		BFont* font;
		rgb_color* color;
		uint32 resizingMode;
		uint32 flags;
	INIT:
		Custom_BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: textRect
		// item 4: font
		// item 5: color
		// item 6: resizingMode
		// item 7: flags
		
		retval = new Custom_BTextView(frame, name, textRect, font, color, resizingMode, flags);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
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
newWithoutFrame(CLASS, name, flags)
	INPUT:
		char* CLASS;
		const char* name;
		uint32 flags;
	INIT:
		Custom_BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: flags
		
		retval = new Custom_BTextView(name, flags);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
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
newWithFontAndColorAndNoFrame(CLASS, name, font, color, flags)
	INPUT:
		char* CLASS;
		const char* name;
		BFont* font;
		rgb_color* color;
		uint32 flags;
	INIT:
		Custom_BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: font
		// item 3: color
		// item 4: flags
		
		retval = new Custom_BTextView(name, font, color, flags);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
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
		Custom_BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new Custom_BTextView(archive);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
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
		Custom_BTextView* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for Custom_BTextView");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (Custom_BTextView*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
Custom_BTextView::operator_eq(object, swap)
	INPUT:
		Custom_BTextView* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
Custom_BTextView::operator_ne(object, swap)
	INPUT:
		Custom_BTextView* object;
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
		get_sv("Haiku::CustomTextView::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::CustomTextView::()", XS_Haiku__InterfaceKit_nil, file);

