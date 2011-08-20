#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Entry

PROTOTYPES: DISABLE

# Note that this method is not prefixed by the class name.
#
# This is because for prefixed methods, xsubpp will turn the first perl
# argument into the CLASS variable (a char*) if the method name is 'new',
# and into the THIS variable (the object pointer) otherwise. So we need to
# trick xsubbpp by leaving off the prefix and defining CLASS ourselves
SV*
newEmpty(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BEntry* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BEntry();
		
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
newFromEntryRef(CLASS, ref, ...)
	INPUT:
		char* CLASS;
		const entry_ref* ref;
	INIT:
		bool traverse = false;
		BEntry* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: ref
		// item 2: traverse
		if (items > 2) {
			traverse = SvTRUE(ST(2));
		}
		
		retval = new BEntry(ref, traverse);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BEntry::new(path, ...)
	INPUT:
		const char* path;
	INIT:
		bool traverse = false;
		BEntry* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: path
		// item 2: traverse
		if (items > 2) {
			traverse = SvTRUE(ST(2));
		}
		
		retval = new BEntry(path, traverse);
		
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
newFromEntry(CLASS, entry)
	INPUT:
		char* CLASS;
		const BEntry entry;
	INIT:
		BEntry* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: entry
		
		retval = new BEntry(entry);
		
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
		BEntry* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BEntry");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BEntry*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BEntry::InitCheck()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->InitCheck();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BEntry::Exists()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Exists();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BEntry::GetStat()
	INIT:
		struct stat* stat;
		status_t retval;
		SV* error_sv;
		SV* stat_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetStat(stat);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		stat_sv = create_perl_object((void*)stat, "Haiku::stat", false);
		DUMPME(1,stat_sv);
		RETVAL = newSVsv(stat_sv);
		SvREFCNT_dec(stat_sv);
	OUTPUT:
		RETVAL

bool
BEntry::SetToEntryRef(ref, ...)
	INPUT:
		const entry_ref* ref;
	INIT:
		bool traverse = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: ref
		// item 2: traverse
		if (items > 2) {
			traverse = SvTRUE(ST(2));
		}
		
		retval = THIS->SetTo(ref, traverse);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BEntry::SetTo(path, ...)
	INPUT:
		const char* path;
	INIT:
		bool traverse = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: path
		// item 2: traverse
		if (items > 2) {
			traverse = SvTRUE(ST(2));
		}
		
		retval = THIS->SetTo(path, traverse);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

void
BEntry::Unset()
	CODE:
		// item 0: THIS
		
		THIS->Unset();

SV*
BEntry::GetRef()
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetRef(ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::entry_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

SV*
BEntry::GetPath()
	INIT:
		BPath* path = new BPath();
		status_t retval;
		SV* error_sv;
		SV* path_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetPath(path);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		path_sv = create_perl_object((void*)path, "Haiku::Path", false);
		DUMPME(1,path_sv);
		RETVAL = newSVsv(path_sv);
		SvREFCNT_dec(path_sv);
	OUTPUT:
		RETVAL

SV*
BEntry::GetParent()
	INIT:
		BEntry* entry;
		status_t retval;
		SV* error_sv;
		SV* entry_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetParent(entry);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		entry_sv = create_perl_object((void*)entry, "Haiku::Entry", false);
		DUMPME(1,entry_sv);
		RETVAL = newSVsv(entry_sv);
		SvREFCNT_dec(entry_sv);
	OUTPUT:
		RETVAL

SV*
BEntry::GetName()
	INIT:
		char* buffer;
		status_t retval;
		SV* error_sv;
		STRLEN buffer_sv_length;
		SV* buffer_sv = newSV(0);	// retcount == 1
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		buffer = (char*)malloc(B_FILE_NAME_LENGTH);
		
		retval = THIS->GetName(buffer);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		buffer_sv = newSVpv((char*)buffer, 0);	// 0 lets Perl calculate length
		
		buffer_sv_length = SvCUR(buffer_sv);
		if (buffer_sv_length > B_FILE_NAME_LENGTH) {
			buffer_sv_length = B_FILE_NAME_LENGTH;
			SvCUR_set(buffer_sv, buffer_sv_length);
		}
		
		if (is_utf8_string((const U8*)buffer, (STRLEN)buffer_sv_length)) {
			SvUTF8_on(buffer_sv);
		}
		free((void*)buffer);
		RETVAL = buffer_sv;
	OUTPUT:
		RETVAL

bool
BEntry::Rename(path, ...)
	INPUT:
		const char* path;
	INIT:
		bool clobber = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: path
		// item 2: clobber
		if (items > 2) {
			clobber = SvTRUE(ST(2));
		}
		
		retval = THIS->Rename(path, clobber);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BEntry::Remove()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Remove();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BEntry::operator_eq(object, swap)
	INPUT:
		BEntry object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BEntry::operator_ne(object, swap)
	INPUT:
		BEntry object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Entry::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Entry::()", XS_Haiku__StorageKit_nil, file);

