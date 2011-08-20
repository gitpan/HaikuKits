#
# Automatically generated file
#

MODULE = Haiku::SupportKit	PACKAGE = Haiku::Unarchiver

PROTOTYPES: DISABLE

SV*
BUnarchiver::new(archive)
	INPUT:
		BMessage* archive;
	INIT:
		BUnarchiver* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BUnarchiver(archive);
		
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
		BUnarchiver* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BUnarchiver");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BUnarchiver*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BUnarchiver::EnsureUnarchived(name, ...)
	INPUT:
		const char* name;
	INIT:
		int32 index = 0;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		if (items > 2) {
			index = (int32)SvIV(ST(2));
		}
		
		retval = THIS->EnsureUnarchived(name, index);
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

bool
BUnarchiver::EnsureUnarchivedByToken(token)
	INPUT:
		int32 token;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: token
		
		retval = THIS->EnsureUnarchived(token);
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

bool
BUnarchiver::IsInstantiated(name, ...)
	INPUT:
		const char* name;
	INIT:
		int32 index = 0;
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		if (items > 2) {
			index = (int32)SvIV(ST(2));
		}
		
		retval = THIS->IsInstantiated(name, index);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BUnarchiver::IsInstantiatedByToken(token)
	INPUT:
		int32 token;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: token
		
		retval = THIS->IsInstantiated(token);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BUnarchiver::Finish(...)
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
BUnarchiver::ArchiveMessage()
	INIT:
		const BMessage* retval;
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

void
BUnarchiver::AssumeOwnership(archivable)
	INPUT:
		BArchivable* archivable;
	CODE:
		// item 0: THIS
		// item 1: archivable
		
		THIS->AssumeOwnership(archivable);

void
BUnarchiver::RelinquishOwnership(archivable)
	INPUT:
		BArchivable* archivable;
	CODE:
		// item 0: THIS
		// item 1: archivable
		
		THIS->RelinquishOwnership(archivable);

bool
BUnarchiver::IsArchiveManaged(archive)
	INPUT:
		BMessage* archive;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->IsArchiveManaged(archive);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BUnarchiver::PrepareArchive(archive)
	INPUT:
		BMessage* archive;
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->PrepareArchive(archive);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
instantiate_object(from)
	INPUT:
		BMessage* from;
	INIT:
		BArchivable* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: from
		
		retval = instantiate_object(from);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Archivable", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
instantiate_object_with_id(from)
	INPUT:
		BMessage* from;
	INIT:
		image_id id;
		BArchivable* retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* id_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: from
		
		retval = instantiate_object(from, &id);
		sv_setiv(id_sv, (IV)id);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Archivable", false);
		DUMPME(1,retval_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(id_sv));

bool
validate_instantiation(from, className)
	INPUT:
		BMessage* from;
		const char* className;
	INIT:
		bool retval;
	CODE:
		// item 0: from
		// item 1: className
		
		retval = validate_instantiation(from, className);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
B_ASSUME_OWNERSHIP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)BUnarchiver::B_ASSUME_OWNERSHIP);
		dualize(RETVAL, "B_ASSUME_OWNERSHIP");
	OUTPUT:
		RETVAL

SV*
B_DONT_ASSUME_OWNERSHIP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)BUnarchiver::B_DONT_ASSUME_OWNERSHIP);
		dualize(RETVAL, "B_DONT_ASSUME_OWNERSHIP");
	OUTPUT:
		RETVAL

bool
BUnarchiver::operator_eq(object, swap)
	INPUT:
		BUnarchiver* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BUnarchiver::operator_ne(object, swap)
	INPUT:
		BUnarchiver* object;
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
		get_sv("Haiku::Unarchiver::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Unarchiver::()", XS_Haiku__SupportKit_nil, file);

