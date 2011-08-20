#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::node_ref

PROTOTYPES: DISABLE

SV*
node_ref::new()
	INIT:
		node_ref* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new node_ref();
		
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
newFromNodeRef(CLASS, ref)
	INPUT:
		char* CLASS;
		node_ref ref;
	INIT:
		node_ref* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: ref
		
		retval = new node_ref(ref);
		
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
		node_ref* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for node_ref");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (node_ref*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

MODULE = Haiku::StorageKit	PACKAGE = Haiku::node_ref::device

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		node_ref* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (node_ref*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->device);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		node_ref* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (node_ref*)SvIV(cpp_obj_sv);
		cpp_obj->device = (dev_t)SvIV(value);

MODULE = Haiku::StorageKit	PACKAGE = Haiku::node_ref

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'node_ref::device'

SV*
device(THIS)
	INPUT:
		node_ref* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::node_ref::device", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::node_ref::device", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::StorageKit	PACKAGE = Haiku::node_ref::node

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		node_ref* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (node_ref*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->node);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		node_ref* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (node_ref*)SvIV(cpp_obj_sv);
		cpp_obj->node = (ino_t)SvIV(value);

MODULE = Haiku::StorageKit	PACKAGE = Haiku::node_ref

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'node_ref::node'

SV*
node(THIS)
	INPUT:
		node_ref* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::node_ref::node", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::node_ref::node", TRUE)) |= CVf_LVALUE;

bool
node_ref::operator_eq(object, swap)
	INPUT:
		node_ref object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
node_ref::operator_ne(object, swap)
	INPUT:
		node_ref object;
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
		get_sv("Haiku::node_ref::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::node_ref::()", XS_Haiku__StorageKit_nil, file);

