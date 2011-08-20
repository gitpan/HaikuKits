#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::ShapeIterator

PROTOTYPES: DISABLE

SV*
BShapeIterator::new()
	INIT:
		BShapeIterator* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BShapeIterator();
		
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
		BShapeIterator* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BShapeIterator");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BShapeIterator*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BShapeIterator::IterateMoveTo(point)
	INPUT:
		BPoint* point;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->IterateMoveTo(point);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BShapeIterator::IterateLineTo(linePts_sv)
	INPUT:
		SV* linePts_sv;
	INIT:
		int32 lineCount;
		BPoint* linePts;
		AV* linePts_sv_av;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// not an XS input: lineCount
		// item 1: linePts
		linePts = (BPoint*)malloc(lineCount * sizeof(BPoint));
		//Converting Perl arg 'linePts_sv' to C array 'linePts'
		linePts_sv_av = (AV*)SvRV(linePts_sv);
		lineCount = av_len(linePts_sv_av) + 1;
		for (int i = 0; i < lineCount; i++) {
			SV** element_sv = av_fetch(linePts_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			linePts[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		
		retval = THIS->IterateLineTo(lineCount, linePts);
		RETVAL = true;
		
		free((void*)linePts);
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BShapeIterator::IterateBezierTo(bezierPts_sv)
	INPUT:
		SV* bezierPts_sv;
	INIT:
		int32 bezierCount;
		BPoint* bezierPts;
		AV* bezierPts_sv_av;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// not an XS input: bezierCount
		// item 1: bezierPts
		bezierPts = (BPoint*)malloc(bezierCount * sizeof(BPoint));
		//Converting Perl arg 'bezierPts_sv' to C array 'bezierPts'
		bezierPts_sv_av = (AV*)SvRV(bezierPts_sv);
		bezierCount = av_len(bezierPts_sv_av) + 1;
		for (int i = 0; i < bezierCount; i++) {
			SV** element_sv = av_fetch(bezierPts_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			bezierPts[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		
		retval = THIS->IterateBezierTo(bezierCount, bezierPts);
		RETVAL = true;
		
		free((void*)bezierPts);
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BShapeIterator::IterateClose()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		
		retval = THIS->IterateClose();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BShapeIterator::IterateArcTo(rx, ry, angle, largeArc, counterClockWise, point)
	INPUT:
		float rx;
		float ry;
		float angle;
		bool largeArc;
		bool counterClockWise;
		BPoint point;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: rx
		// item 2: ry
		// item 3: angle
		// item 4: largeArc
		// item 5: counterClockWise
		// item 6: point
		
		retval = THIS->IterateArcTo(rx, ry, angle, largeArc, counterClockWise, point);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
BShapeIterator::operator_eq(object, swap)
	INPUT:
		BShapeIterator* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BShapeIterator::operator_ne(object, swap)
	INPUT:
		BShapeIterator* object;
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
		get_sv("Haiku::ShapeIterator::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::ShapeIterator::()", XS_Haiku__InterfaceKit_nil, file);

