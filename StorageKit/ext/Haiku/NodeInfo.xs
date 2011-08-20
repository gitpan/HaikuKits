#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::NodeInfo

PROTOTYPES: DISABLE

SV*
BNodeInfo::new(node)
	INPUT:
		BNode* node;
	INIT:
		BNodeInfo* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: node
		
		retval = new BNodeInfo(node);
		
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
newEmpty(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BNodeInfo* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BNodeInfo();
		
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
		BNodeInfo* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BNodeInfo");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BNodeInfo*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BNodeInfo::SetTo(node)
	INPUT:
		BNode* node;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: node
		
		retval = THIS->SetTo(node);
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
BNodeInfo::InitCheck()
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

char*
BNodeInfo::GetType()
	INIT:
		char* type;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetType(type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = type;
	OUTPUT:
		RETVAL

const char*
BNodeInfo::SetType()
	INIT:
		const char* type;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->SetType(type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = type;
	OUTPUT:
		RETVAL

void
BNodeInfo::GetIconData()
	INIT:
		uint8** data;
		size_t size;
		type_code type;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount > 1
		SV* type_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// not an XS input: size
		data = (uint8**)malloc(size);
		
		retval = THIS->GetIcon(data, &size, &type);
		sv_setuv(type_sv, (UV)type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = newSVpvn((char*)data, (STRLEN)size);
		if (is_utf8_string((const U8*)data, (STRLEN)size)) {
			SvUTF8_on(data_sv);
		}
		free((void*)data);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(data_sv));
		PUSHs(sv_2mortal(type_sv));

bool
BNodeInfo::SetIconFromData(data_sv)
	INPUT:
		SV* data_sv;
	INIT:
		const uint8* data;
		STRLEN data_sv_length;
		size_t size;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: data
		data = (const uint8*)SvPV(data_sv, data_sv_length);
		size = data_sv_length;
		// not an XS input: size
		
		retval = THIS->SetIcon(data, size);
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

char*
BNodeInfo::GetPreferredApp(...)
	INIT:
		char* signature;
		app_verb verb = B_OPEN;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 2: verb
		if (items > 2) {
			verb = (app_verb)SvIV(ST(2));
		}
		
		retval = THIS->GetPreferredApp(signature, verb);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = signature;
	OUTPUT:
		RETVAL

bool
BNodeInfo::SetPreferredApp(signature, ...)
	INPUT:
		char* signature;
	INIT:
		app_verb verb = B_OPEN;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: signature
		// item 2: verb
		if (items > 2) {
			verb = (app_verb)SvIV(ST(2));
		}
		
		retval = THIS->SetPreferredApp(signature, verb);
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
BNodeInfo::GetAppHint()
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetAppHint(ref);
		
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

bool
BNodeInfo::SetAppHint(ref)
	INPUT:
		entry_ref* ref;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: ref
		
		retval = THIS->SetAppHint(ref);
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
BNodeInfo::operator_eq(object, swap)
	INPUT:
		BNodeInfo* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BNodeInfo::operator_ne(object, swap)
	INPUT:
		BNodeInfo* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::NodeInfo::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::NodeInfo::()", XS_Haiku__StorageKit_nil, file);

