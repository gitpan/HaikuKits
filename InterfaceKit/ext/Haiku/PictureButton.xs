#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::PictureButton

PROTOTYPES: DISABLE

SV*
BPictureButton::new(frame, name, off, on, message, ...)
	INPUT:
		BRect frame;
		const char* name;
		BPicture* off;
		BPicture* on;
		BMessage* message;
	INIT:
		uint32 behavior = B_ONE_STATE_BUTTON;
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BPictureButton* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: off
		// item 4: on
		// item 5: message
		must_not_delete_cpp_object(ST(5), true);
		// item 6: behavior
		if (items > 6) {
			behavior = (uint32)SvUV(ST(6));
		}
		// item 7: resizingMode
		if (items > 7) {
			resizingMode = (uint32)SvUV(ST(7));
		}
		// item 8: flags
		if (items > 8) {
			flags = (uint32)SvUV(ST(8));
		}
		
		retval = new BPictureButton(frame, name, off, on, message, behavior, resizingMode, flags);
		
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
		BPictureButton* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BPictureButton(archive);
		
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
		BPictureButton* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BPictureButton");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BPictureButton*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BPictureButton::Instantiate(data)
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
BPictureButton::Archive(...)
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
BPictureButton::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BPictureButton::GetPreferredSize()
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

void
BPictureButton::MakeFocus(...)
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
BPictureButton::SetEnabledOn(on)
	INPUT:
		BPicture* on;
	CODE:
		// item 0: THIS
		// item 1: on
		
		THIS->SetEnabledOn(on);

void
BPictureButton::SetEnabledOff(off)
	INPUT:
		BPicture* off;
	CODE:
		// item 0: THIS
		// item 1: off
		
		THIS->SetEnabledOff(off);

void
BPictureButton::SetDisabledOn(on)
	INPUT:
		BPicture* on;
	CODE:
		// item 0: THIS
		// item 1: on
		
		THIS->SetDisabledOn(on);

void
BPictureButton::SetDisabledOff(off)
	INPUT:
		BPicture* off;
	CODE:
		// item 0: THIS
		// item 1: off
		
		THIS->SetDisabledOff(off);

SV*
BPictureButton::EnabledOn()
	INIT:
		BPicture* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->EnabledOn();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Picture", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BPictureButton::EnabledOff()
	INIT:
		BPicture* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->EnabledOff();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Picture", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BPictureButton::DisabledOn()
	INIT:
		BPicture* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DisabledOn();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Picture", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BPictureButton::DisabledOff()
	INIT:
		BPicture* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DisabledOff();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Picture", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BPictureButton::SetBehavior(behavior)
	INPUT:
		uint32 behavior;
	CODE:
		// item 0: THIS
		// item 1: behavior
		
		THIS->SetBehavior(behavior);

uint32
BPictureButton::Behavior()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Behavior();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BPictureButton::SetValue(value)
	INPUT:
		int32 value;
	CODE:
		// item 0: THIS
		// item 1: value
		
		THIS->SetValue(value);

SV*
BPictureButton::Invoke()
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
BPictureButton::ResolveSpecifier(message, index, specifier, form, property)
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
BPictureButton::GetSupportedSuites(data)
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

SV*
B_ONE_STATE_BUTTON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ONE_STATE_BUTTON);
		dualize(RETVAL, "B_ONE_STATE_BUTTON");
	OUTPUT:
		RETVAL

SV*
B_TWO_STATE_BUTTON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TWO_STATE_BUTTON);
		dualize(RETVAL, "B_TWO_STATE_BUTTON");
	OUTPUT:
		RETVAL

bool
BPictureButton::operator_eq(object, swap)
	INPUT:
		BPictureButton* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BPictureButton::operator_ne(object, swap)
	INPUT:
		BPictureButton* object;
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
		get_sv("Haiku::PictureButton::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::PictureButton::()", XS_Haiku__InterfaceKit_nil, file);

