#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::ListView

PROTOTYPES: DISABLE

SV*
BListView::new(frame, name, type, ...)
	INPUT:
		BRect frame;
		const char* name;
		list_view_type type;
	INIT:
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS | B_NAVIGABLE;
		BListView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: type
		// item 4: resizingMode
		if (items > 4) {
			resizingMode = (uint32)SvUV(ST(4));
		}
		// item 5: flags
		if (items > 5) {
			flags = (uint32)SvUV(ST(5));
		}
		
		retval = new BListView(frame, name, type, resizingMode, flags);
		
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
		list_view_type type = B_SINGLE_SELECTION_LIST;
		uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS | B_NAVIGABLE;
		BListView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: type
		if (items > 2) {
			type = (list_view_type)SvIV(ST(2));
		}
		// item 3: flags
		if (items > 3) {
			flags = (uint32)SvUV(ST(3));
		}
		
		retval = new BListView(name, type, flags);
		
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
newBareBones(CLASS, ...)
	INPUT:
		char* CLASS;
	INIT:
		list_view_type type = B_SINGLE_SELECTION_LIST;
		BListView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: type
		if (items > 1) {
			type = (list_view_type)SvIV(ST(1));
		}
		
		retval = new BListView(type);
		
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
		BListView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BListView(archive);
		
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
		BListView* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BListView");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BListView*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BListView::Instantiate(data)
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
BListView::Archive(...)
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
BListView::GetPreferredSize()
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
BListView::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BListView::MakeFocus(...)
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
BListView::SetFont(font, ...)
	INPUT:
		BFont* font;
	INIT:
		uint32 mask = B_FONT_ALL;
	CODE:
		// item 0: THIS
		// item 1: font
		// item 2: mask
		if (items > 2) {
			mask = (uint32)SvUV(ST(2));
		}
		
		THIS->SetFont(font, mask);

