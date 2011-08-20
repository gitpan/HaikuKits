#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Invoker

PROTOTYPES: DISABLE

SV*
BInvoker::new(message, handler, ...)
	INPUT:
		BMessage* message;
		BHandler* handler;
	INIT:
		BLooper* looper = NULL;
		BInvoker* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: message
		// item 2: handler
		// item 3: looper
		if (items > 3) {
			looper = (BLooper*)get_cpp_object(ST(3));
		}
		
		retval = new BInvoker(message, handler, looper);
		
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
newWithMessenger(CLASS, message, messenger)
	INPUT:
		char* CLASS;
		BMessage* message;
		BMessenger messenger;
	INIT:
		BInvoker* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: message
		// item 2: messenger
		
		retval = new BInvoker(message, messenger);
		
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
newEmpty(CLASS)
	INPUT:
		char* CLASS;
	INIT:
		BInvoker* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BInvoker();
		
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
		BInvoker* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BInvoker");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BInvoker*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BInvoker::SetMessage(message)
	INPUT:
		BMessage* message;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		
		retval = THIS->SetMessage(message);
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
BInvoker::Message()
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Message();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

uint32
BInvoker::Command()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Command();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BInvoker::SetTarget(handler, ...)
	INPUT:
		BHandler* handler;
	INIT:
		BLooper* looper = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: handler
		// item 2: looper
		if (items > 2) {
			looper = (BLooper*)get_cpp_object(ST(2));
		}
		
		retval = THIS->SetTarget(handler, looper);
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
BInvoker::SetTargetMessenger(messenger)
	INPUT:
		BMessenger messenger;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: messenger
		
		retval = THIS->SetTarget(messenger);
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
BInvoker::IsTargetLocal()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsTargetLocal();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BInvoker::Target()
	INIT:
		BLooper* looper = NULL;
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* looper_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		retval = THIS->Target(&looper);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		looper_sv = create_perl_object((void*)looper, "Haiku::Looper", false);
		DUMPME(1,looper_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(looper_sv));

SV*
BInvoker::Messenger()
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
BInvoker::SetHandlerForReply(handler)
	INPUT:
		BHandler* handler;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: handler
		
		retval = THIS->SetHandlerForReply(handler);
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
BInvoker::HandlerForReply()
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->HandlerForReply();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BInvoker::Invoke(...)
	INIT:
		BMessage* message = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		if (items > 1) {
			message = (BMessage*)get_cpp_object(ST(1));
		}
		
		retval = THIS->Invoke(message);
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
BInvoker::InvokeNotify(message, ...)
	INPUT:
		BMessage* message;
	INIT:
		uint32 kind = B_CONTROL_INVOKED;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: kind
		if (items > 2) {
			kind = (uint32)SvUV(ST(2));
		}
		
		retval = THIS->InvokeNotify(message, kind);
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
BInvoker::SetTimeout(timeout)
	INPUT:
		bigtime_t timeout;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: timeout
		
		retval = THIS->SetTimeout(timeout);
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

bigtime_t
BInvoker::Timeout()
	INIT:
		bigtime_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Timeout();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BInvoker::operator_eq(object, swap)
	INPUT:
		BInvoker* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BInvoker::operator_ne(object, swap)
	INPUT:
		BInvoker* object;
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
		get_sv("Haiku::Invoker::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Invoker::()", XS_Haiku__ApplicationKit_nil, file);

