#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Looper

PROTOTYPES: DISABLE

SV*
BLooper::new(...)
	INIT:
		const char* name = NULL;
		int32 priority = B_NORMAL_PRIORITY;
		int32 portCapacity = B_LOOPER_PORT_DEFAULT_CAPACITY;
		BLooper* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		if (items > 1) {
			name = (const char*)SvPV_nolen(ST(1));
		}
		// item 2: priority
		if (items > 2) {
			priority = (int32)SvIV(ST(2));
		}
		// item 3: portCapacity
		if (items > 3) {
			portCapacity = (int32)SvIV(ST(3));
		}
		
		retval = new BLooper(name, priority, portCapacity);
		
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
		BLooper* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BLooper(archive);
		
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
		BLooper* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BLooper");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BLooper*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BLooper::Instantiate(data)
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
BLooper::Archive(...)
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
BLooper::PostMessage(message)
	INPUT:
		BMessage* message;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		
		retval = THIS->PostMessage(message);
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
BLooper::PostMessageCommand(command)
	INPUT:
		uint32 command;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: command
		
		retval = THIS->PostMessage(command);
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
BLooper::PostMessageToHandler(message, handler, ...)
	INPUT:
		BMessage* message;
		BHandler* handler;
	INIT:
		BHandler* replyTo = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: handler
		// item 3: replyTo
		if (items > 3) {
			replyTo = (BHandler*)get_cpp_object(ST(3));
		}
		
		retval = THIS->PostMessage(message, handler, replyTo);
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
BLooper::PostMessageCommandToHandler(command, handler, ...)
	INPUT:
		uint32 command;
		BHandler* handler;
	INIT:
		BHandler* replyTo = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: command
		// item 2: handler
		// item 3: replyTo
		if (items > 3) {
			replyTo = (BHandler*)get_cpp_object(ST(3));
		}
		
		retval = THIS->PostMessage(command, handler, replyTo);
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

void
BLooper::DispatchMessage(message, handler)
	INPUT:
		BMessage* message;
		BHandler* handler;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: handler
		
		THIS->DispatchMessage(message, handler);

SV*
BLooper::CurrentMessage()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->CurrentMessage();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BLooper::DetachCurrentMessage()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DetachCurrentMessage();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BLooper::IsMessageWaiting()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsMessageWaiting();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BLooper::AddHandler(handler)
	INPUT:
		BHandler* handler;
	CODE:
		// item 0: THIS
		// item 1: handler
		
		THIS->AddHandler(handler);

bool
BLooper::RemoveHandler(handler)
	INPUT:
		BHandler* handler;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: handler
		
		retval = THIS->RemoveHandler(handler);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BLooper::CountHandlers()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountHandlers();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BLooper::HandlerAt(index)
	INPUT:
		int32 index;
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->HandlerAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
BLooper::IndexOf(handler)
	INPUT:
		BHandler* handler;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: handler
		
		retval = THIS->IndexOf(handler);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BLooper::PreferredHandler()
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->PreferredHandler();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BLooper::SetPreferredHandler(handler)
	INPUT:
		BHandler* handler;
	CODE:
		// item 0: THIS
		// item 1: handler
		
		THIS->SetPreferredHandler(handler);

thread_id
BLooper::Run()
	INIT:
		thread_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Run();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BLooper::Quit()
	CODE:
		// item 0: THIS
		
		THIS->Quit();

bool
BLooper::Lock()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Lock();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BLooper::Unlock()
	CODE:
		// item 0: THIS
		
		THIS->Unlock();

bool
BLooper::IsLocked()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsLocked();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BLooper::LockWithTimeout(timeout)
	INPUT:
		bigtime_t timeout;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: timeout
		
		retval = THIS->LockWithTimeout(timeout);
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
BLooper::Thread()
	INIT:
		thread_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Thread();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

team_id
BLooper::Team()
	INIT:
		team_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Team();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BLooper::LooperForThread(thread)
	INPUT:
		thread_id thread;
	INIT:
		BLooper* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: thread
		
		retval = THIS->LooperForThread(thread);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Looper", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

thread_id
BLooper::LockingThread()
	INIT:
		thread_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->LockingThread();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BLooper::CountLocks()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountLocks();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BLooper::CountLockRequests()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountLockRequests();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

sem_id
BLooper::Sem()
	INIT:
		sem_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Sem();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BLooper::ResolveSpecifier(message, index, specifier, form, property)
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

bool
BLooper::GetSupportedSuites(data)
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

SV*
B_LOOPER_PORT_DEFAULT_CAPACITY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LOOPER_PORT_DEFAULT_CAPACITY);
		dualize(RETVAL, "B_LOOPER_PORT_DEFAULT_CAPACITY");
	OUTPUT:
		RETVAL

bool
BLooper::operator_eq(object, swap)
	INPUT:
		BLooper* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BLooper::operator_ne(object, swap)
	INPUT:
		BLooper* object;
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
		get_sv("Haiku::Looper::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Looper::()", XS_Haiku__ApplicationKit_nil, file);

