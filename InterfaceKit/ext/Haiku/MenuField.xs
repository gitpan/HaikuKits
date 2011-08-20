#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::MenuField

PROTOTYPES: DISABLE

SV*
BMenuField::new(frame, name, label, menu, ...)
	INPUT:
		BRect frame;
		const char* name;
		const char* label;
		BMenu* menu;
	INIT:
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BMenuField* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: label
		// item 4: menu
		// item 5: resizingMode
		if (items > 5) {
			resizingMode = (uint32)SvUV(ST(5));
		}
		// item 6: flags
		if (items > 6) {
			flags = (uint32)SvUV(ST(6));
		}
		
		retval = new BMenuField(frame, name, label, menu, resizingMode, flags);
		
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
newFixedSize(CLASS, frame, name, label, menu, fixedSize, ...)
	INPUT:
		char* CLASS;
		BRect frame;
		const char* name;
		const char* label;
		BMenu* menu;
		bool fixedSize;
	INIT:
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BMenuField* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: label
		// item 4: menu
		// item 5: fixedSize
		// item 6: resizingMode
		if (items > 6) {
			resizingMode = (uint32)SvUV(ST(6));
		}
		// item 7: flags
		if (items > 7) {
			flags = (uint32)SvUV(ST(7));
		}
		
		retval = new BMenuField(frame, name, label, menu, fixedSize, resizingMode, flags);
		
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
newWithoutFrame(CLASS, name, label, menu, ...)
	INPUT:
		char* CLASS;
		const char* name;
		const char* label;
		BMenu* menu;
	INIT:
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BMenuField* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: label
		// item 3: menu
		// item 4: flags
		if (items > 4) {
			flags = (uint32)SvUV(ST(4));
		}
		
		retval = new BMenuField(name, label, menu, flags);
		
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
newBareBones(CLASS, label, menu, ...)
	INPUT:
		char* CLASS;
		const char* label;
		BMenu* menu;
	INIT:
		uint32 flags = B_WILL_DRAW | B_NAVIGABLE;
		BMenuField* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: label
		// item 2: menu
		// item 3: flags
		if (items > 3) {
			flags = (uint32)SvUV(ST(3));
		}
		
		retval = new BMenuField(label, menu, flags);
		
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
		BMenuField* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BMenuField(archive);
		
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
		BMenuField* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMenuField");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMenuField*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BMenuField::Instantiate(data)
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
BMenuField::Archive(...)
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
BMenuField::AllArchived(archive)
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
BMenuField::AllUnarchived(archive)
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
BMenuField::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

SV*
BMenuField::Menu()
	INIT:
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Menu();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Menu", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenuField::MenuBar()
	INIT:
		BMenuBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->MenuBar();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuBar", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenuField::MenuItem()
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->MenuItem();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BMenuField::SetLabel(string)
	INPUT:
		const char* string;
	CODE:
		// item 0: THIS
		// item 1: string
		
		THIS->SetLabel(string);

const char*
BMenuField::Label()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Label();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenuField::SetEnabled(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->SetEnabled(enabled);

bool
BMenuField::IsEnabled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEnabled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenuField::SetAlignment(flag)
	INPUT:
		alignment flag;
	CODE:
		// item 0: THIS
		// item 1: flag
		
		THIS->SetAlignment(flag);

alignment
BMenuField::Alignment()
	INIT:
		alignment retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Alignment();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenuField::SetDivider(xCoordinate)
	INPUT:
		float xCoordinate;
	CODE:
		// item 0: THIS
		// item 1: xCoordinate
		
		THIS->SetDivider(xCoordinate);

float
BMenuField::Divider()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Divider();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenuField::ShowPopUpMarker()
	CODE:
		// item 0: THIS
		
		THIS->ShowPopUpMarker();

void
BMenuField::HidePopUpMarker()
	CODE:
		// item 0: THIS
		
		THIS->HidePopUpMarker();

SV*
BMenuField::ResolveSpecifier(message, index, specifier, form, property)
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
BMenuField::GetSupportedSuites(data)
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
BMenuField::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BMenuField::GetPreferredSize()
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
BMenuField::InvalidateLayout(...)
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
BMenuField::operator_eq(object, swap)
	INPUT:
		BMenuField* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BMenuField::operator_ne(object, swap)
	INPUT:
		BMenuField* object;
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
		get_sv("Haiku::MenuField::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::MenuField::()", XS_Haiku__InterfaceKit_nil, file);

