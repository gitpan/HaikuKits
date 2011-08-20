#
# Automatically generated file
#

MODULE = Haiku::ApplicationKit	PACKAGE = Haiku::Cursor

PROTOTYPES: DISABLE

SV*
BCursor::new(cursorData_sv)
	INPUT:
		SV* cursorData_sv;
	INIT:
		void* cursorData;
		BCursor* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: cursorData
		cursorData = (void*)SvPV_nolen(cursorData_sv);
		
		retval = new BCursor(cursorData);
		
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
newFromCursor(CLASS, ...)
	INPUT:
		char* CLASS;
	INIT:
		BCursor other = *B_CURSOR_SYSTEM_DEFAULT;
		BCursor* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: other
		if (items > 1) {
			other = *(BCursor*)get_cpp_object(ST(1));
		}
		
		retval = new BCursor(other);
		
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
newFromID(CLASS, id)
	INPUT:
		char* CLASS;
		BCursorID id;
	INIT:
		BCursor* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: id
		
		retval = new BCursor(id);
		
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
newFromMessage(CLASS, data)
	INPUT:
		char* CLASS;
		BMessage* data;
	INIT:
		BCursor* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: data
		
		retval = new BCursor(data);
		
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
		BCursor* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BCursor");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BCursor*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BCursor::Instantiate(data)
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
BCursor::Archive(...)
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
BCursor::operator_eq(object, swap)
	INPUT:
		BCursor object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BCursor::operator_ne(object, swap)
	INPUT:
		BCursor object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_SYSTEM_DEFAULT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_SYSTEM_DEFAULT);
		dualize(RETVAL, "B_CURSOR_ID_SYSTEM_DEFAULT");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_CONTEXT_MENU()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_CONTEXT_MENU);
		dualize(RETVAL, "B_CURSOR_ID_CONTEXT_MENU");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_COPY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_COPY);
		dualize(RETVAL, "B_CURSOR_ID_COPY");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_CREATE_LINK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_CREATE_LINK);
		dualize(RETVAL, "B_CURSOR_ID_CREATE_LINK");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_CROSS_HAIR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_CROSS_HAIR);
		dualize(RETVAL, "B_CURSOR_ID_CROSS_HAIR");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_FOLLOW_LINK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_FOLLOW_LINK);
		dualize(RETVAL, "B_CURSOR_ID_FOLLOW_LINK");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_GRAB()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_GRAB);
		dualize(RETVAL, "B_CURSOR_ID_GRAB");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_GRABBING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_GRABBING);
		dualize(RETVAL, "B_CURSOR_ID_GRABBING");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_HELP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_HELP);
		dualize(RETVAL, "B_CURSOR_ID_HELP");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_I_BEAM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_I_BEAM);
		dualize(RETVAL, "B_CURSOR_ID_I_BEAM");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_I_BEAM_HORIZONTAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_I_BEAM_HORIZONTAL);
		dualize(RETVAL, "B_CURSOR_ID_I_BEAM_HORIZONTAL");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_MOVE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_MOVE);
		dualize(RETVAL, "B_CURSOR_ID_MOVE");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_NO_CURSOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_NO_CURSOR);
		dualize(RETVAL, "B_CURSOR_ID_NO_CURSOR");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_NOT_ALLOWED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_NOT_ALLOWED);
		dualize(RETVAL, "B_CURSOR_ID_NOT_ALLOWED");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_PROGRESS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_PROGRESS);
		dualize(RETVAL, "B_CURSOR_ID_PROGRESS");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_NORTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_NORTH);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_NORTH");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_EAST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_EAST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_EAST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_SOUTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_SOUTH);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_SOUTH");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_WEST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_WEST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_WEST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_NORTH_EAST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_NORTH_EAST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_NORTH_EAST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_NORTH_WEST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_NORTH_WEST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_NORTH_WEST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_SOUTH_EAST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_SOUTH_EAST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_SOUTH_EAST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_SOUTH_WEST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_SOUTH_WEST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_SOUTH_WEST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_NORTH_SOUTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_NORTH_SOUTH);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_NORTH_SOUTH");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_EAST_WEST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_EAST_WEST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_EAST_WEST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_NORTH_EAST_SOUTH_WEST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_NORTH_EAST_SOUTH_WEST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_NORTH_EAST_SOUTH_WEST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_RESIZE_NORTH_WEST_SOUTH_EAST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_RESIZE_NORTH_WEST_SOUTH_EAST);
		dualize(RETVAL, "B_CURSOR_ID_RESIZE_NORTH_WEST_SOUTH_EAST");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_ZOOM_IN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_ZOOM_IN);
		dualize(RETVAL, "B_CURSOR_ID_ZOOM_IN");
	OUTPUT:
		RETVAL

SV*
B_CURSOR_ID_ZOOM_OUT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURSOR_ID_ZOOM_OUT);
		dualize(RETVAL, "B_CURSOR_ID_ZOOM_OUT");
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__ApplicationKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Cursor::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Cursor::()", XS_Haiku__ApplicationKit_nil, file);

