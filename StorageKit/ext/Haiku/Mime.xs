#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Mime

PROTOTYPES: DISABLE

int
update_mime_info(path, recursive, synchronous, force)
	INPUT:
		const char* path;
		int recursive;
		int synchronous;
		int force;
	INIT:
		int retval;
	CODE:
		// item 0: path
		// item 1: recursive
		// item 2: synchronous
		// item 3: force
		
		retval = update_mime_info(path, recursive, synchronous, force);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
create_app_meta_mime(path, recursive, synchronous, force)
	INPUT:
		const char* path;
		int recursive;
		int synchronous;
		int force;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: path
		// item 1: recursive
		// item 2: synchronous
		// item 3: force
		
		retval = create_app_meta_mime(path, recursive, synchronous, force);
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
get_device_icon_as_data(device)
	INPUT:
		const char* device;
	INIT:
		void* icon;
		int32 size;
		status_t retval;
		SV* error_sv;
		SV* icon_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: device
		// not an XS input: size
		
		retval = get_device_icon(device, icon, size);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		icon_sv = newSVpvn((char*)icon, (STRLEN)size);
		if (is_utf8_string((const U8*)icon, (STRLEN)size)) {
			SvUTF8_on(icon_sv);
		}
		RETVAL = icon_sv;
	OUTPUT:
		RETVAL

void
get_device_icon_with_type(device)
	INPUT:
		const char* device;
	INIT:
		uint8** data;
		size_t size;
		type_code type;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount > 1
		SV* type_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: device
		// not an XS input: size
		data = (uint8**)malloc(size);
		
		retval = get_device_icon(device, data, &size, &type);
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

void
get_named_icon_with_type(name)
	INPUT:
		const char* name;
	INIT:
		uint8** data;
		size_t size;
		type_code type;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount > 1
		SV* type_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: name
		// not an XS input: size
		data = (uint8**)malloc(size);
		
		retval = get_named_icon(name, data, &size, &type);
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

SV*
B_LARGE_ICON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LARGE_ICON);
		dualize(RETVAL, "B_LARGE_ICON");
	OUTPUT:
		RETVAL

SV*
B_MINI_ICON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MINI_ICON);
		dualize(RETVAL, "B_MINI_ICON");
	OUTPUT:
		RETVAL

SV*
B_UPDATE_MIME_INFO_NO_FORCE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UPDATE_MIME_INFO_NO_FORCE);
		dualize(RETVAL, "B_UPDATE_MIME_INFO_NO_FORCE");
	OUTPUT:
		RETVAL

SV*
B_UPDATE_MIME_INFO_FORCE_KEEP_TYPE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UPDATE_MIME_INFO_FORCE_KEEP_TYPE);
		dualize(RETVAL, "B_UPDATE_MIME_INFO_FORCE_KEEP_TYPE");
	OUTPUT:
		RETVAL

SV*
B_UPDATE_MIME_INFO_FORCE_UPDATE_ALL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UPDATE_MIME_INFO_FORCE_UPDATE_ALL);
		dualize(RETVAL, "B_UPDATE_MIME_INFO_FORCE_UPDATE_ALL");
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Mime::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Mime::()", XS_Haiku__StorageKit_nil, file);

