#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Query

PROTOTYPES: DISABLE

SV*
BQuery::new()
	INIT:
		BQuery* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BQuery();
		
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
		BQuery* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BQuery");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BQuery*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BQuery::Clear()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Clear();
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

bool
BQuery::PushAttr(attrName)
	INPUT:
		const char* attrName;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: attrName
		
		retval = THIS->PushAttr(attrName);
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

bool
BQuery::PushOp(op)
	INPUT:
		query_op op;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: op
		
		retval = THIS->PushOp(op);
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

bool
BQuery::PushUInt32(value)
	INPUT:
		uint32 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		
		retval = THIS->PushUInt32(value);
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

bool
BQuery::PushInt32(value)
	INPUT:
		int32 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		
		retval = THIS->PushInt32(value);
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

bool
BQuery::PushUInt64(value)
	INPUT:
		uint64 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		
		retval = THIS->PushUInt64(value);
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

bool
BQuery::PushInt64(value)
	INPUT:
		int64 value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		
		retval = THIS->PushInt64(value);
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

bool
BQuery::PushFloat(value)
	INPUT:
		float value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		
		retval = THIS->PushFloat(value);
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

bool
BQuery::PushDouble(value)
	INPUT:
		double value;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		
		retval = THIS->PushDouble(value);
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

bool
BQuery::PushString(value, ...)
	INPUT:
		const char* value;
	INIT:
		bool caseInsensitive = false;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: value
		// item 2: caseInsensitive
		if (items > 2) {
			caseInsensitive = SvTRUE(ST(2));
		}
		
		retval = THIS->PushString(value, caseInsensitive);
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

bool
BQuery::PushDate(date)
	INPUT:
		const char* date;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: date
		
		retval = THIS->PushDate(date);
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

bool
BQuery::SetVolume(volume)
	INPUT:
		const BVolume* volume;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: volume
		
		retval = THIS->SetVolume(volume);
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

bool
BQuery::SetPredicate(expression)
	INPUT:
		const char* expression;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: expression
		
		retval = THIS->SetPredicate(expression);
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

bool
BQuery::SetTarget(messenger)
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
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BQuery::IsLive()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsLive();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BQuery::GetPredicate(...)
	INIT:
		char* buffer;
		size_t length = THIS->PredicateLength();
		status_t retval;
		SV* error_sv;
		SV* buffer_sv = newSV(0);	// retcount == 1
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		// item 2: length
		if (items > 2) {
			length = (size_t)SvIV(ST(2));
		}
		buffer = (char*)malloc(THIS->PredicateLength());
		
		retval = THIS->GetPredicate(buffer, length);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		buffer_sv = newSVpvn((char*)buffer, (STRLEN)THIS->PredicateLength());
		if (is_utf8_string((const U8*)buffer, (STRLEN)THIS->PredicateLength())) {
			SvUTF8_on(buffer_sv);
		}
		free((void*)buffer);
		RETVAL = buffer_sv;
	OUTPUT:
		RETVAL

size_t
BQuery::PredicateLength()
	INIT:
		size_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->PredicateLength();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

dev_t
BQuery::TargetDevice()
	INIT:
		dev_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TargetDevice();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BQuery::Fetch()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Fetch();
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
BQuery::GetNextEntry(...)
	INIT:
		BEntry* entry = new BEntry();
		bool traverse = false;
		status_t retval;
		SV* error_sv;
		SV* entry_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 2: traverse
		if (items > 2) {
			traverse = SvTRUE(ST(2));
		}
		
		retval = THIS->GetNextEntry(entry, traverse);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		entry_sv = create_perl_object((void*)entry, "Haiku::Entry", false);
		DUMPME(1,entry_sv);
		RETVAL = newSVsv(entry_sv);
		SvREFCNT_dec(entry_sv);
	OUTPUT:
		RETVAL

SV*
BQuery::GetNextRef()
	INIT:
		entry_ref* ref = new entry_ref();
		status_t retval;
		SV* error_sv;
		SV* ref_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetNextRef(ref);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		ref_sv = create_perl_object((void*)ref, "Haiku::entry_ref", false);
		DUMPME(1,ref_sv);
		RETVAL = newSVsv(ref_sv);
		SvREFCNT_dec(ref_sv);
	OUTPUT:
		RETVAL

void
BQuery::GetNextDirents(length, ...)
	INPUT:
		size_t length;
	INIT:
		dirent* buffer;
		int32 count = INT_MAX;
		int32 retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* buffer_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 2: length
		// item 3: count
		if (items > 3) {
			count = (int32)SvIV(ST(3));
		}
		
		retval = THIS->GetNextDirents(buffer, length, count);
		sv_setiv(retval_sv, (IV)retval);
		
		buffer_sv = create_perl_object((void*)buffer, "Haiku::dirent", false);
		DUMPME(1,buffer_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(buffer_sv));

bool
BQuery::Rewind()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Rewind();
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

int32
BQuery::CountEntries()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountEntries();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
B_INVALID_OP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_INVALID_OP);
		dualize(RETVAL, "B_INVALID_OP");
	OUTPUT:
		RETVAL

SV*
B_EQ()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_EQ);
		dualize(RETVAL, "B_EQ");
	OUTPUT:
		RETVAL

SV*
B_GT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_GT);
		dualize(RETVAL, "B_GT");
	OUTPUT:
		RETVAL

SV*
B_GE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_GE);
		dualize(RETVAL, "B_GE");
	OUTPUT:
		RETVAL

SV*
B_LT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LT);
		dualize(RETVAL, "B_LT");
	OUTPUT:
		RETVAL

SV*
B_LE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LE);
		dualize(RETVAL, "B_LE");
	OUTPUT:
		RETVAL

SV*
B_NE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NE);
		dualize(RETVAL, "B_NE");
	OUTPUT:
		RETVAL

SV*
B_CONTAINS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTAINS);
		dualize(RETVAL, "B_CONTAINS");
	OUTPUT:
		RETVAL

SV*
B_BEGINS_WITH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BEGINS_WITH);
		dualize(RETVAL, "B_BEGINS_WITH");
	OUTPUT:
		RETVAL

SV*
B_ENDS_WITH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ENDS_WITH);
		dualize(RETVAL, "B_ENDS_WITH");
	OUTPUT:
		RETVAL

SV*
B_AND()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_AND);
		dualize(RETVAL, "B_AND");
	OUTPUT:
		RETVAL

SV*
B_OR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OR);
		dualize(RETVAL, "B_OR");
	OUTPUT:
		RETVAL

SV*
B_NOT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT);
		dualize(RETVAL, "B_NOT");
	OUTPUT:
		RETVAL

bool
BQuery::operator_eq(object, swap)
	INPUT:
		BQuery* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BQuery::operator_ne(object, swap)
	INPUT:
		BQuery* object;
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
		get_sv("Haiku::Query::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Query::()", XS_Haiku__StorageKit_nil, file);

