#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::unicode_block

PROTOTYPES: DISABLE

SV*
unicode_block::new(block2, block1)
	INPUT:
		uint64 block2;
		uint64 block1;
	INIT:
		unicode_block* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: block2
		// item 2: block1
		
		retval = new unicode_block(block2, block1);
		
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
		unicode_block* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new unicode_block();
		
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
		unicode_block* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for unicode_block");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (unicode_block*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
unicode_block::Includes(block)
	INPUT:
		unicode_block block;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: block
		
		retval = THIS->Includes(block);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
unicode_block::operator_eq(object, swap)
	INPUT:
		unicode_block object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
unicode_block::operator_ne(object, swap)
	INPUT:
		unicode_block object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

SV*
unicode_block::operator_and(object, swap)
	INPUT:
		unicode_block object;
		IV swap;
	OVERLOAD: &
	CODE:
		unicode_block* result;
		*result = *THIS & object;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::unicode_block"));
	OUTPUT:
		RETVAL

SV*
unicode_block::operator_or(object, swap)
	INPUT:
		unicode_block object;
		IV swap;
	OVERLOAD: |
	CODE:
		unicode_block* result;
		*result = *THIS | object;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::unicode_block"));
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::unicode_block::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::unicode_block::()", XS_Haiku__InterfaceKit_nil, file);

