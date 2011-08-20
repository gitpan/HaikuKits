#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::MimeType

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
		BMimeType* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BMimeType();
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMimeType::new(mimeType)
	INPUT:
		const char* mimeType;
	INIT:
		BMimeType* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: mimeType
		
		retval = new BMimeType(mimeType);
		
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
		BMimeType* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMimeType");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMimeType*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BMimeType::SetTo(mimeType)
	INPUT:
		const char* mimeType;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: mimeType
		
		retval = THIS->SetTo(mimeType);
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
BMimeType::Unset()
	CODE:
		// item 0: THIS
		
		THIS->Unset();

status_t
BMimeType::InitCheck()
	INIT:
		status_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->InitCheck();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMimeType::Type()
	INIT:
		const char* retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Type();
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
BMimeType::IsValid()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsValid();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMimeType::IsSupertypeOnly()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSupertypeOnly();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMimeType::GetSupertype()
	INIT:
		BMimeType* superType;
		status_t retval;
		SV* error_sv;
		SV* superType_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetSupertype(superType);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		superType_sv = create_perl_object((void*)superType, "Haiku::MimeType", false);
		DUMPME(1,superType_sv);
		RETVAL = newSVsv(superType_sv);
		SvREFCNT_dec(superType_sv);
	OUTPUT:
		RETVAL

status_t
BMimeType::Install()
	INIT:
		status_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Install();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

status_t
BMimeType::Delete()
	INIT:
		status_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Delete();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMimeType::IsInstalled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsInstalled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMimeType::GetIconData()
	INIT:
		uint8** data;
		size_t size;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// not an XS input: size
		data = (uint8**)malloc(size);
		
		retval = THIS->GetIcon(data, &size);
		
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
		RETVAL = data_sv;
	OUTPUT:
		RETVAL

char*
BMimeType::GetPreferredApp(...)
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

SV*
BMimeType::GetAttrInfo()
	INIT:
		BMessage* info;
		status_t retval;
		SV* error_sv;
		SV* info_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetAttrInfo(info);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		info_sv = create_perl_object((void*)info, "Haiku::Message", false);
		DUMPME(1,info_sv);
		RETVAL = newSVsv(info_sv);
		SvREFCNT_dec(info_sv);
	OUTPUT:
		RETVAL

SV*
BMimeType::GetFileExtensions()
	INIT:
		BMessage* extensions;
		status_t retval;
		SV* error_sv;
		SV* extensions_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetFileExtensions(extensions);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		extensions_sv = create_perl_object((void*)extensions, "Haiku::Message", false);
		DUMPME(1,extensions_sv);
		RETVAL = newSVsv(extensions_sv);
		SvREFCNT_dec(extensions_sv);
	OUTPUT:
		RETVAL

char*
BMimeType::GetShortDescription()
	INIT:
		char* description;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetShortDescription(description);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = description;
	OUTPUT:
		RETVAL

char*
BMimeType::GetLongDescription()
	INIT:
		char* description;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetLongDescription(description);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = description;
	OUTPUT:
		RETVAL

SV*
BMimeType::GetSupportingApps()
	INIT:
		BMessage* signatures;
		status_t retval;
		SV* error_sv;
		SV* signatures_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetSupportingApps(signatures);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		signatures_sv = create_perl_object((void*)signatures, "Haiku::Message", false);
		DUMPME(1,signatures_sv);
		RETVAL = newSVsv(signatures_sv);
		SvREFCNT_dec(signatures_sv);
	OUTPUT:
		RETVAL

bool
BMimeType::SetIconFromData(data_sv)
	INPUT:
		SV* data_sv;
	INIT:
		uint8* data;
		STRLEN data_sv_length;
		size_t size;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: data
		data = (uint8*)SvPV(data_sv, data_sv_length);
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

bool
BMimeType::SetPreferredApp(signature, ...)
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

bool
BMimeType::SetAttrInfo(info)
	INPUT:
		BMessage* info;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: info
		
		retval = THIS->SetAttrInfo(info);
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
BMimeType::SetFileExtensions(extensions)
	INPUT:
		BMessage* extensions;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: extensions
		
		retval = THIS->SetFileExtensions(extensions);
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
BMimeType::SetShortDescription(description)
	INPUT:
		char* description;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: description
		
		retval = THIS->SetShortDescription(description);
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
BMimeType::SetLongDescription()
	INIT:
		char* description;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->SetLongDescription(description);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = description;
	OUTPUT:
		RETVAL

