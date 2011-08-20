#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Slider

PROTOTYPES: DISABLE

SV*
BSlider::new(frame, name, label, message, minValue, maxValue, ...)
	INPUT:
		BRect frame;
		const char* name;
		const char* label;
		BMessage* message;
		int32 minValue;
		int32 maxValue;
	INIT:
		thumb_style thumbType = B_BLOCK_THUMB;
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_NAVIGABLE | B_WILL_DRAW | B_FRAME_EVENTS;
		BSlider* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: label
		// item 4: message
		must_not_delete_cpp_object(ST(4), true);
		// item 5: minValue
		// item 6: maxValue
		// item 7: thumbType
		if (items > 7) {
			thumbType = (thumb_style)SvIV(ST(7));
		}
		// item 8: resizingMode
		if (items > 8) {
			resizingMode = (uint32)SvUV(ST(8));
		}
		// item 9: flags
		if (items > 9) {
			flags = (uint32)SvUV(ST(9));
		}
		
		retval = new BSlider(frame, name, label, message, minValue, maxValue, thumbType, resizingMode, flags);
		
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
newWithOrientation(CLASS, frame, name, label, message, minValue, maxValue, posture, ...)
	INPUT:
		char* CLASS;
		BRect frame;
		const char* name;
		const char* label;
		BMessage* message;
		int32 minValue;
		int32 maxValue;
		orientation posture;
	INIT:
		thumb_style thumbType = B_BLOCK_THUMB;
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_NAVIGABLE | B_WILL_DRAW | B_FRAME_EVENTS;
		BSlider* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: label
		// item 4: message
		must_not_delete_cpp_object(ST(4), true);
		// item 5: minValue
		// item 6: maxValue
		// item 7: posture
		// item 8: thumbType
		if (items > 8) {
			thumbType = (thumb_style)SvIV(ST(8));
		}
		// item 9: resizingMode
		if (items > 9) {
			resizingMode = (uint32)SvUV(ST(9));
		}
		// item 10: flags
		if (items > 10) {
			flags = (uint32)SvUV(ST(10));
		}
		
		retval = new BSlider(frame, name, label, message, minValue, maxValue, posture, thumbType, resizingMode, flags);
		
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
newWithoutFrame(CLASS, name, label, message, minValue, maxValue, posture, ...)
	INPUT:
		char* CLASS;
		const char* name;
		const char* label;
		BMessage* message;
		int32 minValue;
		int32 maxValue;
		orientation posture;
	INIT:
		thumb_style thumbType = B_BLOCK_THUMB;
		uint32 flags = B_NAVIGABLE | B_WILL_DRAW | B_FRAME_EVENTS;
		BSlider* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: label
		// item 3: message
		must_not_delete_cpp_object(ST(3), true);
		// item 4: minValue
		// item 5: maxValue
		// item 6: posture
		// item 7: thumbType
		if (items > 7) {
			thumbType = (thumb_style)SvIV(ST(7));
		}
		// item 8: flags
		if (items > 8) {
			flags = (uint32)SvUV(ST(8));
		}
		
		retval = new BSlider(name, label, message, minValue, maxValue, posture, thumbType, flags);
		
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
		BSlider* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BSlider(archive);
		
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
		BSlider* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BSlider");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BSlider*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BSlider::Instantiate(data)
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
BSlider::Archive(...)
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
BSlider::SetLabel(label)
	INPUT:
		const char* label;
	CODE:
		// item 0: THIS
		// item 1: label
		
		THIS->SetLabel(label);

void
BSlider::SetLimitLabels(minLabel, maxLabel)
	INPUT:
		const char* minLabel;
		const char* maxLabel;
	CODE:
		// item 0: THIS
		// item 1: minLabel
		// item 2: maxLabel
		
		THIS->SetLimitLabels(minLabel, maxLabel);

const char*
BSlider::MinLimitLabel()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->MinLimitLabel();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

