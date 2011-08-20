#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Message

PROTOTYPES: DISABLE

SV*
BMessage::new(command)
	INPUT:
		uint32 command;
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: command
		
		retval = new BMessage(command);
		
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
newCopy(CLASS, message)
	INPUT:
		char* CLASS;
		BMessage message;
	INIT:
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: message
		
		retval = new BMessage(message);
		
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
		BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BMessage();
		
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
		BMessage* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BMessage");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BMessage*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

void
BMessage::GetInfo(typeRequested, index)
	INPUT:
		type_code typeRequested;
		int32 index;
	INIT:
		char* nameFound;
		type_code typeFound;
		int32 countFound;
		status_t retval;
		SV* error_sv;
		SV* nameFound_sv = newSV(0);	// retcount > 1
		SV* typeFound_sv = newSV(0);	// retcount > 1
		SV* countFound_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: typeRequested
		// item 2: index
		
		retval = THIS->GetInfo(typeRequested, index, &nameFound, &typeFound, &countFound);
		sv_setpv((SV*)nameFound_sv, nameFound);
		sv_setiv(typeFound_sv, (IV)typeFound);
		sv_setiv(countFound_sv, (IV)countFound);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(nameFound_sv));
		PUSHs(sv_2mortal(typeFound_sv));
		PUSHs(sv_2mortal(countFound_sv));

void
BMessage::GetInfoByName(name)
	INPUT:
		const char* name;
	INIT:
		type_code typeFound;
		int32 countFound;
		bool fixedSize;
		status_t retval;
		SV* error_sv;
		SV* typeFound_sv = newSV(0);	// retcount > 1
		SV* countFound_sv = newSV(0);	// retcount > 1
		SV* fixedSize_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->GetInfo(name, &typeFound, &countFound, &fixedSize);
		sv_setiv(typeFound_sv, (IV)typeFound);
		sv_setiv(countFound_sv, (IV)countFound);
		fixedSize_sv = boolSV(fixedSize);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(typeFound_sv));
		PUSHs(sv_2mortal(countFound_sv));
		PUSHs(sv_2mortal(fixedSize_sv));

int32
BMessage::CountNames(type)
	INPUT:
		type_code type;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: type
		
		retval = THIS->CountNames(type);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessage::IsEmpty()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEmpty();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessage::IsSystem()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSystem();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessage::IsReply()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsReply();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BMessage::PrintToStream()
	CODE:
		// item 0: THIS
		
		THIS->PrintToStream();

void
BMessage::Rename(oldEntry, newEntry)
	INPUT:
		const char* oldEntry;
		const char* newEntry;
	CODE:
		// item 0: THIS
		// item 1: oldEntry
		// item 2: newEntry
		
		THIS->Rename(oldEntry, newEntry);

bool
BMessage::WasDelivered()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->WasDelivered();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessage::IsSourceRemote()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSourceRemote();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessage::IsSourceWaiting()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSourceWaiting();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMessage::ReturnAddress()
	INIT:
		BMessenger retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ReturnAddress();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Messenger", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::Previous()
	INIT:
		const BMessage* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Previous();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Message", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BMessage::WasDropped()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->WasDropped();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BMessage::DropPoint(...)
	INIT:
		BPoint* offset = NULL;
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: offset
		if (items > 1) {
			offset = (BPoint*)get_cpp_object(ST(1));
		}
		
		retval = THIS->DropPoint(offset);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BMessage::SendReply(reply, ...)
	INPUT:
		BMessage* reply;
	INIT:
		BHandler* replyTo = NULL;
		bigtime_t timeout = B_INFINITE_TIMEOUT;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: reply
		// item 2: replyTo
		if (items > 2) {
			replyTo = (BHandler*)get_cpp_object(ST(2));
		}
		// item 3: timeout
		if (items > 3) {
			timeout = (bigtime_t)SvIV(ST(3));
		}
		
		retval = THIS->SendReply(reply, replyTo, timeout);
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
BMessage::SendReplyCommand(command, ...)
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
		
		retval = THIS->SendReply(command, replyTo);
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
BMessage::SendReplyToMessenger(reply, replyTo, ...)
	INPUT:
		BMessage* reply;
		BMessenger replyTo;
	INIT:
		bigtime_t timeout = B_INFINITE_TIMEOUT;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: reply
		// item 2: replyTo
		// item 3: timeout
		if (items > 3) {
			timeout = (bigtime_t)SvIV(ST(3));
		}
		
		retval = THIS->SendReply(reply, replyTo, timeout);
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
BMessage::SendReplyWithReplyMessage(command, replyToReply)
	INPUT:
		uint32 command;
		BMessage* replyToReply;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: command
		// item 2: replyToReply
		
		retval = THIS->SendReply(command, replyToReply);
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
BMessage::SendReplyCommandWithReplyMessage(reply, replyToReply, ...)
	INPUT:
		BMessage* reply;
		BMessage* replyToReply;
	INIT:
		bigtime_t sendTimeout = B_INFINITE_TIMEOUT;
		bigtime_t replyTimeout = B_INFINITE_TIMEOUT;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: reply
		// item 2: replyToReply
		// item 3: sendTimeout
		if (items > 3) {
			sendTimeout = (bigtime_t)SvIV(ST(3));
		}
		// item 4: replyTimeout
		if (items > 4) {
			replyTimeout = (bigtime_t)SvIV(ST(4));
		}
		
		retval = THIS->SendReply(reply, replyToReply, sendTimeout, replyTimeout);
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

