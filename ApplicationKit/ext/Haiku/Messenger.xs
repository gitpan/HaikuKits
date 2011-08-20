#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Messenger

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
		BMessenger* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BMessenger();
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMessenger::new(signature, ...)
	INPUT:
		const char* signature;
	INIT:
		team_id team = -1;
		status_t result;
		BMessenger* retval;
		SV* error_sv;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: signature
		// item 2: team
		if (items > 2) {
			team = (team_id)SvIV(ST(2));
		}
		
		retval = new BMessenger(signature, team, &result);
		
		if (result != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)result);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)result);
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
newCopy(CLASS, Messenger)
	INPUT:
		char* CLASS;
		BMessenger Messenger;
	INIT:
		BMessenger* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: Messenger
		
		retval = new BMessenger(Messenger);
		
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
		BMessenger* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMessenger");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMessenger*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BMessenger::IsTargetLocal()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsTargetLocal();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMessenger::Target()
	INIT:
		BLooper* Looper;
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* Looper_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		retval = THIS->Target(&Looper);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		Looper_sv = create_perl_object((void*)Looper, "Haiku::Looper", false);
		DUMPME(1,Looper_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(Looper_sv));

bool
BMessenger::LockTarget()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->LockTarget();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessenger::LockTargetWithTimeout(timeout)
	INPUT:
		bigtime_t timeout;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: timeout
		
		retval = THIS->LockTargetWithTimeout(timeout);
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
BMessenger::SendCommand(command, ...)
	INPUT:
		uint32 command;
	INIT:
		BHandler* replyTo = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: command
		// item 2: replyTo
		if (items > 2) {
			replyTo = (BHandler*)get_cpp_object(ST(2));
		}
		
		retval = THIS->SendMessage(command, replyTo);
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
BMessenger::SendMessage(message, ...)
	INPUT:
		BMessage* message;
	INIT:
		BHandler* replyTo = NULL;
		bigtime_t timeout = B_INFINITE_TIMEOUT;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: replyTo
		if (items > 2) {
			replyTo = (BHandler*)get_cpp_object(ST(2));
		}
		// item 3: timeout
		if (items > 3) {
			timeout = (bigtime_t)SvIV(ST(3));
		}
		
		retval = THIS->SendMessage(message, replyTo, timeout);
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
BMessenger::SendMessageAndReplyToMessenger(message, replyTo, ...)
	INPUT:
		BMessage* message;
		BMessenger replyTo;
	INIT:
		bigtime_t timeout = B_INFINITE_TIMEOUT;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: replyTo
		// item 3: timeout
		if (items > 3) {
			timeout = (bigtime_t)SvIV(ST(3));
		}
		
		retval = THIS->SendMessage(message, replyTo, timeout);
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
BMessenger::SendCommandWithReply(command, reply)
	INPUT:
		uint32 command;
		BMessage* reply;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: command
		// item 2: reply
		
		retval = THIS->SendMessage(command, reply);
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
BMessenger::SendMessageWithReply(message, reply, ...)
	INPUT:
		BMessage* message;
		BMessage* reply;
	INIT:
		bigtime_t deliveryTimeout = B_INFINITE_TIMEOUT;
		bigtime_t replyTimeout = B_INFINITE_TIMEOUT;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: reply
		// item 3: deliveryTimeout
		if (items > 3) {
			deliveryTimeout = (bigtime_t)SvIV(ST(3));
		}
		// item 4: replyTimeout
		if (items > 4) {
			replyTimeout = (bigtime_t)SvIV(ST(4));
		}
		
		retval = THIS->SendMessage(message, reply, deliveryTimeout, replyTimeout);
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
BMessenger::IsValid()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsValid();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

team_id
BMessenger::Team()
	INIT:
		team_id retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Team();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessenger::operator_eq(object, swap)
	INPUT:
		BMessenger object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BMessenger::operator_ne(object, swap)
	INPUT:
		BMessenger object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__ApplicationKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Messenger::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Messenger::()", XS_Haiku__ApplicationKit_nil, file);

