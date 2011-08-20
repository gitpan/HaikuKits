#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Box

PROTOTYPES: DISABLE

SV*
BBox::new(frame, ...)
	INPUT:
		BRect frame;
	INIT:
		const char* name = NULL;
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS | B_NAVIGABLE_JUMP;
		border_style border = B_FANCY_BORDER;
		BBox* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		if (items > 2) {
			name = (const char*)SvPV_nolen(ST(2));
		}
		// item 3: resizingMode
		if (items > 3) {
			resizingMode = (uint32)SvUV(ST(3));
		}
		// item 4: flags
		if (items > 4) {
			flags = (uint32)SvUV(ST(4));
		}
		// item 5: border
		if (items > 5) {
			border = (border_style)SvIV(ST(5));
		}
		
		retval = new BBox(frame, name, resizingMode, flags, border);
		
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
newWithChildAndName(CLASS, ...)
	INPUT:
		char* CLASS;
	INIT:
		const char* name = NULL;
		uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS | B_NAVIGABLE_JUMP;
		border_style border = B_FANCY_BORDER;
		BView* child = NULL;
		BBox* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		if (items > 1) {
			name = (const char*)SvPV_nolen(ST(1));
		}
		// item 2: flags
		if (items > 2) {
			flags = (uint32)SvUV(ST(2));
		}
		// item 3: border
		if (items > 3) {
			border = (border_style)SvIV(ST(3));
		}
		// item 4: child
		if (items > 4) {
			child = (BView*)get_cpp_object(ST(4));
		}
		
		retval = new BBox(name, flags, border, child);
		
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
newWithChild(CLASS, ...)
	INPUT:
		char* CLASS;
	INIT:
		border_style border = B_FANCY_BORDER;
		BView* child = NULL;
		BBox* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: border
		if (items > 1) {
			border = (border_style)SvIV(ST(1));
		}
		// item 2: child
		if (items > 2) {
			child = (BView*)get_cpp_object(ST(2));
		}
		
		retval = new BBox(border, child);
		
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
		BBox* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BBox(archive);
		
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
		BBox* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BBox");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BBox*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BBox::Instantiate(data)
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
BBox::Archive(...)
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
BBox::SetBorder(border)
	INPUT:
		border_style border;
	CODE:
		// item 0: THIS
		// item 1: border
		
		THIS->SetBorder(border);

border_style
BBox::Border()
	INIT:
		border_style retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Border();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BBox::TopBorderOffset()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TopBorderOffset();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BBox::InnerFrame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->InnerFrame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BBox::SetLabel(string)
	INPUT:
		const char* string;
	CODE:
		// item 0: THIS
		// item 1: string
		
		THIS->SetLabel(string);

bool
BBox::SetLabelView(viewLabel)
	INPUT:
		BView* viewLabel;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: viewLabel
		
		retval = THIS->SetLabel(viewLabel);
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

const char*
BBox::Label()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Label();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BBox::LabelView()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->LabelView();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BBox::ResolveSpecifier(message, index, specifier, form, property)
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

void
BBox::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BBox::GetPreferredSize()
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
BBox::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

bool
BBox::GetSupportedSuites(data)
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
BBox::InvalidateLayout(...)
	INIT:
		bool descendants = false;
	CODE:
		// item 0: THIS
		// item 1: descendants
		if (items > 1) {
			descendants = SvTRUE(ST(1));
		}
		
		THIS->InvalidateLayout(descendants);

void
BBox::DoLayout()
	CODE:
		// item 0: THIS
		
		THIS->DoLayout();

bool
BBox::operator_eq(object, swap)
	INPUT:
		BBox* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BBox::operator_ne(object, swap)
	INPUT:
		BBox* object;
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
		get_sv("Haiku::Box::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Box::()", XS_Haiku__InterfaceKit_nil, file);

