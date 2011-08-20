#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Path

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
		BPath* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BPath();
		
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
newFromPath(CLASS, path)
	INPUT:
		char* CLASS;
		const BPath path;
	INIT:
		BPath* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: path
		
		retval = new BPath(path);
		
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
newFromEntryRef(CLASS, ref)
	INPUT:
		char* CLASS;
		const entry_ref* ref;
	INIT:
		BPath* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: ref
		
		retval = new BPath(ref);
		
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
		const BEntry* entry;
	INIT:
		BPath* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: entry
		
		retval = new BPath(entry);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BPath::new(path, leaf, ...)
	INPUT:
		const char* path;
		const char* leaf;
	INIT:
		bool normalize = false;
		BPath* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: path
		// item 2: leaf
		// item 3: normalize
		if (items > 3) {
			normalize = SvTRUE(ST(3));
		}
		
		retval = new BPath(path, leaf, normalize);
		
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
		BPath* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BPath");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BPath*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BPath::InitCheck()
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
BPath::SetToEntryRef(ref)
	INPUT:
		const entry_ref* ref;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: ref
		
		retval = THIS->SetTo(ref);
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
BPath::SetToEntry(entry)
	INPUT:
		const BEntry* entry;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: entry
		
		retval = THIS->SetTo(entry);
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
BPath::SetTo(path, leaf, ...)
	INPUT:
		const char* path;
		const char* leaf;
	INIT:
		bool normalize = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: path
		// item 2: leaf
		// item 3: normalize
		if (items > 3) {
			normalize = SvTRUE(ST(3));
		}
		
		retval = THIS->SetTo(path, leaf, normalize);
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
BPath::Unset()
	CODE:
		// item 0: THIS
		
		THIS->Unset();

bool
BPath::Append(path, ...)
	INPUT:
		const char* path;
	INIT:
		bool normalize = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: path
		// item 2: normalize
		if (items > 2) {
			normalize = SvTRUE(ST(2));
		}
		
		retval = THIS->Append(path, normalize);
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

SV*
BPath::Path()
	INIT:
		const char* retval;
		STRLEN retval_sv_length;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Path();
		
		retval_sv = newSVpv((char*)retval, 0);	// 0 lets Perl calculate length
		
		retval_sv_length = SvCUR(retval_sv);
		if (retval_sv_length > B_FILE_NAME_LENGTH) {
			retval_sv_length = B_FILE_NAME_LENGTH;
			SvCUR_set(retval_sv, retval_sv_length);
		}
		
		if (is_utf8_string((const U8*)retval, (STRLEN)retval_sv_length)) {
			SvUTF8_on(retval_sv);
		}
		RETVAL = retval_sv;
	OUTPUT:
		RETVAL

SV*
BPath::Leaf()
	INIT:
		const char* retval;
		STRLEN retval_sv_length;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Leaf();
		
		retval_sv = newSVpv((char*)retval, 0);	// 0 lets Perl calculate length
		
		retval_sv_length = SvCUR(retval_sv);
		if (retval_sv_length > B_FILE_NAME_LENGTH) {
			retval_sv_length = B_FILE_NAME_LENGTH;
			SvCUR_set(retval_sv, retval_sv_length);
		}
		
		if (is_utf8_string((const U8*)retval, (STRLEN)retval_sv_length)) {
			SvUTF8_on(retval_sv);
		}
		RETVAL = retval_sv;
	OUTPUT:
		RETVAL

SV*
BPath::GetParent()
	INIT:
		BPath* path;
		status_t retval;
		SV* error_sv;
		SV* path_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetParent(path);
		
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

bool
BPath::operator_eq(object, swap)
	INPUT:
		BPath object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BPath::operator_ne(object, swap)
	INPUT:
		BPath object;
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
		get_sv("Haiku::Path::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Path::()", XS_Haiku__StorageKit_nil, file);