ssize_t
BMessage::FlattenedSize()
	INIT:
		ssize_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FlattenedSize();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

ssize_t
BMessage::Flatten(buffer)
	INPUT:
		char* buffer;
	INIT:
		ssize_t size = 0;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: buffer
		
		retval = THIS->Flatten(buffer, size);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = size;
	OUTPUT:
		RETVAL

bool
BMessage::Unflatten(buffer)
	INPUT:
		const char* buffer;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: buffer
		
		retval = THIS->Unflatten(buffer);
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
BMessage::AddSpecifier(message)
	INPUT:
		BMessage* message;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: message
		
		retval = THIS->AddSpecifier(message);
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
BMessage::AddDirectSpecifier(property)
	INPUT:
		const char* property;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: property
		
		retval = THIS->AddSpecifier(property);
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
BMessage::AddIndexSpecifier(property, index)
	INPUT:
		const char* property;
		int32 index;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: property
		// item 2: index
		
		retval = THIS->AddSpecifier(property, index);
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
BMessage::AddRangeSpecifier(property, index, range)
	INPUT:
		const char* property;
		int32 index;
		int32 range;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: property
		// item 2: index
		// item 3: range
		
		retval = THIS->AddSpecifier(property, index, range);
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
BMessage::AddNameSpecifier(property, name)
	INPUT:
		const char* property;
		const char* name;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: property
		// item 2: name
		
		retval = THIS->AddSpecifier(property, name);
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
BMessage::SetCurrentSpecifier(index)
	INPUT:
		int32 index;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->SetCurrentSpecifier(index);
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
BMessage::GetCurrentSpecifier()
	INIT:
		int32 index;
		BMessage* specifier;
		int32 what;
		const char* property;
		status_t retval;
		SV* error_sv;
		SV* index_sv = newSV(0);	// retcount > 1
		SV* specifier_sv = newSV(0);	// retcount > 1
		SV* what_sv = newSV(0);	// retcount > 1
		SV* property_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		retval = THIS->GetCurrentSpecifier(&index, specifier, &what, &property);
		sv_setiv(index_sv, (IV)index);
		sv_setiv(what_sv, (IV)what);
		sv_setpv((SV*)property_sv, property);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		specifier_sv = create_perl_object((void*)specifier, "Haiku::Message", false);
		DUMPME(1,specifier_sv);
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(index_sv));
		PUSHs(sv_2mortal(specifier_sv));
		PUSHs(sv_2mortal(what_sv));
		PUSHs(sv_2mortal(property_sv));

