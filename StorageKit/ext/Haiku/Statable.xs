#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Statable

PROTOTYPES: DISABLE

bool
BStatable::IsFile()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFile();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BStatable::IsDirectory()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsDirectory();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BStatable::IsSymLink()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSymLink();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BStatable::GetNodeRef()
	INIT:
		node_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetNodeRef(ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::node_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

uid_t
BStatable::GetOwner()
	INIT:
		uid_t owner;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetOwner(&owner);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = owner;
	OUTPUT:
		RETVAL

bool
BStatable::SetOwner(owner)
	INPUT:
		uid_t owner;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: owner
		
		retval = THIS->SetOwner(owner);
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

gid_t
BStatable::GetGroup()
	INIT:
		gid_t group;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetGroup(&group);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = group;
	OUTPUT:
		RETVAL

bool
BStatable::SetGroup(group)
	INPUT:
		gid_t group;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: group
		
		retval = THIS->SetGroup(group);
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

mode_t
BStatable::GetPermissions()
	INIT:
		mode_t perms;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetPermissions(&perms);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = perms;
	OUTPUT:
		RETVAL

bool
BStatable::SetPermissions(perms)
	INPUT:
		mode_t perms;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: perms
		
		retval = THIS->SetPermissions(perms);
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

off_t
BStatable::GetSize()
	INIT:
		off_t size;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetSize(&size);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = size;
	OUTPUT:
		RETVAL

time_t
BStatable::GetModificationTime()
	INIT:
		time_t mtime;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetModificationTime(&mtime);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = mtime;
	OUTPUT:
		RETVAL

bool
BStatable::SetModificationTime(mtime)
	INPUT:
		time_t mtime;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: mtime
		
		retval = THIS->SetModificationTime(mtime);
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

time_t
BStatable::GetCreationTime()
	INIT:
		time_t ctime;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetCreationTime(&ctime);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = ctime;
	OUTPUT:
		RETVAL

bool
BStatable::SetCreationTime(ctime)
	INPUT:
		time_t ctime;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: ctime
		
		retval = THIS->SetCreationTime(ctime);
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

time_t
BStatable::GetAccessTime()
	INIT:
		time_t atime;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->GetAccessTime(&atime);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = atime;
	OUTPUT:
		RETVAL

bool
BStatable::SetAccessTime(atime)
	INPUT:
		time_t atime;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: atime
		
		retval = THIS->SetAccessTime(atime);
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
BStatable::GetVolume()
	INIT:
		BVolume* vol;
		status_t retval;
		SV* error_sv;
		SV* vol_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetVolume(vol);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		vol_sv = create_perl_object((void*)vol, "Haiku::Volume", false);
		DUMPME(1,vol_sv);
		RETVAL = newSVsv(vol_sv);
		SvREFCNT_dec(vol_sv);
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Statable::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Statable::()", XS_Haiku__StorageKit_nil, file);

