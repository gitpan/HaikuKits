#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::MenuBar

PROTOTYPES: DISABLE

SV*
BMenuBar::new(frame, name, ...)
	INPUT:
		BRect frame;
		const char* name;
	INIT:
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		menu_layout layout = B_ITEMS_IN_ROW;
		bool resizeToFit = true;
		BMenuBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: resizingMode
		if (items > 3) {
			resizingMode = (uint32)SvUV(ST(3));
		}
		// item 4: layout
		if (items > 4) {
			layout = (menu_layout)SvIV(ST(4));
		}
		// item 5: resizeToFit
		if (items > 5) {
			resizeToFit = SvTRUE(ST(5));
		}
		
		retval = new BMenuBar(frame, name, resizingMode, layout, resizeToFit);
		
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
		menu_layout layout = B_ITEMS_IN_ROW;
		uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS;
		BMenuBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: layout
		if (items > 2) {
			layout = (menu_layout)SvIV(ST(2));
		}
		// item 3: flags
		if (items > 3) {
			flags = (uint32)SvUV(ST(3));
		}
		
		retval = new BMenuBar(name, layout, flags);
		
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
		BMenuBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BMenuBar(archive);
		
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
		BMenuBar* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMenuBar");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMenuBar*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BMenuBar::Instantiate(data)
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
BMenuBar::Archive(...)
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
BMenuBar::MakeFocus(...)
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
BMenuBar::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BMenuBar::GetPreferredSize()
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
BMenuBar::Show()
	CODE:
		// item 0: THIS
		
		THIS->Show();

void
BMenuBar::Hide()
	CODE:
		// item 0: THIS
		
		THIS->Hide();

SV*
BMenuBar::ResolveSpecifier(message, index, specifier, form, property)
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
BMenuBar::GetSupportedSuites(data)
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
BMenuBar::SetBorder(border)
	INPUT:
		menu_bar_border border;
	CODE:
		// item 0: THIS
		// item 1: border
		
		THIS->SetBorder(border);

menu_bar_border
BMenuBar::Border()
	INIT:
		menu_bar_border retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Border();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
B_BORDER_FRAME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BORDER_FRAME);
		dualize(RETVAL, "B_BORDER_FRAME");
	OUTPUT:
		RETVAL

SV*
B_BORDER_CONTENTS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BORDER_CONTENTS);
		dualize(RETVAL, "B_BORDER_CONTENTS");
	OUTPUT:
		RETVAL

SV*
B_BORDER_EACH_ITEM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BORDER_EACH_ITEM);
		dualize(RETVAL, "B_BORDER_EACH_ITEM");
	OUTPUT:
		RETVAL

bool
BMenuBar::operator_eq(object, swap)
	INPUT:
		BMenuBar* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BMenuBar::operator_ne(object, swap)
	INPUT:
		BMenuBar* object;
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
		get_sv("Haiku::MenuBar::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::MenuBar::()", XS_Haiku__InterfaceKit_nil, file);

