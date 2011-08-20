#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::CustomApplication

PROTOTYPES: DISABLE

SV*
Custom_BApplication::new(signature)
	INPUT:
		const char* signature;
	INIT:
		status_t error;
		Custom_BApplication* retval;
		SV* error_sv;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: signature
		
		retval = new Custom_BApplication(signature, &error);
		
		if (error != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)error);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)error);
			XSRETURN_UNDEF;
		}
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		retval->perl_link_data = get_link_data(retval_sv);
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
newFromArchive(CLASS, archive)
	INPUT:
		char* CLASS;
		BMessage* archive;
	INIT:
		Custom_BApplication* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new Custom_BApplication(archive);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		retval->perl_link_data = get_link_data(retval_sv);
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
		Custom_BApplication* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for Custom_BApplication");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (Custom_BApplication*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
be_app()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)be_app, "Haiku::Application", true));
		dualize(RETVAL, "be_app");
	OUTPUT:
		RETVAL

SV*
be_app_messenger()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&be_app_messenger, "Haiku::Messenger", true));
		dualize(RETVAL, "be_app_messenger");
	OUTPUT:
		RETVAL

bool
Custom_BApplication::operator_eq(object, swap)
	INPUT:
		Custom_BApplication* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
Custom_BApplication::operator_ne(object, swap)
	INPUT:
		Custom_BApplication* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__ApplicationKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::CustomApplication::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::CustomApplication::()", XS_Haiku__ApplicationKit_nil, file);

