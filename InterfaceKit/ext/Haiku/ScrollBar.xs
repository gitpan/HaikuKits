#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::ScrollBar

PROTOTYPES: DISABLE

SV*
BScrollBar::new(frame, name, target, min, max, direction)
	INPUT:
		BRect frame;
		const char* name;
		BView* target;
		float min;
		float max;
		orientation direction;
	INIT:
		BScrollBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: target
		// item 4: min
		// item 5: max
		// item 6: direction
		
		retval = new BScrollBar(frame, name, target, min, max, direction);
		
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
newWithoutFrame(CLASS, name, target, min, max, direction)
	INPUT:
		char* CLASS;
		const char* name;
		BView* target;
		float min;
		float max;
		orientation direction;
	INIT:
		BScrollBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: target
		// item 3: min
		// item 4: max
		// item 5: direction
		
		retval = new BScrollBar(name, target, min, max, direction);
		
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
		BScrollBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BScrollBar(archive);
		
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
		BScrollBar* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BScrollBar");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BScrollBar*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BScrollBar::Instantiate(data)
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
BScrollBar::Archive(...)
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
BScrollBar::SetValue(value)
	INPUT:
		float value;
	CODE:
		// item 0: THIS
		// item 1: value
		
		THIS->SetValue(value);

float
BScrollBar::Value()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Value();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BScrollBar::SetProportion(proportion)
	INPUT:
		float proportion;
	CODE:
		// item 0: THIS
		// item 1: proportion
		
		THIS->SetProportion(proportion);

float
BScrollBar::Proportion()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Proportion();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BScrollBar::SetRange(min, max)
	INPUT:
		float min;
		float max;
	CODE:
		// item 0: THIS
		// item 1: min
		// item 2: max
		
		THIS->SetRange(min, max);

void
BScrollBar::GetRange()
	INIT:
		float min;
		float max;
		SV* min_sv = newSV(0);	// retcount > 1
		SV* max_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetRange(&min, &max);
		sv_setnv(min_sv, (double)min);
		sv_setnv(max_sv, (double)max);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(min_sv));
		PUSHs(sv_2mortal(max_sv));

void
BScrollBar::SetSteps(smallStep, largeStep)
	INPUT:
		float smallStep;
		float largeStep;
	CODE:
		// item 0: THIS
		// item 1: smallStep
		// item 2: largeStep
		
		THIS->SetSteps(smallStep, largeStep);

void
BScrollBar::GetSteps()
	INIT:
		float smallStep;
		float largeStep;
		SV* smallStep_sv = newSV(0);	// retcount > 1
		SV* largeStep_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetSteps(&smallStep, &largeStep);
		sv_setnv(smallStep_sv, (double)smallStep);
		sv_setnv(largeStep_sv, (double)largeStep);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(smallStep_sv));
		PUSHs(sv_2mortal(largeStep_sv));

void
BScrollBar::SetTarget(target)
	INPUT:
		BView* target;
	CODE:
		// item 0: THIS
		// item 1: target
		
		THIS->SetTarget(target);

SV*
BScrollBar::Target()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Target();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BScrollBar::SetOrientation(direction)
	INPUT:
		orientation direction;
	CODE:
		// item 0: THIS
		// item 1: direction
		
		THIS->SetOrientation(direction);

orientation
BScrollBar::Orientation()
	INIT:
		orientation retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Orientation();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BScrollBar::SetBorderHighlighted(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->SetBorderHighlighted(state);

SV*
BScrollBar::ResolveSpecifier(message, index, specifier, form, property)
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
BScrollBar::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BScrollBar::GetPreferredSize()
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
BScrollBar::MakeFocus(...)
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
BScrollBar::GetSupportedSuites(data)
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
B_V_SCROLL_BAR_WIDTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_V_SCROLL_BAR_WIDTH);
		dualize(RETVAL, "B_V_SCROLL_BAR_WIDTH");
	OUTPUT:
		RETVAL

SV*
B_H_SCROLL_BAR_HEIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_H_SCROLL_BAR_HEIGHT);
		dualize(RETVAL, "B_H_SCROLL_BAR_HEIGHT");
	OUTPUT:
		RETVAL

SV*
SCROLL_BAR_MAXIMUM_KNOB_SIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)SCROLL_BAR_MAXIMUM_KNOB_SIZE);
		dualize(RETVAL, "SCROLL_BAR_MAXIMUM_KNOB_SIZE");
	OUTPUT:
		RETVAL

SV*
SCROLL_BAR_MINIMUM_KNOB_SIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)SCROLL_BAR_MINIMUM_KNOB_SIZE);
		dualize(RETVAL, "SCROLL_BAR_MINIMUM_KNOB_SIZE");
	OUTPUT:
		RETVAL

SV*
DISABLES_ON_WINDOW_DEACTIVATION()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)DISABLES_ON_WINDOW_DEACTIVATION);
		dualize(RETVAL, "DISABLES_ON_WINDOW_DEACTIVATION");
	OUTPUT:
		RETVAL

bool
BScrollBar::operator_eq(object, swap)
	INPUT:
		BScrollBar* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BScrollBar::operator_ne(object, swap)
	INPUT:
		BScrollBar* object;
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
		get_sv("Haiku::ScrollBar::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::ScrollBar::()", XS_Haiku__InterfaceKit_nil, file);

