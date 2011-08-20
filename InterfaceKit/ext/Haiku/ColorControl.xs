#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::ColorControl

PROTOTYPES: DISABLE

SV*
BColorControl::new(start, layout, cellSize, name, ...)
	INPUT:
		BPoint start;
		color_control_layout layout;
		float cellSize;
		const char* name;
	INIT:
		BMessage* message = NULL;
		bool useOffscreen = false;
		BColorControl* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: start
		// item 2: layout
		// item 3: cellSize
		// item 4: name
		// item 5: message
		if (items > 5) {
			message = (BMessage*)get_cpp_object(ST(5));
		}
		must_not_delete_cpp_object(ST(5), true);
		// item 6: useOffscreen
		if (items > 6) {
			useOffscreen = SvTRUE(ST(6));
		}
		
		retval = new BColorControl(start, layout, cellSize, name, message, useOffscreen);
		
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
		BColorControl* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BColorControl(archive);
		
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
		BColorControl* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BColorControl");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BColorControl*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BColorControl::Instantiate(data)
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
BColorControl::Archive(...)
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
BColorControl::SetValueAsColor(color)
	INPUT:
		rgb_color color;
	CODE:
		// item 0: THIS
		// item 1: color
		
		THIS->SetValue(color);

void
BColorControl::SetValue(color_value)
	INPUT:
		int32 color_value;
	CODE:
		// item 0: THIS
		// item 1: color_value
		
		THIS->SetValue(color_value);

SV*
BColorControl::ValueAsColor()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ValueAsColor();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BColorControl::SetEnabled(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->SetEnabled(state);

void
BColorControl::SetCellSize(size)
	INPUT:
		float size;
	CODE:
		// item 0: THIS
		// item 1: size
		
		THIS->SetCellSize(size);

float
BColorControl::CellSize()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CellSize();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BColorControl::SetLayout(layout)
	INPUT:
		color_control_layout layout;
	CODE:
		// item 0: THIS
		// item 1: layout
		
		THIS->SetLayout(layout);

color_control_layout
BColorControl::Layout()
	INIT:
		color_control_layout retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Layout();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BColorControl::GetPreferredSize()
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
BColorControl::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

SV*
BColorControl::Invoke()
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
BColorControl::ResolveSpecifier(message, index, specifier, form, property)
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
BColorControl::GetSupportedSuites(data)
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
BColorControl::MakeFocus(...)
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
B_CELLS_4x64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CELLS_4x64);
		dualize(RETVAL, "B_CELLS_4x64");
	OUTPUT:
		RETVAL

SV*
B_CELLS_8x32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CELLS_8x32);
		dualize(RETVAL, "B_CELLS_8x32");
	OUTPUT:
		RETVAL

SV*
B_CELLS_16x16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CELLS_16x16);
		dualize(RETVAL, "B_CELLS_16x16");
	OUTPUT:
		RETVAL

SV*
B_CELLS_32x8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CELLS_32x8);
		dualize(RETVAL, "B_CELLS_32x8");
	OUTPUT:
		RETVAL

SV*
B_CELLS_64x4()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CELLS_64x4);
		dualize(RETVAL, "B_CELLS_64x4");
	OUTPUT:
		RETVAL

bool
BColorControl::operator_eq(object, swap)
	INPUT:
		BColorControl* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BColorControl::operator_ne(object, swap)
	INPUT:
		BColorControl* object;
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
		get_sv("Haiku::ColorControl::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::ColorControl::()", XS_Haiku__InterfaceKit_nil, file);

