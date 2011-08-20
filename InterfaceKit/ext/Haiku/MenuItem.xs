#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::MenuItem

PROTOTYPES: DISABLE

SV*
BMenuItem::new(label, message, ...)
	INPUT:
		const char* label;
		BMessage* message;
	INIT:
		char shortcut = 0;
		uint32 modifiers = 0;
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: label
		// item 2: message
		must_not_delete_cpp_object(ST(2), true);
		// item 3: shortcut
		if (items > 3) {
			memcpy((void*)&shortcut, (void*)SvPV_nolen(ST(3)), 1);
		}
		// item 4: modifiers
		if (items > 4) {
			modifiers = (uint32)SvUV(ST(4));
		}
		
		retval = new BMenuItem(label, message, shortcut, modifiers);
		
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
newSubmenu(CLASS, submenu, ...)
	INPUT:
		char* CLASS;
		BMenu* submenu;
	INIT:
		BMessage* message = NULL;
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: submenu
		// item 2: message
		if (items > 2) {
			message = (BMessage*)get_cpp_object(ST(2));
		}
		must_not_delete_cpp_object(ST(2), true);
		
		retval = new BMenuItem(submenu, message);
		
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
		BMenuItem* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BMenuItem(archive);
		
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
		BMenuItem* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMenuItem");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMenuItem*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BMenuItem::Instantiate(data)
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
BMenuItem::Archive(...)
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
BMenuItem::SetLabel(string)
	INPUT:
		const char* string;
	CODE:
		// item 0: THIS
		// item 1: string
		
		THIS->SetLabel(string);

void
BMenuItem::SetEnabled(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->SetEnabled(enabled);

void
BMenuItem::SetMarked(flag)
	INPUT:
		bool flag;
	CODE:
		// item 0: THIS
		// item 1: flag
		
		THIS->SetMarked(flag);

void
BMenuItem::SetTrigger(trigger)
	INPUT:
		char trigger;
	CODE:
		// item 0: THIS
		// item 1: trigger
		
		THIS->SetTrigger(trigger);

void
BMenuItem::SetShortcut(shortcut_sv, modifiers)
	INPUT:
		SV* shortcut_sv;
		uint32 modifiers;
	INIT:
		char shortcut;
	CODE:
		// item 0: THIS
		// item 1: shortcut
		memcpy((void*)&shortcut, (void*)SvPV_nolen(shortcut_sv), 1);
		// item 2: modifiers
		
		THIS->SetShortcut(shortcut, modifiers);

const char*
BMenuItem::Label()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Label();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenuItem::IsEnabled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEnabled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMenuItem::IsMarked()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsMarked();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

char
BMenuItem::Trigger()
	INIT:
		char retval;
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		
		retval = THIS->Trigger();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMenuItem::Shortcut()
	INIT:
		uint32 modifiers;
		char retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* modifiers_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		retval = THIS->Shortcut(&modifiers);
		sv_setuv(modifiers_sv, (UV)modifiers);
		
		retval_sv = newSVpvn((char*)&retval, (STRLEN)1);
		if (is_utf8_string((const U8*)&retval, (STRLEN)1)) {
			SvUTF8_on(retval_sv);
		}
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(modifiers_sv));

SV*
BMenuItem::Submenu()
	INIT:
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Submenu();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Menu", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenuItem::Menu()
	INIT:
		BMenu* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Menu();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Menu", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMenuItem::Frame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Frame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BMenuItem::operator_eq(object, swap)
	INPUT:
		BMenuItem* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BMenuItem::operator_ne(object, swap)
	INPUT:
		BMenuItem* object;
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
		get_sv("Haiku::MenuItem::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::MenuItem::()", XS_Haiku__InterfaceKit_nil, file);

