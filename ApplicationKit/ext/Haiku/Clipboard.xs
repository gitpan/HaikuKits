#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Clipboard

PROTOTYPES: DISABLE

SV*
BClipboard::new(name, ...)
	INPUT:
		const char* name;
	INIT:
		bool discard = false;
		BClipboard* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: discard
		if (items > 2) {
			discard = SvTRUE(ST(2));
		}
		
		retval = new BClipboard(name, discard);
		
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
		BClipboard* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BClipboard");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BClipboard*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

const char*
BClipboard::Name()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Name();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint32
BClipboard::LocalCount()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->LocalCount();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint32
BClipboard::SystemCount()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->SystemCount();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BClipboard::StartWatching(target)
	INPUT:
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: target
		
		retval = THIS->StartWatching(target);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BClipboard::StopWatching(target)
	INPUT:
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: target
		
		retval = THIS->StopWatching(target);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BClipboard::Lock()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Lock();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BClipboard::Unlock()
	CODE:
		// item 0: THIS
		
		THIS->Unlock();

bool
BClipboard::IsLocked()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsLocked();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BClipboard::Clear()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Clear();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BClipboard::Commit(...)
	INIT:
		bool failIfChanged = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: failIfChanged
		if (items > 1) {
			failIfChanged = SvTRUE(ST(1));
		}
		
		retval = THIS->Commit(failIfChanged);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BClipboard::Revert()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Revert();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

SV*
BClipboard::DataSource()
	INIT:
		BMessenger retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DataSource();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Messenger", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BClipboard::Data()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Data();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
B_CLIPBOARD_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CLIPBOARD_CHANGED);
		dualize(RETVAL, "B_CLIPBOARD_CHANGED");
	OUTPUT:
		RETVAL

SV*
be_clipboard()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)be_clipboard, "Haiku::Clipboard", true));
		dualize(RETVAL, "be_clipboard");
	OUTPUT:
		RETVAL

bool
BClipboard::operator_eq(object, swap)
	INPUT:
		BClipboard* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BClipboard::operator_ne(object, swap)
	INPUT:
		BClipboard* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__ApplicationKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Clipboard::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Clipboard::()", XS_Haiku__ApplicationKit_nil, file);

