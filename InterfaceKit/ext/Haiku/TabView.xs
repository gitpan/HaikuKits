#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::TabView

PROTOTYPES: DISABLE

SV*
BTabView::new(frame, name, ...)
	INPUT:
		BRect frame;
		const char* name;
	INIT:
		button_width width = B_WIDTH_AS_USUAL;
		uint32 resizingMode = B_FOLLOW_ALL;
		uint32 flags = B_FULL_UPDATE_ON_RESIZE | B_WILL_DRAW | B_NAVIGABLE_JUMP | B_FRAME_EVENTS | B_NAVIGABLE;
		BTabView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: width
		if (items > 3) {
			width = (button_width)SvIV(ST(3));
		}
		// item 4: resizingMode
		if (items > 4) {
			resizingMode = (uint32)SvUV(ST(4));
		}
		// item 5: flags
		if (items > 5) {
			flags = (uint32)SvUV(ST(5));
		}
		
		retval = new BTabView(frame, name, width, resizingMode, flags);
		
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
		button_width width = B_WIDTH_AS_USUAL;
		uint32 flags = B_FULL_UPDATE_ON_RESIZE | B_WILL_DRAW | B_NAVIGABLE_JUMP | B_FRAME_EVENTS | B_NAVIGABLE;
		BTabView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: width
		if (items > 2) {
			width = (button_width)SvIV(ST(2));
		}
		// item 3: flags
		if (items > 3) {
			flags = (uint32)SvUV(ST(3));
		}
		
		retval = new BTabView(name, width, flags);
		
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
		BTabView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BTabView(archive);
		
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
		BTabView* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BTabView");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BTabView*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BTabView::Instantiate(data)
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
BTabView::Archive(...)
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
BTabView::AllUnarchived(archive)
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
BTabView::Select(tab)
	INPUT:
		int32 tab;
	CODE:
		// item 0: THIS
		// item 1: tab
		
		THIS->Select(tab);

int32
BTabView::Selection()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Selection();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTabView::MakeFocus(...)
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
BTabView::SetFocusTab(tab, ...)
	INPUT:
		int32 tab;
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: tab
		// item 2: focused
		if (items > 2) {
			focused = SvTRUE(ST(2));
		}
		
		THIS->SetFocusTab(tab, focused);

int32
BTabView::FocusTab()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FocusTab();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BTabView::TabFrame(tab)
	INPUT:
		int32 tab;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: tab
		
		retval = THIS->TabFrame(tab);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTabView::SetFlags(flags)
	INPUT:
		uint32 flags;
	CODE:
		// item 0: THIS
		// item 1: flags
		
		THIS->SetFlags(flags);

void
BTabView::SetResizingMode(mode)
	INPUT:
		uint32 mode;
	CODE:
		// item 0: THIS
		// item 1: mode
		
		THIS->SetResizingMode(mode);

void
BTabView::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BTabView::GetPreferredSize()
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
BTabView::ResolveSpecifier(message, index, specifier, form, property)
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
BTabView::GetSupportedSuites(data)
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
BTabView::AddTab(target, ...)
	INPUT:
		BView* target;
	INIT:
		BTab* tab = NULL;
	CODE:
		// item 0: THIS
		// item 1: target
		// item 2: tab
		if (items > 2) {
			tab = (BTab*)get_cpp_object(ST(2));
		}
		
		THIS->AddTab(target, tab);

SV*
BTabView::RemoveTab(tabIndex)
	INPUT:
		int32 tabIndex;
	INIT:
		BTab* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: tabIndex
		
		retval = THIS->RemoveTab(tabIndex);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Tab", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BTabView::TabAt(index)
	INPUT:
		int32 index;
	INIT:
		BTab* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->TabAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Tab", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTabView::SetTabWidth(width)
	INPUT:
		button_width width;
	CODE:
		// item 0: THIS
		// item 1: width
		
		THIS->SetTabWidth(width);

button_width
BTabView::TabWidth()
	INIT:
		button_width retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TabWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTabView::SetTabHeight(height)
	INPUT:
		float height;
	CODE:
		// item 0: THIS
		// item 1: height
		
		THIS->SetTabHeight(height);

float
BTabView::TabHeight()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TabHeight();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTabView::SetBorder(style)
	INPUT:
		border_style style;
	CODE:
		// item 0: THIS
		// item 1: style
		
		THIS->SetBorder(style);

border_style
BTabView::Border()
	INIT:
		border_style retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Border();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BTabView::ContainerView()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ContainerView();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
BTabView::CountTabs()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountTabs();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BTabView::ViewForTab(tabIndex)
	INPUT:
		int32 tabIndex;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: tabIndex
		
		retval = THIS->ViewForTab(tabIndex);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
B_TAB_FIRST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TAB_FIRST);
		dualize(RETVAL, "B_TAB_FIRST");
	OUTPUT:
		RETVAL

SV*
B_TAB_FRONT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TAB_FRONT);
		dualize(RETVAL, "B_TAB_FRONT");
	OUTPUT:
		RETVAL

SV*
B_TAB_ANY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TAB_ANY);
		dualize(RETVAL, "B_TAB_ANY");
	OUTPUT:
		RETVAL

bool
BTabView::operator_eq(object, swap)
	INPUT:
		BTabView* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BTabView::operator_ne(object, swap)
	INPUT:
		BTabView* object;
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
		get_sv("Haiku::TabView::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::TabView::()", XS_Haiku__InterfaceKit_nil, file);

