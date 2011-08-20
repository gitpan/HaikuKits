#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::TextControl

PROTOTYPES: DISABLE

SV*
BTextControl::new(frame, name, label, text, message, ...)
	INPUT:
		BRect frame;
		const char* name;
		const char* label;
		const char* text;
		BMessage* message;
	INIT:
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BTextControl* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: label
		// item 4: text
		// item 5: message
		must_not_delete_cpp_object(ST(5), true);
		// item 6: resizingMode
		if (items > 6) {
			resizingMode = (uint32)SvUV(ST(6));
		}
		// item 7: flags
		if (items > 7) {
			flags = (uint32)SvUV(ST(7));
		}
		
		retval = new BTextControl(frame, name, label, text, message, resizingMode, flags);
		
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
newWithoutFrame(CLASS, name, label, text, message, ...)
	INPUT:
		char* CLASS;
		const char* name;
		const char* label;
		const char* text;
		BMessage* message;
	INIT:
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BTextControl* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: label
		// item 3: text
		// item 4: message
		must_not_delete_cpp_object(ST(4), true);
		// item 5: flags
		if (items > 5) {
			flags = (uint32)SvUV(ST(5));
		}
		
		retval = new BTextControl(name, label, text, message, flags);
		
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
newBareBones(CLASS, label, text, message)
	INPUT:
		char* CLASS;
		const char* label;
		const char* text;
		BMessage* message;
	INIT:
		BTextControl* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: label
		// item 2: text
		// item 3: message
		must_not_delete_cpp_object(ST(3), true);
		
		retval = new BTextControl(label, text, message);
		
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
		BTextControl* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BTextControl(archive);
		
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
		BTextControl* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BTextControl");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BTextControl*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BTextControl::Instantiate(data)
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
BTextControl::Archive(...)
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

bool
BTextControl::AllArchived(archive)
	INPUT:
		BMessage* archive;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->AllArchived(archive);
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
BTextControl::AllUnarchived(archive)
	INPUT:
		BMessage* archive;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->AllUnarchived(archive);
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
BTextControl::SetText(text)
	INPUT:
		const char* text;
	CODE:
		// item 0: THIS
		// item 1: text
		
		THIS->SetText(text);

const char*
BTextControl::Text()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Text();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextControl::SetValue(value)
	INPUT:
		int32 value;
	CODE:
		// item 0: THIS
		// item 1: value
		
		THIS->SetValue(value);

SV*
BTextControl::Invoke()
	INIT:
		BMessage* message = NULL;
		status_t retval;
		SV* error_sv;
		SV* message_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Invoke(message);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		message_sv = create_perl_object((void*)message, "Haiku::Message", false);
		DUMPME(1,message_sv);
		RETVAL = newSVsv(message_sv);
		SvREFCNT_dec(message_sv);
	OUTPUT:
		RETVAL

SV*
BTextControl::TextView()
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->TextView();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::TextView", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTextControl::SetModificationMessage(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		
		THIS->SetModificationMessage(message);

SV*
BTextControl::ModificationMessage()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ModificationMessage();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTextControl::SetAlignment(forLabel, forText)
	INPUT:
		alignment forLabel;
		alignment forText;
	CODE:
		// item 0: THIS
		// item 1: forLabel
		// item 2: forText
		
		THIS->SetAlignment(forLabel, forText);

void
BTextControl::GetAlignment()
	INIT:
		alignment forLabel;
		alignment forText;
		SV* forLabel_sv = newSV(0);	// retcount > 1
		SV* forText_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetAlignment(&forLabel, &forText);
		sv_setiv(forLabel_sv, (IV)forLabel);
		sv_setiv(forText_sv, (IV)forText);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(forLabel_sv));
		PUSHs(sv_2mortal(forText_sv));

void
BTextControl::SetDivider(xCoordinate)
	INPUT:
		float xCoordinate;
	CODE:
		// item 0: THIS
		// item 1: xCoordinate
		
		THIS->SetDivider(xCoordinate);

float
BTextControl::Divider()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Divider();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextControl::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

void
BTextControl::SetEnabled(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->SetEnabled(enabled);

void
BTextControl::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BTextControl::GetPreferredSize()
	INIT:
		float width;
		float height;
		SV* width_sv = newSV(0);	// retcount > 1
		SV* height_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetPreferredSize(&width, &height);
		sv_setnv(width_sv, (double)width);
		sv_setnv(height_sv, (double)height);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(width_sv));
		PUSHs(sv_2mortal(height_sv));

SV*
BTextControl::ResolveSpecifier(message, index, specifier, form, property)
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
BTextControl::GetSupportedSuites(data)
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
BTextControl::InvalidateLayout(...)
	INIT:
		bool descendants = false;
	CODE:
		// item 0: THIS
		// item 1: descendants
		if (items > 1) {
			descendants = SvTRUE(ST(1));
		}
		
		THIS->InvalidateLayout(descendants);

bool
BTextControl::operator_eq(object, swap)
	INPUT:
		BTextControl* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BTextControl::operator_ne(object, swap)
	INPUT:
		BTextControl* object;
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
		get_sv("Haiku::TextControl::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::TextControl::()", XS_Haiku__InterfaceKit_nil, file);

