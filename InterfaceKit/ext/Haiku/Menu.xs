#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Menu

PROTOTYPES: DISABLE

SV*
BMenu::new(name, ...)
	INPUT:
		const char* name;
	INIT:
		menu_layout layout = B_ITEMS_IN_COLUMN;
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: layout
		if (items > 2) {
			layout = (menu_layout)SvIV(ST(2));
		}
		
		retval = new BMenu(name, layout);
		
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
newMatrixMenu(CLASS, name, width, height)
	INPUT:
		char* CLASS;
		const char* name;
		float width;
		float height;
	INIT:
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: width
		// item 3: height
		
		retval = new BMenu(name, width, height);
		
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
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BMenu(archive);
		
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
		BMenu* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMenu");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMenu*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BMenu::Instantiate(data)
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
BMenu::Archive(...)
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
BMenu::GetPreferredSize()
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
BMenu::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BMenu::DoLayout()
	CODE:
		// item 0: THIS
		
		THIS->DoLayout();

void
BMenu::InvalidateLayout(...)
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
BMenu::MakeFocus(...)
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
BMenu::AddItem(item)
	INPUT:
		BMenuItem* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		
		retval = THIS->AddItem(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::AddItemAtIndex(item, index)
	INPUT:
		BMenuItem* item;
		int32 index;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		// item 2: index
		
		retval = THIS->AddItem(item, index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::ToMatrix(item, frame)
	INPUT:
		BMenuItem* item;
		BRect frame;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		// item 2: frame
		
		retval = THIS->AddItem(item, frame);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::AddSubmenu(item)
	INPUT:
		BMenuItem* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		
		retval = THIS->AddItem(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::AddSubmenuAtIndex(item, index)
	INPUT:
		BMenu* item;
		int32 index;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		// item 2: index
		
		retval = THIS->AddItem(item, index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::AddSubmenuToMatrix(item, frame)
	INPUT:
		BMenu* item;
		BRect frame;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		must_not_delete_cpp_object(ST(1), true);
		// item 2: frame
		
		retval = THIS->AddItem(item, frame);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenu::AddSeparatorItem()
	CODE:
		// item 0: THIS
		
		THIS->AddSeparatorItem();

bool
BMenu::RemoveItem(item)
	INPUT:
		BMenuItem* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->RemoveItem(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::RemoveSubmenu(item)
	INPUT:
		BMenu* item;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->RemoveItem(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMenu::RemoveItemAtIndex(index)
	INPUT:
		int32 index;
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->RemoveItem(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BMenu::RemoveItems(index, count, ...)
	INPUT:
		int32 index;
		int32 count;
	INIT:
		bool deleteItems = false;
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: index
		// item 2: count
		// item 3: deleteItems
		if (items > 3) {
			deleteItems = SvTRUE(ST(3));
		}
		
		retval = THIS->RemoveItems(index, count, deleteItems);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMenu::ItemAt(index)
	INPUT:
		int32 index;
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ItemAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenu::SubmenuAt(index)
	INPUT:
		int32 index;
	INIT:
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->SubmenuAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Menu", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
BMenu::CountItems()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountItems();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BMenu::IndexOf(item)
	INPUT:
		BMenuItem* item;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: item
		
		retval = THIS->IndexOf(item);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BMenu::IndexOfSubmenu(item)
	INPUT:
		BMenu* item;
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
BMenu::FindItem(label)
	INPUT:
		const char* label;
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: label
		
		retval = THIS->FindItem(label);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenu::FindItemByCommand(command)
	INPUT:
		uint32 command;
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: command
		
		retval = THIS->FindItem(command);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BMenu::SetTargetForItems(handler)
	INPUT:
		BHandler* handler;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: handler
		
		retval = THIS->SetTargetForItems(handler);
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
BMenu::SetMessengerTargetForItems(messenger)
	INPUT:
		BMessenger messenger;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: messenger
		
		retval = THIS->SetTargetForItems(messenger);
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
BMenu::SetEnabled(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->SetEnabled(enabled);

void
BMenu::SetRadioMode(flag)
	INPUT:
		bool flag;
	CODE:
		// item 0: THIS
		// item 1: flag
		
		THIS->SetRadioMode(flag);

void
BMenu::SetTriggersEnabled(flag)
	INPUT:
		bool flag;
	CODE:
		// item 0: THIS
		// item 1: flag
		
		THIS->SetTriggersEnabled(flag);

void
BMenu::SetMaxContentWidth(width)
	INPUT:
		float width;
	CODE:
		// item 0: THIS
		// item 1: width
		
		THIS->SetMaxContentWidth(width);

void
BMenu::SetLabelFromMarked(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->SetLabelFromMarked(state);

bool
BMenu::IsLabelFromMarked()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsLabelFromMarked();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::IsEnabled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEnabled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::IsRadioMode()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsRadioMode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::AreTriggersEnabled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->AreTriggersEnabled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenu::IsRedrawAfterSticky()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsRedrawAfterSticky();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BMenu::MaxContentWidth()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->MaxContentWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMenu::FindMarked()
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->FindMarked();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenu::Supermenu()
	INIT:
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Supermenu();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Menu", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenu::Superitem()
	INIT:
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Superitem();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuItem", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenu::ResolveSpecifier(message, index, specifier, form, property)
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
BMenu::GetSupportedSuites(data)
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

bool
BMenu::AddDynamicItem(state)
	INPUT:
		BMenu::add_state state;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: state
		
		retval = THIS->AddDynamicItem(state);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenu::DrawBackground(update)
	INPUT:
		BRect update;
	CODE:
		// item 0: THIS
		// item 1: update
		
		THIS->DrawBackground(update);

SV*
get_menu_info()
	INIT:
		menu_info* info;
		status_t retval;
		SV* error_sv;
		SV* info_sv = newSV(0);	// retcount == 1
	CODE:
		retval = get_menu_info(info);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		info_sv = create_perl_object((void*)info, "Haiku::menu_info", false);
		DUMPME(1,info_sv);
		RETVAL = newSVsv(info_sv);
		SvREFCNT_dec(info_sv);
	OUTPUT:
		RETVAL

bool
set_menu_info(info)
	INPUT:
		menu_info* info;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: info
		
		retval = set_menu_info(info);
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
B_ITEMS_IN_ROW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ITEMS_IN_ROW);
		dualize(RETVAL, "B_ITEMS_IN_ROW");
	OUTPUT:
		RETVAL

SV*
B_ITEMS_IN_COLUMN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ITEMS_IN_COLUMN);
		dualize(RETVAL, "B_ITEMS_IN_COLUMN");
	OUTPUT:
		RETVAL

SV*
B_ITEMS_IN_MATRIX()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ITEMS_IN_MATRIX);
		dualize(RETVAL, "B_ITEMS_IN_MATRIX");
	OUTPUT:
		RETVAL

SV*
B_INITIAL_ADD()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)BMenu::B_INITIAL_ADD);
		dualize(RETVAL, "B_INITIAL_ADD");
	OUTPUT:
		RETVAL

SV*
B_PROCESSING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)BMenu::B_PROCESSING);
		dualize(RETVAL, "B_PROCESSING");
	OUTPUT:
		RETVAL

SV*
B_ABORT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)BMenu::B_ABORT);
		dualize(RETVAL, "B_ABORT");
	OUTPUT:
		RETVAL

bool
BMenu::operator_eq(object, swap)
	INPUT:
		BMenu* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BMenu::operator_ne(object, swap)
	INPUT:
		BMenu* object;
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
		get_sv("Haiku::Menu::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Menu::()", XS_Haiku__InterfaceKit_nil, file);

