#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Alert

PROTOTYPES: DISABLE

SV*
BAlert::new(title, text, button0Label, ...)
	INPUT:
		const char* title;
		const char* text;
		const char* button0Label;
	INIT:
		const char* button1Label = NULL;
		const char* button2Label = NULL;
		button_width widthStyle = B_WIDTH_AS_USUAL;
		alert_type type = B_INFO_ALERT;
		BAlert* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: title
		// item 2: text
		// item 3: button0Label
		// item 4: button1Label
		if (items > 4) {
			button1Label = (const char*)SvPV_nolen(ST(4));
		}
		// item 5: button2Label
		if (items > 5) {
			button2Label = (const char*)SvPV_nolen(ST(5));
		}
		// item 6: widthStyle
		if (items > 6) {
			widthStyle = (button_width)SvIV(ST(6));
		}
		// item 7: type
		if (items > 7) {
			type = (alert_type)SvIV(ST(7));
		}
		
		retval = new BAlert(title, text, button0Label, button1Label, button2Label, widthStyle, type);
		
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
newWithSpacing(CLASS, title, text, button0Label, button1Label, button2Label, widthStyle, spacing, ...)
	INPUT:
		char* CLASS;
		const char* title;
		const char* text;
		const char* button0Label;
		const char* button1Label;
		const char* button2Label;
		button_width widthStyle;
		button_spacing spacing;
	INIT:
		alert_type type = B_INFO_ALERT;
		BAlert* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: title
		// item 2: text
		// item 3: button0Label
		// item 4: button1Label
		// item 5: button2Label
		// item 6: widthStyle
		// item 7: spacing
		// item 8: type
		if (items > 8) {
			type = (alert_type)SvIV(ST(8));
		}
		
		retval = new BAlert(title, text, button0Label, button1Label, button2Label, widthStyle, spacing, type);
		
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
newFromArchive(CLASS, archive)
	INPUT:
		char* CLASS;
		BMessage* archive;
	INIT:
		BAlert* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BAlert(archive);
		
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
		BAlert* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BAlert");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BAlert*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BAlert::Instantiate(data)
	INPUT:
		BMessage* data;
	INIT:
		BArchivable* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->Instantiate(data);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Archivable", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BAlert::Archive(...)
	INIT:
		BMessage* data;
		bool deep = true;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 2: deep
		if (items > 2) {
			deep = SvTRUE(ST(2));
		}
		
		retval = THIS->Archive(data, deep);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = create_perl_object((void*)data, "Haiku::Message", false);
		DUMPME(1,data_sv);
		RETVAL = newSVsv(data_sv);
		SvREFCNT_dec(data_sv);
	OUTPUT:
		RETVAL

void
BAlert::SetShortcut(index, shortcut)
	INPUT:
		int32 index;
		char shortcut;
	CODE:
		// item 0: THIS
		// item 1: index
		// item 2: shortcut
		
		THIS->SetShortcut(index, shortcut);

char
BAlert::Shortcut(index)
	INPUT:
		int32 index;
	INIT:
		char retval;
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->Shortcut(index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BAlert::Go()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Go();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BAlert::AsynchronousGo(invoker)
	INPUT:
		BInvoker* invoker;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: invoker
		
		retval = THIS->Go(invoker);
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

SV*
BAlert::ButtonAt(index)
	INPUT:
		uint32 index;
	INIT:
		BButton* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ButtonAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Button", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BAlert::TextView()
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->TextView();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::TextView", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BAlert::ResolveSpecifier(message, index, specifier, form, property)
	INPUT:
		BMessage* message;
		int32 index;
		BMessage* specifier;
		int32 form;
		const char* property;
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: index
		// item 3: specifier
		// item 4: form
		// item 5: property
		
		retval = THIS->ResolveSpecifier(message, index, specifier, form, property);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BAlert::GetSupportedSuites(data)
	INPUT:
		BMessage* data;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->GetSupportedSuites(data);
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

void
BAlert::DispatchMessage(message, handler)
	INPUT:
		BMessage* message;
		BHandler* handler;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: handler
		
		THIS->DispatchMessage(message, handler);

void
BAlert::Quit()
	CODE:
		// item 0: THIS
		
		THIS->Quit();

SV*
BAlert::AlertPosition(width, height)
	INPUT:
		float width;
		float height;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: width
		// item 2: height
		
		retval = THIS->AlertPosition(width, height);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
B_EMPTY_ALERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_EMPTY_ALERT);
		dualize(RETVAL, "B_EMPTY_ALERT");
	OUTPUT:
		RETVAL

SV*
B_INFO_ALERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_INFO_ALERT);
		dualize(RETVAL, "B_INFO_ALERT");
	OUTPUT:
		RETVAL

SV*
B_IDEA_ALERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_IDEA_ALERT);
		dualize(RETVAL, "B_IDEA_ALERT");
	OUTPUT:
		RETVAL

SV*
B_WARNING_ALERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WARNING_ALERT);
		dualize(RETVAL, "B_WARNING_ALERT");
	OUTPUT:
		RETVAL

SV*
B_STOP_ALERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STOP_ALERT);
		dualize(RETVAL, "B_STOP_ALERT");
	OUTPUT:
		RETVAL

SV*
B_EVEN_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_EVEN_SPACING);
		dualize(RETVAL, "B_EVEN_SPACING");
	OUTPUT:
		RETVAL

SV*
B_OFFSET_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OFFSET_SPACING);
		dualize(RETVAL, "B_OFFSET_SPACING");
	OUTPUT:
		RETVAL

bool
BAlert::operator_eq(object, swap)
	INPUT:
		BAlert* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BAlert::operator_ne(object, swap)
	INPUT:
		BAlert* object;
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
		get_sv("Haiku::Alert::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Alert::()", XS_Haiku__InterfaceKit_nil, file);