SV*
BMimeType::SetAppHint()
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->SetAppHint(ref);
		
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
BMimeType::GetAppHint(ref)
	INPUT:
		entry_ref* ref;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: ref
		
		retval = THIS->GetAppHint(ref);
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
BMimeType::GetIconDataForType(type)
	INPUT:
		const char* type;
	INIT:
		uint8** data;
		size_t size;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: type
		// not an XS input: size
		data = (uint8**)malloc(size);
		
		retval = THIS->GetIconForType(type, data, &size);
		
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
		RETVAL = data_sv;
	OUTPUT:
		RETVAL

bool
BMimeType::SetIconFromDataForType(type, data_sv)
	INPUT:
		const char* type;
		SV* data_sv;
	INIT:
		uint8* data;
		size_t size;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: type
		// item 2: data
		data = (uint8*)malloc(size);
		memcpy((void*)&data, (void*)SvPV(data_sv, size), size);
		// not an XS input: size
		
		retval = THIS->SetIconForType(type, data, size);
		RETVAL = true;
		
		free((void*)data);
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
GetInstalledSupertypes(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BMessage* supertypes;
		status_t retval;
		SV* error_sv;
		SV* supertypes_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = BMimeType::GetInstalledSupertypes(supertypes);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		supertypes_sv = create_perl_object((void*)supertypes, "Haiku::Message", false);
		DUMPME(1,supertypes_sv);
		RETVAL = newSVsv(supertypes_sv);
		SvREFCNT_dec(supertypes_sv);
	OUTPUT:
		RETVAL

SV*
GetInstalledTypes(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BMessage* types;
		status_t retval;
		SV* error_sv;
		SV* types_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = BMimeType::GetInstalledTypes(types);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		types_sv = create_perl_object((void*)types, "Haiku::Message", false);
		DUMPME(1,types_sv);
		RETVAL = newSVsv(types_sv);
		SvREFCNT_dec(types_sv);
	OUTPUT:
		RETVAL

SV*
GetInstalledTypeForSupertype(CLASS, supertype)
	INPUT:
		char* CLASS;
		const char* supertype;
	INIT:
		BMessage* subtypes;
		status_t retval;
		SV* error_sv;
		SV* subtypes_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: supertype
		
		retval = BMimeType::GetInstalledTypes(supertype, subtypes);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		subtypes_sv = create_perl_object((void*)subtypes, "Haiku::Message", false);
		DUMPME(1,subtypes_sv);
		RETVAL = newSVsv(subtypes_sv);
		SvREFCNT_dec(subtypes_sv);
	OUTPUT:
		RETVAL

SV*
GetWildcardApps(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BMessage* wildcardApps;
		status_t retval;
		SV* error_sv;
		SV* wildcardApps_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = BMimeType::GetWildcardApps(wildcardApps);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		wildcardApps_sv = create_perl_object((void*)wildcardApps, "Haiku::Message", false);
		DUMPME(1,wildcardApps_sv);
		RETVAL = newSVsv(wildcardApps_sv);
		SvREFCNT_dec(wildcardApps_sv);
	OUTPUT:
		RETVAL

bool
IsMimeTypeValid(CLASS, mimeType)
	INPUT:
		char* CLASS;
		const char* mimeType;
	INIT:
		bool retval;
	CODE:
		// item 0: CLASS
		// item 1: mimeType
		
		retval = BMimeType::IsValid(mimeType);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
GuessMimeTypeForEntryRef(CLASS, file)
	INPUT:
		char* CLASS;
		const entry_ref* file;
	INIT:
		BMimeType* type;
		status_t retval;
		SV* error_sv;
		SV* type_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: file
		
		retval = BMimeType::GuessMimeType(file, type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		type_sv = create_perl_object((void*)type, "Haiku::MimeType", false);
		DUMPME(1,type_sv);
		RETVAL = newSVsv(type_sv);
		SvREFCNT_dec(type_sv);
	OUTPUT:
		RETVAL

SV*
GuessMimeTypeForString(CLASS, buffer_sv)
	INPUT:
		char* CLASS;
		SV* buffer_sv;
	INIT:
		void* buffer;
		STRLEN buffer_sv_length;
		int32 length;
		BMimeType* type;
		status_t retval;
		SV* error_sv;
		SV* type_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: buffer
		buffer = (void*)SvPV(buffer_sv, buffer_sv_length);
		length = buffer_sv_length;
		// not an XS input: length
		
		retval = BMimeType::GuessMimeType(buffer, length, type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		type_sv = create_perl_object((void*)type, "Haiku::MimeType", false);
		DUMPME(1,type_sv);
		RETVAL = newSVsv(type_sv);
		SvREFCNT_dec(type_sv);
	OUTPUT:
		RETVAL

SV*
GuessMimeType(CLASS, filename)
	INPUT:
		char* CLASS;
		const char* filename;
	INIT:
		BMimeType* type;
		status_t retval;
		SV* error_sv;
		SV* type_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: filename
		
		retval = BMimeType::GuessMimeType(filename, type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		type_sv = create_perl_object((void*)type, "Haiku::MimeType", false);
		DUMPME(1,type_sv);
		RETVAL = newSVsv(type_sv);
		SvREFCNT_dec(type_sv);
	OUTPUT:
		RETVAL

bool
StartWatching(CLASS, target)
	INPUT:
		char* CLASS;
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: CLASS
		// item 1: target
		
		retval = BMimeType::StartWatching(target);
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
StopWatching(CLASS, target)
	INPUT:
		char* CLASS;
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: CLASS
		// item 1: target
		
		retval = BMimeType::StopWatching(target);
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
B_OPEN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPEN);
		dualize(RETVAL, "B_OPEN");
	OUTPUT:
		RETVAL

SV*
B_APP_MIME_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_APP_MIME_TYPE);
		dualize(RETVAL, "B_APP_MIME_TYPE");
	OUTPUT:
		RETVAL

SV*
B_PEF_APP_MIME_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_PEF_APP_MIME_TYPE);
		dualize(RETVAL, "B_PEF_APP_MIME_TYPE");
	OUTPUT:
		RETVAL

SV*
B_PE_APP_MIME_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_PE_APP_MIME_TYPE);
		dualize(RETVAL, "B_PE_APP_MIME_TYPE");
	OUTPUT:
		RETVAL

SV*
B_ELF_APP_MIME_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_ELF_APP_MIME_TYPE);
		dualize(RETVAL, "B_ELF_APP_MIME_TYPE");
	OUTPUT:
		RETVAL

SV*
B_RESOURCE_MIME_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_RESOURCE_MIME_TYPE);
		dualize(RETVAL, "B_RESOURCE_MIME_TYPE");
	OUTPUT:
		RETVAL

