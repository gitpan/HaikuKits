#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect

PROTOTYPES: DISABLE

SV*
BRect::new(left, top, right, bottom)
	INPUT:
		float left;
		float top;
		float right;
		float bottom;
	INIT:
		BRect* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: left
		// item 2: top
		// item 3: right
		// item 4: bottom
		
		retval = new BRect(left, top, right, bottom);
		
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
newFromRect(CLASS, rect)
	INPUT:
		char* CLASS;
		BRect rect;
	INIT:
		BRect* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: rect
		
		retval = new BRect(rect);
		
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
newFromPoints(CLASS, leftTop, rightBottom)
	INPUT:
		char* CLASS;
		BPoint leftTop;
		BPoint rightBottom;
	INIT:
		BRect* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: leftTop
		// item 2: rightBottom
		
		retval = new BRect(leftTop, rightBottom);
		
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
newFromSide(CLASS, side)
	INPUT:
		char* CLASS;
		float side;
	INIT:
		BRect* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: side
		
		retval = new BRect(side);
		
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
		BRect* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BRect();
		
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
		BRect* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BRect");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BRect*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

void
BRect::Set(left, top, right, bottom)
	INPUT:
		float left;
		float top;
		float right;
		float bottom;
	CODE:
		// item 0: THIS
		// item 1: left
		// item 2: top
		// item 3: right
		// item 4: bottom
		
		THIS->Set(left, top, right, bottom);

void
BRect::PrintToStream()
	CODE:
		// item 0: THIS
		
		THIS->PrintToStream();

SV*
BRect::LeftTop()
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->LeftTop();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::RightBottom()
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->RightBottom();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::LeftBottom()
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->LeftBottom();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::RightTop()
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->RightTop();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BRect::SetLeftTop(leftTop)
	INPUT:
		BPoint leftTop;
	CODE:
		// item 0: THIS
		// item 1: leftTop
		
		THIS->SetLeftTop(leftTop);

void
BRect::SetRightBottom(rightBottom)
	INPUT:
		BPoint rightBottom;
	CODE:
		// item 0: THIS
		// item 1: rightBottom
		
		THIS->SetRightBottom(rightBottom);

void
BRect::SetLeftBottom(leftBottom)
	INPUT:
		BPoint leftBottom;
	CODE:
		// item 0: THIS
		// item 1: leftBottom
		
		THIS->SetLeftBottom(leftBottom);

void
BRect::SetRightTop(rightTop)
	INPUT:
		BPoint rightTop;
	CODE:
		// item 0: THIS
		// item 1: rightTop
		
		THIS->SetRightTop(rightTop);

void
BRect::InsetByPoint(inset)
	INPUT:
		BPoint inset;
	CODE:
		// item 0: THIS
		// item 1: inset
		
		THIS->InsetBy(inset);

void
BRect::InsetBy(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->InsetBy(x, y);

void
BRect::OffsetByPoint(delta)
	INPUT:
		BPoint delta;
	CODE:
		// item 0: THIS
		// item 1: delta
		
		THIS->OffsetBy(delta);

void
BRect::OffsetBy(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->OffsetBy(x, y);

void
BRect::OffsetToPoint(offset)
	INPUT:
		BPoint offset;
	CODE:
		// item 0: THIS
		// item 1: offset
		
		THIS->OffsetTo(offset);

void
BRect::OffsetTo(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->OffsetTo(x, y);

SV*
BRect::InsetByPointSelf(inset)
	INPUT:
		BPoint inset;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: inset
		
		retval = THIS->InsetBySelf(inset);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::InsetBySelf(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		retval = THIS->InsetBySelf(x, y);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetByPointSelf(delta)
	INPUT:
		BPoint delta;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: delta
		
		retval = THIS->OffsetBySelf(delta);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetBySelf(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		retval = THIS->OffsetBySelf(x, y);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetToPointSelf(offset)
	INPUT:
		BPoint offset;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: offset
		
		retval = THIS->OffsetToSelf(offset);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetToSelf(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		retval = THIS->OffsetToSelf(x, y);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::InsetByPointCopy(inset)
	INPUT:
		BPoint inset;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: inset
		
		retval = THIS->InsetByCopy(inset);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::InsetByCopy(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		retval = THIS->InsetByCopy(x, y);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetByPointCopy(delta)
	INPUT:
		BPoint delta;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: delta
		
		retval = THIS->OffsetByCopy(delta);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetByCopy(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		retval = THIS->OffsetByCopy(x, y);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetToPointCopy(offset)
	INPUT:
		BPoint offset;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: offset
		
		retval = THIS->OffsetToCopy(offset);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BRect::OffsetToCopy(x, y)
	INPUT:
		float x;
		float y;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		retval = THIS->OffsetToCopy(x, y);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BRect::IsValid()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsValid();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BRect::Width()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Width();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BRect::IntegerWidth()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IntegerWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BRect::Height()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Height();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BRect::IntegerHeight()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IntegerHeight();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BRect::Intersects(rect)
	INPUT:
		BRect rect;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		retval = THIS->Intersects(rect);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BRect::Contains(rect)
	INPUT:
		BPoint rect;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		retval = THIS->Contains(rect);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BRect::ContainsRect(rect)
	INPUT:
		BRect rect;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		retval = THIS->Contains(rect);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect::left

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->left);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		cpp_obj->left = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BRect::left'

SV*
left(THIS)
	INPUT:
		BRect* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::Rect::left", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Rect::left", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect::top

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->top);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		cpp_obj->top = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BRect::top'

SV*
top(THIS)
	INPUT:
		BRect* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::Rect::top", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Rect::top", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect::right

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->right);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		cpp_obj->right = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BRect::right'

SV*
right(THIS)
	INPUT:
		BRect* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::Rect::right", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Rect::right", TRUE)) |= CVf_LVALUE;

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect::bottom

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		sv_setnv(RETVAL, (double)cpp_obj->bottom);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		BRect* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (BRect*)SvIV(cpp_obj_sv);
		cpp_obj->bottom = (float)SvNV(value);

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Rect

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'BRect::bottom'

SV*
bottom(THIS)
	INPUT:
		BRect* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::Rect::bottom", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::Rect::bottom", TRUE)) |= CVf_LVALUE;

bool
BRect::operator_eq(object, swap)
	INPUT:
		BRect object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BRect::operator_ne(object, swap)
	INPUT:
		BRect object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

SV*
BRect::operator_and(object, swap)
	INPUT:
		BRect object;
		IV swap;
	OVERLOAD: &
	CODE:
		BRect* result;
		*result = *THIS & object;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::Rect"));
	OUTPUT:
		RETVAL

SV*
BRect::operator_or(object, swap)
	INPUT:
		BRect object;
		IV swap;
	OVERLOAD: |
	CODE:
		BRect* result;
		*result = *THIS | object;
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)result, "Haiku::Rect"));
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Rect::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Rect::()", XS_Haiku__InterfaceKit_nil, file);

