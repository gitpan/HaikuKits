#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::Node

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
		BNode* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BNode();
		
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
newFromEntryRef(CLASS, ref)
	INPUT:
		char* CLASS;
		const entry_ref* ref;
	INIT:
		BNode* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: ref
		
		retval = new BNode(ref);
		
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
newFromEntry(CLASS, entry)
	INPUT:
		char* CLASS;
		BEntry* entry;
	INIT:
		BNode* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: entry
		
		retval = new BNode(entry);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BNode::new(path)
	INPUT:
		const char* path;
	INIT:
		BNode* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: path
		
		retval = new BNode(path);
		
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
newFromNode(CLASS, node)
	INPUT:
		char* CLASS;
		const BNode node;
	INIT:
		BNode* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: node
		
		retval = new BNode(node);
		
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
		BNode* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BNode");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BNode*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BNode::InitCheck()
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
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

SV*
BNode::GetStat()
	INIT:
		struct stat* stat;
		status_t retval;
		SV* error_sv;
		SV* stat_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetStat(stat);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		stat_sv = create_perl_object((void*)stat, "Haiku::stat", false);
		DUMPME(1,stat_sv);
		RETVAL = newSVsv(stat_sv);
		SvREFCNT_dec(stat_sv);
	OUTPUT:
		RETVAL

bool
BNode::SetToEntryRef(ref)
	INPUT:
		const entry_ref* ref;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: ref
		
		retval = THIS->SetTo(ref);
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
BNode::SetToEntry(entry)
	INPUT:
		const BEntry* entry;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: entry
		
		retval = THIS->SetTo(entry);
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
BNode::SetTo(path)
	INPUT:
		const char* path;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: path
		
		retval = THIS->SetTo(path);
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
BNode::Unset()
	CODE:
		// item 0: THIS
		
		THIS->Unset();

bool
BNode::Lock()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Lock();
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
BNode::Unlock()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Unlock();
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
BNode::Sync()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->Sync();
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

ssize_t
BNode::WriteAttr(name, type, offset, buffer_sv)
	INPUT:
		const char* name;
		type_code type;
		off_t offset;
		SV* buffer_sv;
	INIT:
		const void* buffer;
		STRLEN buffer_sv_length;
		size_t len;
		ssize_t retval;
	CODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// item 3: offset
		// item 4: buffer
		buffer = (const void*)SvPV(buffer_sv, buffer_sv_length);
		len = buffer_sv_length;
		// not an XS input: len
		
		retval = THIS->WriteAttr(name, type, offset, buffer, len);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BNode::ReadAttr(name, type, offset, len)
	INPUT:
		const char* name;
		type_code type;
		off_t offset;
		size_t len;
	INIT:
		void* buffer;
		ssize_t retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* buffer_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: name
		// item 2: type
		// item 3: offset
		// item 5: len
		buffer = (void*)malloc(len);
		
		retval = THIS->ReadAttr(name, type, offset, buffer, len);
		sv_setiv(retval_sv, (IV)retval);
		
		buffer_sv = newSVpvn((char*)buffer, (STRLEN)len);
		if (is_utf8_string((const U8*)buffer, (STRLEN)len)) {
			SvUTF8_on(buffer_sv);
		}
		free((void*)buffer);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(buffer_sv));

bool
BNode::RemoveAttr(name)
	INPUT:
		const char* name;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->RemoveAttr(name);
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
BNode::RenameAttr(oldname, newname)
	INPUT:
		const char* oldname;
		const char* newname;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: oldname
		// item 2: newname
		
		retval = THIS->RenameAttr(oldname, newname);
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
BNode::GetAttrInfo(name)
	INPUT:
		const char* name;
	INIT:
		attr_info* info = new attr_info();
		status_t retval;
		SV* error_sv;
		SV* info_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->GetAttrInfo(name, info);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		info_sv = create_perl_object((void*)info, "Haiku::attr_info", false);
		DUMPME(1,info_sv);
		RETVAL = newSVsv(info_sv);
		SvREFCNT_dec(info_sv);
	OUTPUT:
		RETVAL

SV*
BNode::GetNextAttrName()
	INIT:
		char* buffer;
		status_t retval;
		SV* error_sv;
		STRLEN buffer_sv_length;
		SV* buffer_sv = newSV(0);	// retcount == 1
		int LENGTH = 1; // length for return value
	CODE:
		// item 0: THIS
		buffer = (char*)malloc(B_ATTR_NAME_LENGTH);
		
		retval = THIS->GetNextAttrName(buffer);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		buffer_sv = newSVpv((char*)buffer, 0);	// 0 lets Perl calculate length
		
		buffer_sv_length = SvCUR(buffer_sv);
		if (buffer_sv_length > B_ATTR_NAME_LENGTH) {
			buffer_sv_length = B_ATTR_NAME_LENGTH;
			SvCUR_set(buffer_sv, buffer_sv_length);
		}
		
		if (is_utf8_string((const U8*)buffer, (STRLEN)buffer_sv_length)) {
			SvUTF8_on(buffer_sv);
		}
		free((void*)buffer);
		RETVAL = buffer_sv;
	OUTPUT:
		RETVAL

bool
BNode::RewindAttrs()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->RewindAttrs();
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

int
BNode::Dup()
	INIT:
		int retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Dup();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BNode::operator_eq(object, swap)
	INPUT:
		BNode object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BNode::operator_ne(object, swap)
	INPUT:
		BNode object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Node::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Node::()", XS_Haiku__StorageKit_nil, file);

