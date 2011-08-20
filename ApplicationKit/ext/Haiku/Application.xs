#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Application

PROTOTYPES: DISABLE

SV*
BApplication::new(signature)
	INPUT:
		const char* signature;
	INIT:
		status_t error;
		BApplication* retval;
		SV* error_sv;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: signature
		
		retval = new BApplication(signature, &error);
		
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
		BApplication* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BApplication(archive);
		
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
		BApplication* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BApplication");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BApplication*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BApplication::Instantiate(data)
	INPUT:
		BMessage* data;
	INIT:
		BArchivable* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->Instantiate(data);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Archivable", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BApplication::Archive(...)
	INIT:
		BMessage* data;
		bool deep = true;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 2: deep
		if (items > 2) {
			deep = SvTRUE(ST(2));
		}
		
		retval = THIS->Archive(data, deep);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = create_perl_object((void*)data, "Haiku::Message", false);
		DUMPME(1,data_sv);
		RETVAL = newSVsv(data_sv);
		SvREFCNT_dec(data_sv);
	OUTPUT:
		RETVAL

bool
BApplication::InitCheck()
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
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

thread_id
BApplication::Run()
	INIT:
		thread_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Run();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BApplication::Quit()
	CODE:
		// item 0: THIS
		
		THIS->Quit();

SV*
BApplication::ResolveSpecifier(message, index, specifier, form, property)
	INPUT:
		BMessage* message;
		int32 index;
		BMessage* specifier;
		int32 form;
		const char* property;
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: index
		// item 3: specifier
		// item 4: form
		// item 5: property
		
		retval = THIS->ResolveSpecifier(message, index, specifier, form, property);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BApplication::ShowCursor()
	CODE:
		// item 0: THIS
		
		THIS->ShowCursor();

void
BApplication::HideCursor()
	CODE:
		// item 0: THIS
		
		THIS->HideCursor();

void
BApplication::ObscureCursor()
	CODE:
		// item 0: THIS
		
		THIS->ObscureCursor();

bool
BApplication::IsCursorHidden()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsCursorHidden();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BApplication::SetCursorData(cursor_sv)
	INPUT:
		SV* cursor_sv;
	INIT:
		const void* cursor;
	CODE:
		// item 0: THIS
		// item 1: cursor
		cursor = (const void*)SvPV_nolen(cursor_sv);
		
		THIS->SetCursor(cursor);

void
BApplication::SetCursor(cursor, ...)
	INPUT:
		BCursor* cursor;
	INIT:
		bool sync = true;
	CODE:
		// item 0: THIS
		// item 1: cursor
		// item 2: sync
		if (items > 2) {
			sync = SvTRUE(ST(2));
		}
		
		THIS->SetCursor(cursor, sync);

int32
BApplication::CountWindows()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountWindows();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BApplication::WindowAt(index)
	INPUT:
		int32 index;
	INIT:
		BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->WindowAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Window", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
BApplication::CountLoopers()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountLoopers();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BApplication::LooperAt(index)
	INPUT:
		int32 index;
	INIT:
		BLooper* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->LooperAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Looper", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BApplication::IsLaunching()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsLaunching();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BApplication::DispatchMessage(message, handler)
	INPUT:
		BMessage* message;
		BHandler* handler;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: handler
		
		THIS->DispatchMessage(message, handler);

void
BApplication::SetPulseRate(rate)
	INPUT:
		bigtime_t rate;
	CODE:
		// item 0: THIS
		// item 1: rate
		
		THIS->SetPulseRate(rate);

bool
BApplication::GetSupportedSuites(data)
	INPUT:
		BMessage* data;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->GetSupportedSuites(data);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BApplication::QuitRequested()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->BApplication::QuitRequested();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BApplication::Pulse()
	CODE:
		// item 0: THIS
		
		THIS->BApplication::Pulse();

void
BApplication::ReadyToRun()
	CODE:
		// item 0: THIS
		
		THIS->BApplication::ReadyToRun();

void
BApplication::MessageReceived(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		must_not_delete_cpp_object(ST(1), true);
		
		THIS->BApplication::MessageReceived(message);

void
BApplication::ArgvReceived(argv_sv)
	INPUT:
		SV* argv_sv;
	INIT:
		int32 argc;
		char** argv;
		AV* argv_sv_av;
	CODE:
		// item 0: THIS
		// not an XS input: argc
		// item 1: argv
		argv = (char**)malloc(argc * sizeof(char*));
		//Converting Perl arg 'argv_sv' to C array 'argv'
		argv_sv_av = (AV*)SvRV(argv_sv);
		argc = av_len(argv_sv_av) + 1;
		for (int i = 0; i < argc; i++) {
			SV** element_sv = av_fetch(argv_sv_av, i, 0);
			if (element_sv == NULL) {
				argv[i] = NULL;
				continue;
			}
			argv[i] = (char*)SvPV_nolen(*element_sv);
		}
		
		THIS->BApplication::ArgvReceived(argc, argv);
		
		free((void*)argv);

void
BApplication::AppActivated(active)
	INPUT:
		bool active;
	CODE:
		// item 0: THIS
		// item 1: active
		
		THIS->BApplication::AppActivated(active);

void
BApplication::RefsReceived(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		
		THIS->BApplication::RefsReceived(message);

void
BApplication::AboutRequested()
	CODE:
		// item 0: THIS
		
		THIS->BApplication::AboutRequested();

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
BApplication::operator_eq(object, swap)
	INPUT:
		BApplication* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BApplication::operator_ne(object, swap)
	INPUT:
		BApplication* object;
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
		get_sv("Haiku::Application::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Application::()", XS_Haiku__ApplicationKit_nil, file);

