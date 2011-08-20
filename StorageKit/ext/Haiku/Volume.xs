#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Volume

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
		BVolume* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BVolume();
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BVolume::new(device)
	INPUT:
		dev_t device;
	INIT:
		BVolume* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: device
		
		retval = new BVolume(device);
		
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
newFromVolume(CLASS, volume)
	INPUT:
		char* CLASS;
		const BVolume volume;
	INIT:
		BVolume* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: volume
		
		retval = new BVolume(volume);
		
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
		BVolume* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BVolume");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BVolume*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BVolume::InitCheck()
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
BVolume::SetTo(device)
	INPUT:
		dev_t device;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: device
		
		retval = THIS->SetTo(device);
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
BVolume::Unset()
	CODE:
		// item 0: THIS
		
		THIS->Unset();

dev_t
BVolume::Device()
	INIT:
		dev_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Device();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

off_t
BVolume::Capacity()
	INIT:
		off_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Capacity();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

off_t
BVolume::FreeBytes()
	INIT:
		off_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FreeBytes();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

off_t
BVolume::BlockSize()
	INIT:
		off_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->BlockSize();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BVolume::GetName()
	INIT:
		char* name;
		status_t retval;
		SV* error_sv;
		STRLEN name_sv_length;
		SV* name_sv = newSV(0);	// retcount == 1
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		name = (char*)malloc(B_FILE_NAME_LENGTH);
		
		retval = THIS->GetName(name);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		name_sv = newSVpv((char*)name, 0);	// 0 lets Perl calculate length
		
		name_sv_length = SvCUR(name_sv);
		if (name_sv_length > B_FILE_NAME_LENGTH) {
			name_sv_length = B_FILE_NAME_LENGTH;
			SvCUR_set(name_sv, name_sv_length);
		}
		
		if (is_utf8_string((const U8*)name, (STRLEN)name_sv_length)) {
			SvUTF8_on(name_sv);
		}
		free((void*)name);
		RETVAL = name_sv;
	OUTPUT:
		RETVAL

bool
BVolume::SetName(name_sv)
	INPUT:
		SV* name_sv;
	INIT:
		char* name;
		STRLEN name_sv_length = SvCUR(name_sv);
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		if (name_sv_length > B_FILE_NAME_LENGTH) {
			char* last_char;
			name_sv_length = B_FILE_NAME_LENGTH;
			SvCUR_set(name_sv, name_sv_length);
			last_char = SvEND(name_sv);	// pointer to last character
			*last_char = '\0';
		}
		
		name = (char*)SvPV(name_sv, name_sv_length);
		
		retval = THIS->SetName(name);
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
BVolume::GetIconData()
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
BVolume::IsRemovable()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsRemovable();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::IsReadOnly()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsReadOnly();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::IsPersistent()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsPersistent();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::IsShared()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsShared();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::KnowsMime()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->KnowsMime();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::KnowsAttr()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->KnowsAttr();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::KnowsQuery()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->KnowsQuery();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BVolume::operator_eq(object, swap)
	INPUT:
		BVolume object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BVolume::operator_ne(object, swap)
	INPUT:
		BVolume object;
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
		get_sv("Haiku::Volume::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Volume::()", XS_Haiku__StorageKit_nil, file);