bool
BMessage::HasSpecifiers()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->HasSpecifiers();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BMessage::PopSpecifier()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->PopSpecifier();
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
BMessage::AddRect(name, rect)
	INPUT:
		const char* name;
		BRect rect;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: rect
		
		retval = THIS->AddRect(name, rect);
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
BMessage::AddPoint(name, point)
	INPUT:
		const char* name;
		BPoint point;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: point
		
		retval = THIS->AddPoint(name, point);
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
BMessage::AddString(name, string)
	INPUT:
		const char* name;
		const char* string;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: string
		
		retval = THIS->AddString(name, string);
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
BMessage::AddInt8(name, value)
	INPUT:
		const char* name;
		int8 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddInt8(name, value);
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
BMessage::AddUInt8(name, value)
	INPUT:
		const char* name;
		uint8 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddUInt8(name, value);
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
BMessage::AddInt16(name, value)
	INPUT:
		const char* name;
		int16 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddInt16(name, value);
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
BMessage::AddUInt16(name, value)
	INPUT:
		const char* name;
		uint16 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddUInt16(name, value);
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
BMessage::AddInt32(name, value)
	INPUT:
		const char* name;
		int32 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddInt32(name, value);
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
BMessage::AddUInt32(name, value)
	INPUT:
		const char* name;
		uint32 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddUInt32(name, value);
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
BMessage::AddInt64(name, value)
	INPUT:
		const char* name;
		int64 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddInt64(name, value);
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
BMessage::AddUInt64(name, value)
	INPUT:
		const char* name;
		uint64 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: value
		
		retval = THIS->AddUInt64(name, value);
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
BMessage::AddBool(name, aBoolean)
	INPUT:
		const char* name;
		bool aBoolean;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: aBoolean
		
		retval = THIS->AddBool(name, aBoolean);
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
BMessage::AddFloat(name, aFloat)
	INPUT:
		const char* name;
		float aFloat;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: aFloat
		
		retval = THIS->AddFloat(name, aFloat);
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
BMessage::AddDouble(name, aDouble)
	INPUT:
		const char* name;
		double aDouble;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: aDouble
		
		retval = THIS->AddDouble(name, aDouble);
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
BMessage::AddPointer(name, aPointer_sv)
	INPUT:
		const char* name;
		SV* aPointer_sv;
	INIT:
		const void* aPointer;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: aPointer
		aPointer = (const void*)SvPV_nolen(aPointer_sv);
		
		retval = THIS->AddPointer(name, aPointer);
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
BMessage::AddMessenger(name, messenger)
	INPUT:
		const char* name;
		BMessenger messenger;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: messenger
		
		retval = THIS->AddMessenger(name, messenger);
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
BMessage::AddRef(name, ref)
	INPUT:
		const char* name;
		entry_ref* ref;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: ref
		
		retval = THIS->AddRef(name, ref);
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
BMessage::AddMessage(name, message)
	INPUT:
		const char* name;
		BMessage* message;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: message
		
		retval = THIS->AddMessage(name, message);
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
BMessage::AddData(name, type, data_sv, ...)
	INPUT:
		const char* name;
		type_code type;
		SV* data_sv;
	INIT:
		const void* data;
		STRLEN data_sv_length;
		ssize_t numBytes;
		bool isFixedSize = true;
		int32 count = 1;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// item 3: data
		data = (const void*)SvPV(data_sv, data_sv_length);
		numBytes = data_sv_length;
		// not an XS input: numBytes
		// item 4: isFixedSize
		if (items > 4) {
			isFixedSize = SvTRUE(ST(4));
		}
		// item 5: count
		if (items > 5) {
			count = (int32)SvIV(ST(5));
		}
		
		retval = THIS->AddData(name, type, data, numBytes, isFixedSize, count);
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
BMessage::RemoveData(name, ...)
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
		
		retval = THIS->RemoveData(name, index);
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
BMessage::RemoveName(name)
	INPUT:
		const char* name;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->RemoveName(name);
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
BMessage::MakeEmpty()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->MakeEmpty();
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
BMessage::FindRect(name)
	INPUT:
		const char* name;
	INIT:
		BRect rect;
		status_t retval;
		SV* error_sv;
		SV* rect_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindRect(name, &rect);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		rect_sv = create_perl_object((void*)&rect, "Haiku::Rect", false);
		DUMPME(1,rect_sv);
		RETVAL = newSVsv(rect_sv);
		SvREFCNT_dec(rect_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindRectByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BRect rect;
		status_t retval;
		SV* error_sv;
		SV* rect_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindRect(name, index, &rect);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		rect_sv = create_perl_object((void*)&rect, "Haiku::Rect", false);
		DUMPME(1,rect_sv);
		RETVAL = newSVsv(rect_sv);
		SvREFCNT_dec(rect_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindPoint(name)
	INPUT:
		const char* name;
	INIT:
		BPoint point;
		status_t retval;
		SV* error_sv;
		SV* point_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindPoint(name, &point);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		point_sv = create_perl_object((void*)&point, "Haiku::Point", false);
		DUMPME(1,point_sv);
		RETVAL = newSVsv(point_sv);
		SvREFCNT_dec(point_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindPointByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BPoint point;
		status_t retval;
		SV* error_sv;
		SV* point_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindPoint(name, index, &point);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		point_sv = create_perl_object((void*)&point, "Haiku::Point", false);
		DUMPME(1,point_sv);
		RETVAL = newSVsv(point_sv);
		SvREFCNT_dec(point_sv);
	OUTPUT:
		RETVAL

const char*
BMessage::FindString(name)
	INPUT:
		const char* name;
	INIT:
		const char* string;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindString(name, &string);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = string;
	OUTPUT:
		RETVAL

const char*
BMessage::FindStringByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		const char* string;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindString(name, index, &string);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = string;
	OUTPUT:
		RETVAL

int8
BMessage::FindInt8(name)
	INPUT:
		const char* name;
	INIT:
		int8 value;
		status_t retval;
		SV* error_sv;
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindInt8(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int8
BMessage::FindInt8ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int8 value;
		status_t retval;
		SV* error_sv;
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindInt8(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint8
BMessage::FindUInt8(name)
	INPUT:
		const char* name;
	INIT:
		uint8 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindUInt8(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint8
BMessage::FindUInt8ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint8 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindUInt8(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int16
BMessage::FindInt16(name)
	INPUT:
		const char* name;
	INIT:
		int16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindInt16(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int16
BMessage::FindInt16ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindInt16(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint16
BMessage::FindUInt16(name)
	INPUT:
		const char* name;
	INIT:
		uint16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindUInt16(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint16
BMessage::FindUInt16ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindUInt16(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int32
BMessage::FindInt32(name)
	INPUT:
		const char* name;
	INIT:
		int32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindInt32(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int32
BMessage::FindInt32ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindInt32(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint32
BMessage::FindUInt32(name)
	INPUT:
		const char* name;
	INIT:
		uint32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindUInt32(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint32
BMessage::FindUInt32ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindUInt32(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int64
BMessage::FindInt64(name)
	INPUT:
		const char* name;
	INIT:
		int64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindInt64(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int64
BMessage::FindInt64ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindInt64(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint64
BMessage::FindUInt64(name)
	INPUT:
		const char* name;
	INIT:
		uint64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindUInt64(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint64
BMessage::FindUInt64ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindUInt64(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

bool
BMessage::FindBool(name)
	INPUT:
		const char* name;
	INIT:
		bool value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindBool(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

bool
BMessage::FindBoolByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		bool value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindBool(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

float
BMessage::FindFloat(name)
	INPUT:
		const char* name;
	INIT:
		float value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindFloat(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

float
BMessage::FindFloatByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		float value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindFloat(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

double
BMessage::FindDouble(name)
	INPUT:
		const char* name;
	INIT:
		double value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindDouble(name, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

double
BMessage::FindDoubleByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		double value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindDouble(name, index, &value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

SV*
BMessage::FindPointer(name)
	INPUT:
		const char* name;
	INIT:
		void** pointer;
		status_t retval;
		SV* error_sv;
		SV* pointer_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		pointer = (void**)malloc(sizeof(void*));
		
		retval = THIS->FindPointer(name, pointer);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		pointer_sv = newSVpvn((char*)pointer, (STRLEN)sizeof(void*));
		if (is_utf8_string((const U8*)pointer, (STRLEN)sizeof(void*))) {
			SvUTF8_on(pointer_sv);
		}
		free((void*)pointer);
		RETVAL = pointer_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::FindPointerByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		void** pointer;
		status_t retval;
		SV* error_sv;
		SV* pointer_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		pointer = (void**)malloc(sizeof(void*));
		
		retval = THIS->FindPointer(name, index, pointer);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		pointer_sv = newSVpvn((char*)pointer, (STRLEN)sizeof(void*));
		if (is_utf8_string((const U8*)pointer, (STRLEN)sizeof(void*))) {
			SvUTF8_on(pointer_sv);
		}
		free((void*)pointer);
		RETVAL = pointer_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::FindMessenger(name)
	INPUT:
		const char* name;
	INIT:
		BMessenger messenger;
		status_t retval;
		SV* error_sv;
		SV* messenger_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindMessenger(name, &messenger);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		messenger_sv = create_perl_object((void*)&messenger, "Haiku::Messenger", false);
		DUMPME(1,messenger_sv);
		RETVAL = newSVsv(messenger_sv);
		SvREFCNT_dec(messenger_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindMessengerByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BMessenger messenger;
		status_t retval;
		SV* error_sv;
		SV* messenger_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindMessenger(name, index, &messenger);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		messenger_sv = create_perl_object((void*)&messenger, "Haiku::Messenger", false);
		DUMPME(1,messenger_sv);
		RETVAL = newSVsv(messenger_sv);
		SvREFCNT_dec(messenger_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindRef(name)
	INPUT:
		const char* name;
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindRef(name, ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::entry_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindRefByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindRef(name, index, ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::entry_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindMessage(name)
	INPUT:
		const char* name;
	INIT:
		BMessage message;
		status_t retval;
		SV* error_sv;
		SV* message_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindMessage(name, &message);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		message_sv = create_perl_object((void*)&message, "Haiku::Message", false);
		DUMPME(1,message_sv);
		RETVAL = newSVsv(message_sv);
		SvREFCNT_dec(message_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindMessageByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BMessage message;
		status_t retval;
		SV* error_sv;
		SV* message_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->FindMessage(name, index, &message);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		message_sv = create_perl_object((void*)&message, "Haiku::Message", false);
		DUMPME(1,message_sv);
		RETVAL = newSVsv(message_sv);
		SvREFCNT_dec(message_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::FindData(name, type)
	INPUT:
		const char* name;
		type_code type;
	INIT:
		const void** data;
		ssize_t numBytes;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// not an XS input: numBytes
		data = (const void**)malloc(numBytes);
		
		retval = THIS->FindData(name, type, data, &numBytes);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = newSVpvn((char*)data, (STRLEN)numBytes);
		if (is_utf8_string((const U8*)data, (STRLEN)numBytes)) {
			SvUTF8_on(data_sv);
		}
		free((void*)data);
		RETVAL = data_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::FindDataByIndex(name, type, index)
	INPUT:
		const char* name;
		type_code type;
		int32 index;
	INIT:
		const void** data;
		ssize_t numBytes;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// item 3: index
		// not an XS input: numBytes
		data = (const void**)malloc(numBytes);
		
		retval = THIS->FindData(name, type, index, data, &numBytes);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = newSVpvn((char*)data, (STRLEN)numBytes);
		if (is_utf8_string((const U8*)data, (STRLEN)numBytes)) {
			SvUTF8_on(data_sv);
		}
		free((void*)data);
		RETVAL = data_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceRect(name)
	INPUT:
		const char* name;
	INIT:
		BRect rect;
		status_t retval;
		SV* error_sv;
		SV* rect_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceRect(name, rect);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		rect_sv = create_perl_object((void*)&rect, "Haiku::Rect", false);
		DUMPME(1,rect_sv);
		RETVAL = newSVsv(rect_sv);
		SvREFCNT_dec(rect_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceRectByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BRect rect;
		status_t retval;
		SV* error_sv;
		SV* rect_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceRect(name, index, rect);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		rect_sv = create_perl_object((void*)&rect, "Haiku::Rect", false);
		DUMPME(1,rect_sv);
		RETVAL = newSVsv(rect_sv);
		SvREFCNT_dec(rect_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplacePoint(name)
	INPUT:
		const char* name;
	INIT:
		BPoint point;
		status_t retval;
		SV* error_sv;
		SV* point_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplacePoint(name, point);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		point_sv = create_perl_object((void*)&point, "Haiku::Point", false);
		DUMPME(1,point_sv);
		RETVAL = newSVsv(point_sv);
		SvREFCNT_dec(point_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplacePointByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BPoint point;
		status_t retval;
		SV* error_sv;
		SV* point_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplacePoint(name, index, point);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		point_sv = create_perl_object((void*)&point, "Haiku::Point", false);
		DUMPME(1,point_sv);
		RETVAL = newSVsv(point_sv);
		SvREFCNT_dec(point_sv);
	OUTPUT:
		RETVAL

const char*
BMessage::ReplaceString(name)
	INPUT:
		const char* name;
	INIT:
		const char* string;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceString(name, string);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = string;
	OUTPUT:
		RETVAL

const char*
BMessage::ReplaceStringByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		const char* string;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceString(name, index, string);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = string;
	OUTPUT:
		RETVAL

int8
BMessage::ReplaceInt8(name)
	INPUT:
		const char* name;
	INIT:
		int8 value;
		status_t retval;
		SV* error_sv;
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceInt8(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int8
BMessage::ReplaceInt8ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int8 value;
		status_t retval;
		SV* error_sv;
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceInt8(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint8
BMessage::ReplaceUInt8(name)
	INPUT:
		const char* name;
	INIT:
		uint8 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceUInt8(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint8
BMessage::ReplaceUInt8ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint8 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceUInt8(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int16
BMessage::ReplaceInt16(name)
	INPUT:
		const char* name;
	INIT:
		int16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceInt16(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int16
BMessage::ReplaceInt16ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceInt16(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint16
BMessage::ReplaceUInt16(name)
	INPUT:
		const char* name;
	INIT:
		uint16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceUInt16(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint16
BMessage::ReplaceUInt16ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint16 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceUInt16(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int32
BMessage::ReplaceInt32(name)
	INPUT:
		const char* name;
	INIT:
		int32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceInt32(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int32
BMessage::ReplaceInt32ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceInt32(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint32
BMessage::ReplaceUInt32(name)
	INPUT:
		const char* name;
	INIT:
		uint32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceUInt32(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int32
BMessage::ReplaceUInt32ByIndex(name, index)
	INPUT:
		const char* name;
		uint32 index;
	INIT:
		int32 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceUInt32(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int64
BMessage::ReplaceInt64(name)
	INPUT:
		const char* name;
	INIT:
		int64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceInt64(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

int64
BMessage::ReplaceInt64ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		int64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceInt64(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint64
BMessage::ReplaceUInt64(name)
	INPUT:
		const char* name;
	INIT:
		uint64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceUInt64(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

uint64
BMessage::ReplaceUInt64ByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		uint64 value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceUInt64(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

bool
BMessage::ReplaceBool(name)
	INPUT:
		const char* name;
	INIT:
		bool value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceBool(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

bool
BMessage::ReplaceBoolByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		bool value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceBool(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

float
BMessage::ReplaceFloat(name)
	INPUT:
		const char* name;
	INIT:
		float value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceFloat(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

float
BMessage::ReplaceFloatByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		float value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceFloat(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

double
BMessage::ReplaceDouble(name)
	INPUT:
		const char* name;
	INIT:
		double value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceDouble(name, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

double
BMessage::ReplaceDoubleByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		double value;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceDouble(name, index, value);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = value;
	OUTPUT:
		RETVAL

SV*
BMessage::ReplacePointer(name)
	INPUT:
		const char* name;
	INIT:
		const void* pointer;
		status_t retval;
		SV* error_sv;
		SV* pointer_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplacePointer(name, pointer);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		pointer_sv = newSVpvn((char*)pointer, (STRLEN)sizeof(void*));
		if (is_utf8_string((const U8*)pointer, (STRLEN)sizeof(void*))) {
			SvUTF8_on(pointer_sv);
		}
		RETVAL = pointer_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::ReplacePointerByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		const void* pointer;
		status_t retval;
		SV* error_sv;
		SV* pointer_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplacePointer(name, index, pointer);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		pointer_sv = newSVpvn((char*)pointer, (STRLEN)sizeof(void*));
		if (is_utf8_string((const U8*)pointer, (STRLEN)sizeof(void*))) {
			SvUTF8_on(pointer_sv);
		}
		RETVAL = pointer_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceMessenger(name)
	INPUT:
		const char* name;
	INIT:
		BMessenger messenger;
		status_t retval;
		SV* error_sv;
		SV* messenger_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceMessenger(name, messenger);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		messenger_sv = create_perl_object((void*)&messenger, "Haiku::Messenger", false);
		DUMPME(1,messenger_sv);
		RETVAL = newSVsv(messenger_sv);
		SvREFCNT_dec(messenger_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceMessengerByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BMessenger messenger;
		status_t retval;
		SV* error_sv;
		SV* messenger_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceMessenger(name, index, messenger);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		messenger_sv = create_perl_object((void*)&messenger, "Haiku::Messenger", false);
		DUMPME(1,messenger_sv);
		RETVAL = newSVsv(messenger_sv);
		SvREFCNT_dec(messenger_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceRef(name)
	INPUT:
		const char* name;
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceRef(name, ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::entry_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceRefByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		entry_ref* ref;
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceRef(name, index, ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::entry_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceMessage(name)
	INPUT:
		const char* name;
	INIT:
		BMessage* message;
		status_t retval;
		SV* error_sv;
		SV* message_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->ReplaceMessage(name, message);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		message_sv = create_perl_object((void*)message, "Haiku::Message", false);
		DUMPME(1,message_sv);
		RETVAL = newSVsv(message_sv);
		SvREFCNT_dec(message_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceMessageByIndex(name, index)
	INPUT:
		const char* name;
		int32 index;
	INIT:
		BMessage* message;
		status_t retval;
		SV* error_sv;
		SV* message_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: index
		
		retval = THIS->ReplaceMessage(name, index, message);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		message_sv = create_perl_object((void*)message, "Haiku::Message", false);
		DUMPME(1,message_sv);
		RETVAL = newSVsv(message_sv);
		SvREFCNT_dec(message_sv);
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceData(name, type)
	INPUT:
		const char* name;
		type_code type;
	INIT:
		const void* data;
		ssize_t numBytes;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// not an XS input: numBytes
		
		retval = THIS->ReplaceData(name, type, data, numBytes);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = newSVpvn((char*)data, (STRLEN)numBytes);
		if (is_utf8_string((const U8*)data, (STRLEN)numBytes)) {
			SvUTF8_on(data_sv);
		}
		RETVAL = data_sv;
	OUTPUT:
		RETVAL

SV*
BMessage::ReplaceDataByIndex(name, type, index)
	INPUT:
		const char* name;
		type_code type;
		int32 index;
	INIT:
		const void* data;
		ssize_t numBytes;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// item 3: index
		// not an XS input: numBytes
		
		retval = THIS->ReplaceData(name, type, index, data, numBytes);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::ApplicationKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = newSVpvn((char*)data, (STRLEN)numBytes);
		if (is_utf8_string((const U8*)data, (STRLEN)numBytes)) {
			SvUTF8_on(data_sv);
		}
		RETVAL = data_sv;
	OUTPUT:
		RETVAL

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Message::what

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BMessage* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BMessage*)SvIV(cpp_obj_sv);
		sv_setuv(RETVAL, (UV)cpp_obj->what);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BMessage* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BMessage*)SvIV(cpp_obj_sv);
		cpp_obj->what = (uint32)SvUV(value);

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Message

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BMessage::what'

SV*
what(THIS)
	INPUT:
		BMessage* THIS;
	INIT:
		SV* cpp_obj_sv;
		SV* tie_obj;
		HV* tie_obj_stash;
	CODE:
		RETVAL = newSV(0);
		// make our object into an SV* and make a reference to it
		cpp_obj_sv = newSViv((IV)THIS);	// do I need to make this mortal?
		tie_obj = newRV_noinc(cpp_obj_sv);
		
		// bless the reference into the proper class
		tie_obj_stash = gv_stashpv("Haiku::Message::what", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Message::what", TRUE)) |= CVf_LVALUE;

SV*
B_FIELD_NAME_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FIELD_NAME_LENGTH);
		dualize(RETVAL, "B_FIELD_NAME_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_PROPERTY_NAME_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PROPERTY_NAME_LENGTH);
		dualize(RETVAL, "B_PROPERTY_NAME_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_NO_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_SPECIFIER);
		dualize(RETVAL, "B_NO_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_DIRECT_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DIRECT_SPECIFIER);
		dualize(RETVAL, "B_DIRECT_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_INDEX_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_INDEX_SPECIFIER);
		dualize(RETVAL, "B_INDEX_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_REVERSE_INDEX_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_REVERSE_INDEX_SPECIFIER);
		dualize(RETVAL, "B_REVERSE_INDEX_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_RANGE_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RANGE_SPECIFIER);
		dualize(RETVAL, "B_RANGE_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_REVERSE_RANGE_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_REVERSE_RANGE_SPECIFIER);
		dualize(RETVAL, "B_REVERSE_RANGE_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_NAME_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NAME_SPECIFIER);
		dualize(RETVAL, "B_NAME_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_ID_SPECIFIER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ID_SPECIFIER);
		dualize(RETVAL, "B_ID_SPECIFIER");
	OUTPUT:
		RETVAL

SV*
B_SPECIFIERS_END()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SPECIFIERS_END);
		dualize(RETVAL, "B_SPECIFIERS_END");
	OUTPUT:
		RETVAL

bool
BMessage::operator_eq(object, swap)
	INPUT:
		BMessage* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BMessage::operator_ne(object, swap)
	INPUT:
		BMessage* object;
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
		get_sv("Haiku::Message::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Message::()", XS_Haiku__ApplicationKit_nil, file);

