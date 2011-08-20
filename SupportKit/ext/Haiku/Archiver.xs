#
# Automatically generated file
#

MODULE = Haiku::SupportKit	PACKAGE = Haiku::Archiver

PROTOTYPES: DISABLE

SV*
BArchiver::new(archive)
	INPUT:
		BMessage* archive;
	INIT:
		BArchiver* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BArchiver(archive);
		
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
		BArchiver* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BArchiver");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BArchiver*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BArchiver::AddArchivable(name, archivable, ...)
	INPUT:
		const char* name;
		BArchivable* archivable;
	INIT:
		bool deep = true;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: archivable
		// item 3: deep
		if (items > 3) {
			deep = SvTRUE(ST(3));
		}
		
		retval = THIS->AddArchivable(name, archivable, deep);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

int32
BArchiver::GetTokenForArchivable(archivable)
	INPUT:
		BArchivable* archivable;
	INIT:
		int32 token;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: archivable
		
		retval = THIS->GetTokenForArchivable(archivable, token);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = token;
	OUTPUT:
		RETVAL

int32
BArchiver::DeepGetTokenForArchivable(archivable, deep)
	INPUT:
		BArchivable* archivable;
		bool deep;
	INIT:
		int32 token;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: archivable
		// item 2: deep
		
		retval = THIS->GetTokenForArchivable(archivable, deep, token);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = token;
	OUTPUT:
		RETVAL

bool
BArchiver::IsArchived(archivable)
	INPUT:
		BArchivable* archivable;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: archivable
		
		retval = THIS->IsArchived(archivable);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BArchiver::Finish(...)
	INIT:
		status_t err = B_OK;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: err
		if (items > 1) {
			err = (status_t)SvIV(ST(1));
		}
		
		retval = THIS->Finish(err);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

SV*
BArchiver::ArchiveMessage()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ArchiveMessage();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BArchiver::operator_eq(object, swap)
	INPUT:
		BArchiver* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BArchiver::operator_ne(object, swap)
	INPUT:
		BArchiver* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__SupportKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Archiver::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Archiver::()", XS_Haiku__SupportKit_nil, file);