void
BListView::ScrollTo(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->ScrollTo(x, y);

void
BListView::ScrollToPoint(where)
	INPUT:
		BPoint where;
	CODE:
		// item 0: THIS
		// item 1: where
		
		THIS->ScrollTo(where);

void
BListView::AddItem(item)
	INPUT:
		BListItem* item;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		
		THIS->AddItem(item);

void
BListView::AddItemAtIndex(item, index)
	INPUT:
		BListItem* item;
		int32 index;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		// item 2: index
		
		THIS->AddItem(item, index);

void
BListView::RemoveItem(item)
	INPUT:
		BListItem* item;
	CODE:
		// item 0: THIS
		// item 1: item
		
		THIS->RemoveItem(item);

void
BListView::RemoveItemAtIndex(index)
	INPUT:
		int32 index;
	CODE:
		// item 0: THIS
		// item 1: index
		
		THIS->RemoveItem(index);

void
BListView::RemoveItems(index, count)
	INPUT:
		int32 index;
		int32 count;
	CODE:
		// item 0: THIS
		// item 1: index
		// item 2: count
		
		THIS->RemoveItems(index, count);

void
BListView::SetSelectionMessage(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		
		THIS->SetSelectionMessage(message);

void
BListView::SetInvocationMessage(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		
		THIS->SetInvocationMessage(message);

SV*
BListView::SelectionMessage()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->SelectionMessage();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

uint32
BListView::SelectionCommand()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->SelectionCommand();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BListView::InvocationMessage()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->InvocationMessage();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

uint32
BListView::InvocationCommand()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->InvocationCommand();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BListView::SetListType(type)
	INPUT:
		list_view_type type;
	CODE:
		// item 0: THIS
		// item 1: type
		
		THIS->SetListType(type);

list_view_type
BListView::ListType()
	INIT:
		list_view_type retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->ListType();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BListView::ItemAt(index)
	INPUT:
		int32 index;
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ItemAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
BListView::IndexAtPoint(point)
	INPUT:
		BPoint point;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->IndexOf(point);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BListView::IndexOf(item)
	INPUT:
		BListItem* item;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->IndexOf(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BListView::FirstItem()
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->FirstItem();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BListView::LastItem()
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->LastItem();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BListView::HasItem(item)
	INPUT:
		BListItem* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->HasItem(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BListView::CountItems()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountItems();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BListView::MakeEmpty()
	CODE:
		// item 0: THIS
		
		THIS->MakeEmpty();

bool
BListView::IsEmpty()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEmpty();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BListView::Items()
	INIT:
		const BListItem** retval;
		AV* retval_sv_av;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Items();
		
		//Converting C array 'retval' to Perl arg 'retval_sv'
		retval_sv_av = newAV();
		for (int i = 0; i < THIS->CountItems(); i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)retval[i], "Haiku::ListItem"));
			av_push(retval_sv_av, element_sv);
		}
		retval_sv = newRV_noinc((SV*) retval_sv_av);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BListView::InvalidateItem(index)
	INPUT:
		int32 index;
	CODE:
		// item 0: THIS
		// item 1: index
		
		THIS->InvalidateItem(index);

void
BListView::ScrollToSelection()
	CODE:
		// item 0: THIS
		
		THIS->ScrollToSelection();

void
BListView::Select(index, ...)
	INPUT:
		int32 index;
	INIT:
		bool extend = false;
	CODE:
		// item 0: THIS
		// item 1: index
		// item 2: extend
		if (items > 2) {
			extend = SvTRUE(ST(2));
		}
		
		THIS->Select(index, extend);

void
BListView::SelectMultiple(from, to, ...)
	INPUT:
		int32 from;
		int32 to;
	INIT:
		bool extend = false;
	CODE:
		// item 0: THIS
		// item 1: from
		// item 2: to
		// item 3: extend
		if (items > 3) {
			extend = SvTRUE(ST(3));
		}
		
		THIS->Select(from, to, extend);

bool
BListView::IsItemSelected(index)
	INPUT:
		int32 index;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->IsItemSelected(index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BListView::CurrentSelection(...)
	INIT:
		int32 index = 0;
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: index
		if (items > 1) {
			index = (int32)SvIV(ST(1));
		}
		
		retval = THIS->CurrentSelection(index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BListView::Invoke()
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

void
BListView::DeselectAll()
	CODE:
		// item 0: THIS
		
		THIS->DeselectAll();

void
BListView::DeselectExcept(exceptFrom, exceptTo)
	INPUT:
		int32 exceptFrom;
		int32 exceptTo;
	CODE:
		// item 0: THIS
		// item 1: exceptFrom
		// item 2: exceptTo
		
		THIS->DeselectExcept(exceptFrom, exceptTo);

void
BListView::Deselect(index)
	INPUT:
		int32 index;
	CODE:
		// item 0: THIS
		// item 1: index
		
		THIS->Deselect(index);

bool
BListView::SwapItems(a, b)
	INPUT:
		int32 a;
		int32 b;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: a
		// item 2: b
		
		retval = THIS->SwapItems(a, b);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BListView::MoveItem(from, to)
	INPUT:
		int32 from;
		int32 to;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: from
		// item 2: to
		
		retval = THIS->MoveItem(from, to);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BListView::ReplaceItem(index, item)
	INPUT:
		int32 index;
		BListItem* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: index
		// item 2: item
		
		retval = THIS->ReplaceItem(index, item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BListView::ItemFrame(index)
	INPUT:
		int32 index;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ItemFrame(index);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BListView::ResolveSpecifier(message, index, specifier, form, property)
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
BListView::GetSupportedSuites(data)
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
B_SINGLE_SELECTION_LIST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SINGLE_SELECTION_LIST);
		dualize(RETVAL, "B_SINGLE_SELECTION_LIST");
	OUTPUT:
		RETVAL

SV*
B_MULTIPLE_SELECTION_LIST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MULTIPLE_SELECTION_LIST);
		dualize(RETVAL, "B_MULTIPLE_SELECTION_LIST");
	OUTPUT:
		RETVAL

bool
BListView::operator_eq(object, swap)
	INPUT:
		BListView* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BListView::operator_ne(object, swap)
	INPUT:
		BListView* object;
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
		get_sv("Haiku::ListView::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::ListView::()", XS_Haiku__InterfaceKit_nil, file);

