#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::OutlineListView

PROTOTYPES: DISABLE

SV*
BOutlineListView::new(frame, name, type, ...)
	INPUT:
		BRect frame;
		const char* name;
		list_view_type type;
	INIT:
		uint32 resizingMode = B_FOLLOW_LEFT | B_FOLLOW_TOP;
		uint32 flags = B_WILL_DRAW | B_FRAME_EVENTS | B_NAVIGABLE;
		BOutlineListView* retval;
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
		
		retval = new BOutlineListView(frame, name, type, resizingMode, flags);
		
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
		BOutlineListView* retval;
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
		
		retval = new BOutlineListView(name, type, flags);
		
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
		BOutlineListView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BOutlineListView(archive);
		
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
		BOutlineListView* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BOutlineListView");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BOutlineListView*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BOutlineListView::Instantiate(data)
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
BOutlineListView::Archive(...)
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
BOutlineListView::AddUnder(item, underItem)
	INPUT:
		BListItem* item;
		BListItem* underItem;
	CODE:
		// item 0: THIS
		// item 1: item
		// item 2: underItem
		
		THIS->AddUnder(item, underItem);

void
BOutlineListView::AddItem(item)
	INPUT:
		BListItem* item;
	CODE:
		// item 0: THIS
		// item 1: item
		
		THIS->AddItem(item);

void
BOutlineListView::AddItemAtIndex(item, fullListIndex)
	INPUT:
		BListItem* item;
		int32 fullListIndex;
	CODE:
		// item 0: THIS
		// item 1: item
		// item 2: fullListIndex
		
		THIS->AddItem(item, fullListIndex);

void
BOutlineListView::RemoveItem(item)
	INPUT:
		BListItem* item;
	CODE:
		// item 0: THIS
		// item 1: item
		
		THIS->RemoveItem(item);

void
BOutlineListView::RemoveItemAtIndex(fullListIndex)
	INPUT:
		int32 fullListIndex;
	CODE:
		// item 0: THIS
		// item 1: fullListIndex
		
		THIS->RemoveItem(fullListIndex);

void
BOutlineListView::RemoveItems(fullListIndex, count)
	INPUT:
		int32 fullListIndex;
		int32 count;
	CODE:
		// item 0: THIS
		// item 1: fullListIndex
		// item 2: count
		
		THIS->RemoveItems(fullListIndex, count);

SV*
BOutlineListView::FullListItemAt(fullListIndex)
	INPUT:
		int32 fullListIndex;
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: fullListIndex
		
		retval = THIS->FullListItemAt(fullListIndex);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
BOutlineListView::FullListIndexAtPoint(point)
	INPUT:
		BPoint point;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->FullListIndexOf(point);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BOutlineListView::FullListIndexOf(item)
	INPUT:
		BListItem* item;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->FullListIndexOf(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BOutlineListView::FullListFirstItem()
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->FullListFirstItem();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BOutlineListView::FullListLastItem()
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->FullListLastItem();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BOutlineListView::FullListHasItem(item)
	INPUT:
		BListItem* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->FullListHasItem(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BOutlineListView::FullListCountItems()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FullListCountItems();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BOutlineListView::FullListCurrentSelection(...)
	INIT:
		int32 index = 0;
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: index
		if (items > 1) {
			index = (int32)SvIV(ST(1));
		}
		
		retval = THIS->FullListCurrentSelection(index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BOutlineListView::MakeEmpty()
	CODE:
		// item 0: THIS
		
		THIS->MakeEmpty();

bool
BOutlineListView::FullListIsEmpty()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FullListIsEmpty();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BOutlineListView::Superitem(item)
	INPUT:
		BListItem* item;
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->Superitem(item);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BOutlineListView::Expand(item)
	INPUT:
		BListItem* item;
	CODE:
		// item 0: THIS
		// item 1: item
		
		THIS->Expand(item);

void
BOutlineListView::Collapse(item)
	INPUT:
		BListItem* item;
	CODE:
		// item 0: THIS
		// item 1: item
		
		THIS->Collapse(item);

bool
BOutlineListView::IsExpanded(fullListIndex)
	INPUT:
		int32 fullListIndex;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: fullListIndex
		
		retval = THIS->IsExpanded(fullListIndex);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BOutlineListView::ResolveSpecifier(message, index, specifier, form, property)
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
BOutlineListView::GetSupportedSuites(data)
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
BOutlineListView::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BOutlineListView::GetPreferredSize()
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
BOutlineListView::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

int32
BOutlineListView::CountItemsUnder(under, oneLevelOnly)
	INPUT:
		BListItem* under;
		bool oneLevelOnly;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: under
		// item 2: oneLevelOnly
		
		retval = THIS->CountItemsUnder(under, oneLevelOnly);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BOutlineListView::ItemUnderAt(underItem, oneLevelOnly, index)
	INPUT:
		BListItem* underItem;
		bool oneLevelOnly;
		int32 index;
	INIT:
		BListItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: underItem
		// item 2: oneLevelOnly
		// item 3: index
		
		retval = THIS->ItemUnderAt(underItem, oneLevelOnly, index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ListItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BOutlineListView::operator_eq(object, swap)
	INPUT:
		BOutlineListView* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BOutlineListView::operator_ne(object, swap)
	INPUT:
		BOutlineListView* object;
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
		get_sv("Haiku::OutlineListView::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::OutlineListView::()", XS_Haiku__InterfaceKit_nil, file);

