#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Polygon

PROTOTYPES: DISABLE

SV*
BPolygon::new(points_sv)
	INPUT:
		SV* points_sv;
	INIT:
		BPoint* points;
		AV* points_sv_av;
		int32 count;
		BPolygon* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: points
		points = (BPoint*)malloc(count * sizeof(BPoint));
		//Converting Perl arg 'points_sv' to C array 'points'
		points_sv_av = (AV*)SvRV(points_sv);
		count = av_len(points_sv_av) + 1;
		for (int i = 0; i < count; i++) {
			SV** element_sv = av_fetch(points_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			points[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: count
		
		retval = new BPolygon(points, count);
		
		free((void*)points);
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
newFromPolygon(CLASS, other)
	INPUT:
		char* CLASS;
		BPolygon other;
	INIT:
		BPolygon* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: other
		
		retval = new BPolygon(other);
		
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
		BPolygon* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BPolygon");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BPolygon*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BPolygon::Frame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Frame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BPolygon::AddPoints(points_sv)
	INPUT:
		SV* points_sv;
	INIT:
		BPoint* points;
		AV* points_sv_av;
		int32 count;
	CODE:
		// item 0: THIS
		// item 1: points
		points = (BPoint*)malloc(count * sizeof(BPoint));
		//Converting Perl arg 'points_sv' to C array 'points'
		points_sv_av = (AV*)SvRV(points_sv);
		count = av_len(points_sv_av) + 1;
		for (int i = 0; i < count; i++) {
			SV** element_sv = av_fetch(points_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			points[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: count
		
		THIS->AddPoints(points, count);
		
		free((void*)points);

int32
BPolygon::CountPoints()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountPoints();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BPolygon::MapTo(srcRect, dstRect)
	INPUT:
		BRect srcRect;
		BRect dstRect;
	CODE:
		// item 0: THIS
		// item 1: srcRect
		// item 2: dstRect
		
		THIS->MapTo(srcRect, dstRect);

void
BPolygon::PrintToStream()
	CODE:
		// item 0: THIS
		
		THIS->PrintToStream();

bool
BPolygon::operator_eq(object, swap)
	INPUT:
		BPolygon* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BPolygon::operator_ne(object, swap)
	INPUT:
		BPolygon* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Polygon::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Polygon::()", XS_Haiku__InterfaceKit_nil, file);

