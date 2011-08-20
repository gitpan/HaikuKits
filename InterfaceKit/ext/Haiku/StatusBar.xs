#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::StatusBar

PROTOTYPES: DISABLE

SV*
BStatusBar::new(frame, name, ...)
	INPUT:
		BRect frame;
		const char* name;
	INIT:
		const char* label = NULL;
		const char* trailingLabel = NULL;
		BStatusBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: label
		if (items > 3) {
			label = (const char*)SvPV_nolen(ST(3));
		}
		// item 4: trailingLabel
		if (items > 4) {
			trailingLabel = (const char*)SvPV_nolen(ST(4));
		}
		
		retval = new BStatusBar(frame, name, label, trailingLabel);
		
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
newWithoutFrame(CLASS, name, ...)
	INPUT:
		char* CLASS;
		const char* name;
	INIT:
		const char* label = NULL;
		const char* trailingLabel = NULL;
		BStatusBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: label
		if (items > 2) {
			label = (const char*)SvPV_nolen(ST(2));
		}
		// item 3: trailingLabel
		if (items > 3) {
			trailingLabel = (const char*)SvPV_nolen(ST(3));
		}
		
		retval = new BStatusBar(name, label, trailingLabel);
		
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
		BStatusBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BStatusBar(archive);
		
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
		BStatusBar* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BStatusBar");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BStatusBar*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BStatusBar::Instantiate(data)
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
BStatusBar::Archive(...)
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
BStatusBar::MakeFocus(...)
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
BStatusBar::GetPreferredSize()
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
BStatusBar::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BStatusBar::SetBarColor(color)
	INPUT:
		rgb_color color;
	CODE:
		// item 0: THIS
		// item 1: color
		
		THIS->SetBarColor(color);

void
BStatusBar::SetBarHeight(height)
	INPUT:
		float height;
	CODE:
		// item 0: THIS
		// item 1: height
		
		THIS->SetBarHeight(height);

void
BStatusBar::SetText(string)
	INPUT:
		const char* string;
	CODE:
		// item 0: THIS
		// item 1: string
		
		THIS->SetText(string);

void
BStatusBar::SetTrailingText(string)
	INPUT:
		const char* string;
	CODE:
		// item 0: THIS
		// item 1: string
		
		THIS->SetTrailingText(string);

void
BStatusBar::SetMaxValue(max)
	INPUT:
		float max;
	CODE:
		// item 0: THIS
		// item 1: max
		
		THIS->SetMaxValue(max);

void
BStatusBar::Update(delta, ...)
	INPUT:
		float delta;
	INIT:
		const char* text = NULL;
		const char* trailingText = NULL;
	CODE:
		// item 0: THIS
		// item 1: delta
		// item 2: text
		if (items > 2) {
			text = (const char*)SvPV_nolen(ST(2));
		}
		// item 3: trailingText
		if (items > 3) {
			trailingText = (const char*)SvPV_nolen(ST(3));
		}
		
		THIS->Update(delta, text, trailingText);

void
BStatusBar::Reset(...)
	INIT:
		const char* text = NULL;
		const char* trailingText = NULL;
	CODE:
		// item 0: THIS
		// item 1: text
		if (items > 1) {
			text = (const char*)SvPV_nolen(ST(1));
		}
		// item 2: trailingText
		if (items > 2) {
			trailingText = (const char*)SvPV_nolen(ST(2));
		}
		
		THIS->Reset(text, trailingText);

void
BStatusBar::SetTo(value, ...)
	INPUT:
		float value;
	INIT:
		const char* text = NULL;
		const char* trailingText = NULL;
	CODE:
		// item 0: THIS
		// item 1: value
		// item 2: text
		if (items > 2) {
			text = (const char*)SvPV_nolen(ST(2));
		}
		// item 3: trailingText
		if (items > 3) {
			trailingText = (const char*)SvPV_nolen(ST(3));
		}
		
		THIS->SetTo(value, text, trailingText);

float
BStatusBar::CurrentValue()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CurrentValue();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BStatusBar::MaxValue()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->MaxValue();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BStatusBar::BarColor()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->BarColor();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

float
BStatusBar::BarHeight()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->BarHeight();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

const char*
BStatusBar::Text()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Text();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

const char*
BStatusBar::TrailingText()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TrailingText();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

const char*
BStatusBar::Label()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Label();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

const char*
BStatusBar::TrailingLabel()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TrailingLabel();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BStatusBar::ResolveSpecifier(message, index, specifier, form, property)
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
BStatusBar::GetSupportedSuites(data)
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

bool
BStatusBar::operator_eq(object, swap)
	INPUT:
		BStatusBar* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BStatusBar::operator_ne(object, swap)
	INPUT:
		BStatusBar* object;
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
		get_sv("Haiku::StatusBar::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::StatusBar::()", XS_Haiku__InterfaceKit_nil, file);

