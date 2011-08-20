#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::VolumeRoster

PROTOTYPES: DISABLE

SV*
BVolumeRoster::new()
	INIT:
		BVolumeRoster* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BVolumeRoster();
		
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
		BVolumeRoster* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BVolumeRoster");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BVolumeRoster*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BVolumeRoster::GetNextVolume()
	INIT:
		BVolume* volume = new BVolume();
		status_t retval;
		SV* error_sv;
		SV* volume_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetNextVolume(volume);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		volume_sv = create_perl_object((void*)volume, "Haiku::Volume", false);
		DUMPME(1,volume_sv);
		RETVAL = newSVsv(volume_sv);
		SvREFCNT_dec(volume_sv);
	OUTPUT:
		RETVAL

void
BVolumeRoster::Rewind()
	CODE:
		// item 0: THIS
		
		THIS->Rewind();

SV*
BVolumeRoster::GetBootVolume()
	INIT:
		BVolume* volume = new BVolume();
		status_t retval;
		SV* error_sv;
		SV* volume_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetBootVolume(volume);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		volume_sv = create_perl_object((void*)volume, "Haiku::Volume", false);
		DUMPME(1,volume_sv);
		RETVAL = newSVsv(volume_sv);
		SvREFCNT_dec(volume_sv);
	OUTPUT:
		RETVAL

bool
BVolumeRoster::StartWatching(...)
	INIT:
		BMessenger name = be_app_messenger;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		if (items > 1) {
			name = *(BMessenger*)get_cpp_object(ST(1));
		}
		
		retval = THIS->StartWatching(name);
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
BVolumeRoster::StopWatching()
	CODE:
		// item 0: THIS
		
		THIS->StopWatching();

SV*
BVolumeRoster::Messenger()
	INIT:
		BMessenger retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Messenger();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Messenger", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BVolumeRoster::operator_eq(object, swap)
	INPUT:
		BVolumeRoster* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BVolumeRoster::operator_ne(object, swap)
	INPUT:
		BVolumeRoster* object;
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
		get_sv("Haiku::VolumeRoster::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::VolumeRoster::()", XS_Haiku__StorageKit_nil, file);