const char*
BSlider::MaxLimitLabel()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->MaxLimitLabel();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetValue(value)
	INPUT:
		int32 value;
	CODE:
		// item 0: THIS
		// item 1: value
		
		THIS->SetValue(value);

int32
BSlider::ValueForPoint(point)
	INPUT:
		BPoint point;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->ValueForPoint(point);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetPosition(position)
	INPUT:
		float position;
	CODE:
		// item 0: THIS
		// item 1: position
		
		THIS->SetPosition(position);

float
BSlider::Position()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Position();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetEnabled(on)
	INPUT:
		bool on;
	CODE:
		// item 0: THIS
		// item 1: on
		
		THIS->SetEnabled(on);

void
BSlider::GetLimits()
	INIT:
		int32 minLabel;
		int32 maxLabel;
		SV* minLabel_sv = newSV(0);	// retcount > 1
		SV* maxLabel_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetLimits(&minLabel, &maxLabel);
		sv_setiv(minLabel_sv, (IV)minLabel);
		sv_setiv(maxLabel_sv, (IV)maxLabel);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(minLabel_sv));
		PUSHs(sv_2mortal(maxLabel_sv));

void
BSlider::UpdateTextChanged()
	CODE:
		// item 0: THIS
		
		THIS->UpdateTextChanged();

SV*
BSlider::BarFrame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->BarFrame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BSlider::HashMarksFrame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->HashMarksFrame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BSlider::ThumbFrame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ThumbFrame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BSlider::SetFlags(flags)
	INPUT:
		uint32 flags;
	CODE:
		// item 0: THIS
		// item 1: flags
		
		THIS->SetFlags(flags);

void
BSlider::SetResizingMode(mode)
	INPUT:
		uint32 mode;
	CODE:
		// item 0: THIS
		// item 1: mode
		
		THIS->SetResizingMode(mode);

void
BSlider::GetPreferredSize()
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
BSlider::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

