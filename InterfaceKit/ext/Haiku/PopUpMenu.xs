#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::PopUpMenu

PROTOTYPES: DISABLE

SV*
BPopUpMenu::new(name, ...)
	INPUT:
		const char* name;
	INIT:
		bool radioMode = true;
		bool labelFromMarked = true;
		menu_layout layout = B_ITEMS_IN_COLUMN;
		BPopUpMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: radioMode
		if (items > 2) {
			radioMode = SvTRUE(ST(2));
		}
		// item 3: labelFromMarked
		if (items > 3) {
			labelFromMarked = SvTRUE(ST(3));
		}
		// item 4: layout
		if (items > 4) {
			layout = (menu_layout)SvIV(ST(4));
		}
		
		retval = new BPopUpMenu(name, radioMode, labelFromMarked, layout);
		
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
		BPopUpMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BPopUpMenu(archive);
		
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
		BPopUpMenu* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BPopUpMenu");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BPopUpMenu*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BPopUpMenu::Instantiate(data)
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
BPopUpMenu::Archive(...)
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

SV*
BPopUpMenu::Go(screenPoint, ...)
	INPUT:
		BPoint screenPoint;
	INIT:
		bool deliversMessage = false;
		bool openAnyway = false;
		bool asynchronous = false;
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: screenPoint
		// item 2: deliversMessage
		if (items > 2) {
			deliversMessage = SvTRUE(ST(2));
		}
		// item 3: openAnyway
		if (items > 3) {
			openAnyway = SvTRUE(ST(3));
		}
		// item 4: asynchronous
		if (items > 4) {
			asynchronous = SvTRUE(ST(4));
		}
		
		retval = THIS->Go(screenPoint, deliversMessage, openAnyway, asynchronous);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BPopUpMenu::GoWithClickRect(screenPoint, deliversMessage, openAnyway, clickToOpenRect, ...)
	INPUT:
		BPoint screenPoint;
		bool deliversMessage;
		bool openAnyway;
		BRect clickToOpenRect;
	INIT:
		bool asynchronous = false;
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: screenPoint
		// item 2: deliversMessage
		// item 3: openAnyway
		// item 4: clickToOpenRect
		// item 5: asynchronous
		if (items > 5) {
			asynchronous = SvTRUE(ST(5));
		}
		
		retval = THIS->Go(screenPoint, deliversMessage, openAnyway, clickToOpenRect, asynchronous);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BPopUpMenu::ResolveSpecifier(message, index, specifier, form, property)
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
BPopUpMenu::GetSupportedSuites(data)
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
BPopUpMenu::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BPopUpMenu::GetPreferredSize()
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
BPopUpMenu::SetAsyncAutoDestruct(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->SetAsyncAutoDestruct(state);

bool
BPopUpMenu::AsyncAutoDestruct()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->AsyncAutoDestruct();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BPopUpMenu::operator_eq(object, swap)
	INPUT:
		BPopUpMenu* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BPopUpMenu::operator_ne(object, swap)
	INPUT:
		BPopUpMenu* object;
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
		get_sv("Haiku::PopUpMenu::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::PopUpMenu::()", XS_Haiku__InterfaceKit_nil, file);