SV*
B_FILE_MIME_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_FILE_MIME_TYPE);
		dualize(RETVAL, "B_FILE_MIME_TYPE");
	OUTPUT:
		RETVAL

SV*
B_META_MIME_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_META_MIME_CHANGED);
		dualize(RETVAL, "B_META_MIME_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_ICON_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ICON_CHANGED);
		dualize(RETVAL, "B_ICON_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_PREFERRED_APP_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PREFERRED_APP_CHANGED);
		dualize(RETVAL, "B_PREFERRED_APP_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_ATTR_INFO_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ATTR_INFO_CHANGED);
		dualize(RETVAL, "B_ATTR_INFO_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_FILE_EXTENSIONS_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FILE_EXTENSIONS_CHANGED);
		dualize(RETVAL, "B_FILE_EXTENSIONS_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_SHORT_DESCRIPTION_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SHORT_DESCRIPTION_CHANGED);
		dualize(RETVAL, "B_SHORT_DESCRIPTION_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_LONG_DESCRIPTION_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LONG_DESCRIPTION_CHANGED);
		dualize(RETVAL, "B_LONG_DESCRIPTION_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_ICON_FOR_TYPE_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ICON_FOR_TYPE_CHANGED);
		dualize(RETVAL, "B_ICON_FOR_TYPE_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_APP_HINT_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_APP_HINT_CHANGED);
		dualize(RETVAL, "B_APP_HINT_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_MIME_TYPE_CREATED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MIME_TYPE_CREATED);
		dualize(RETVAL, "B_MIME_TYPE_CREATED");
	OUTPUT:
		RETVAL

SV*
B_MIME_TYPE_DELETED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MIME_TYPE_DELETED);
		dualize(RETVAL, "B_MIME_TYPE_DELETED");
	OUTPUT:
		RETVAL

SV*
B_SNIFFER_RULE_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SNIFFER_RULE_CHANGED);
		dualize(RETVAL, "B_SNIFFER_RULE_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_SUPPORTED_TYPES_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SUPPORTED_TYPES_CHANGED);
		dualize(RETVAL, "B_SUPPORTED_TYPES_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_EVERYTHING_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_EVERYTHING_CHANGED);
		dualize(RETVAL, "B_EVERYTHING_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_META_MIME_MODIFIED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_META_MIME_MODIFIED);
		dualize(RETVAL, "B_META_MIME_MODIFIED");
	OUTPUT:
		RETVAL

SV*
B_META_MIME_DELETED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_META_MIME_DELETED);
		dualize(RETVAL, "B_META_MIME_DELETED");
	OUTPUT:
		RETVAL

bool
BMimeType::operator_eq(object, swap)
	INPUT:
		BMimeType* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BMimeType::operator_ne(object, swap)
	INPUT:
		BMimeType* object;
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
		get_sv("Haiku::MimeType::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::MimeType::()", XS_Haiku__StorageKit_nil, file);