SV*
BSlider::Invoke()
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
BSlider::ResolveSpecifier(message, index, specifier, form, property)
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
BSlider::GetSupportedSuites(data)
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
BSlider::SetModificationMessage(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		
		THIS->SetModificationMessage(message);

SV*
BSlider::ModificationMessage()
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
BSlider::SetSnoozeAmount(amount)
	INPUT:
		int32 amount;
	CODE:
		// item 0: THIS
		// item 1: amount
		
		THIS->SetSnoozeAmount(amount);

int32
BSlider::SnoozeAmount()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->SnoozeAmount();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetKeyIncrementValue(value)
	INPUT:
		int32 value;
	CODE:
		// item 0: THIS
		// item 1: value
		
		THIS->SetKeyIncrementValue(value);

int32
BSlider::KeyIncrementValue()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->KeyIncrementValue();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetHashMarkCount(count)
	INPUT:
		int32 count;
	CODE:
		// item 0: THIS
		// item 1: count
		
		THIS->SetHashMarkCount(count);

int32
BSlider::HashMarkCount()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->HashMarkCount();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetHashMarks(where)
	INPUT:
		hash_mark_location where;
	CODE:
		// item 0: THIS
		// item 1: where
		
		THIS->SetHashMarks(where);

hash_mark_location
BSlider::HashMarks()
	INIT:
		hash_mark_location retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->HashMarks();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetStyle(style)
	INPUT:
		thumb_style style;
	CODE:
		// item 0: THIS
		// item 1: style
		
		THIS->SetStyle(style);

thumb_style
BSlider::Style()
	INIT:
		thumb_style retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Style();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetBarColor(color)
	INPUT:
		rgb_color color;
	CODE:
		// item 0: THIS
		// item 1: color
		
		THIS->SetBarColor(color);

SV*
BSlider::BarColor()
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

void
BSlider::UseFillColor(useFill, ...)
	INPUT:
		bool useFill;
	INIT:
		const rgb_color* color = NULL;
	CODE:
		// item 0: THIS
		// item 1: useFill
		// item 2: color
		if (items > 2) {
			color = (const rgb_color*)get_cpp_object(ST(2));
		}
		
		THIS->UseFillColor(useFill, color);

bool
BSlider::FillColor(...)
	INIT:
		rgb_color* color = NULL;
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: color
		if (items > 1) {
			color = (rgb_color*)get_cpp_object(ST(1));
		}
		
		retval = THIS->FillColor(color);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BSlider::OffscreenView()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->OffscreenView();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BSlider::SetOrientation(posture)
	INPUT:
		orientation posture;
	CODE:
		// item 0: THIS
		// item 1: posture
		
		THIS->SetOrientation(posture);

orientation
BSlider::Orientation()
	INIT:
		orientation retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Orientation();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BSlider::BarThickness()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->BarThickness();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::SetBarThickness(thickness)
	INPUT:
		float thickness;
	CODE:
		// item 0: THIS
		// item 1: thickness
		
		THIS->SetBarThickness(thickness);

void
BSlider::SetFont(font, ...)
	INPUT:
		const BFont* font;
	INIT:
		uint32 properties = B_FONT_ALL;
	CODE:
		// item 0: THIS
		// item 1: font
		// item 2: properties
		if (items > 2) {
			properties = (uint32)SvUV(ST(2));
		}
		
		THIS->SetFont(font, properties);

void
BSlider::SetLimits(minLabel, maxLabel)
	INPUT:
		int32 minLabel;
		int32 maxLabel;
	CODE:
		// item 0: THIS
		// item 1: minLabel
		// item 2: maxLabel
		
		THIS->SetLimits(minLabel, maxLabel);

float
BSlider::MaxUpdateTextWidth()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->MaxUpdateTextWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BSlider::InvalidateLayout(...)
	INIT:
		bool descendants = false;
	CODE:
		// item 0: THIS
		// item 1: descendants
		if (items > 1) {
			descendants = SvTRUE(ST(1));
		}
		
		THIS->InvalidateLayout(descendants);

SV*
B_HASH_MARKS_NONE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HASH_MARKS_NONE);
		dualize(RETVAL, "B_HASH_MARKS_NONE");
	OUTPUT:
		RETVAL

SV*
B_HASH_MARKS_TOP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HASH_MARKS_TOP);
		dualize(RETVAL, "B_HASH_MARKS_TOP");
	OUTPUT:
		RETVAL

SV*
B_HASH_MARKS_LEFT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HASH_MARKS_LEFT);
		dualize(RETVAL, "B_HASH_MARKS_LEFT");
	OUTPUT:
		RETVAL

SV*
B_HASH_MARKS_BOTTOM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HASH_MARKS_BOTTOM);
		dualize(RETVAL, "B_HASH_MARKS_BOTTOM");
	OUTPUT:
		RETVAL

SV*
B_HASH_MARKS_RIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HASH_MARKS_RIGHT);
		dualize(RETVAL, "B_HASH_MARKS_RIGHT");
	OUTPUT:
		RETVAL

SV*
B_HASH_MARKS_BOTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HASH_MARKS_BOTH);
		dualize(RETVAL, "B_HASH_MARKS_BOTH");
	OUTPUT:
		RETVAL

SV*
B_BLOCK_THUMB()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BLOCK_THUMB);
		dualize(RETVAL, "B_BLOCK_THUMB");
	OUTPUT:
		RETVAL

SV*
B_TRIANGLE_THUMB()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRIANGLE_THUMB);
		dualize(RETVAL, "B_TRIANGLE_THUMB");
	OUTPUT:
		RETVAL

bool
BSlider::operator_eq(object, swap)
	INPUT:
		BSlider* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BSlider::operator_ne(object, swap)
	INPUT:
		BSlider* object;
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
		get_sv("Haiku::Slider::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Slider::()", XS_Haiku__InterfaceKit_nil, file);

