#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::View

PROTOTYPES: DISABLE

SV*
BView::new(frame, name, resizingMode, flags)
	INPUT:
		BRect frame;
		const char* name;
		uint32 resizingMode;
		uint32 flags;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: resizingMode
		// item 4: flags
		
		retval = new BView(frame, name, resizingMode, flags);
		
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
newFromArchive(CLASS, archive)
	INPUT:
		char* CLASS;
		BMessage* archive;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BView(archive);
		
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
		BView* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BView");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BView*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BView::Instantiate(data)
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
BView::Archive(...)
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
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
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
BView::AllUnarchived(archive)
	INPUT:
		BMessage* archive;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->AllUnarchived(archive);
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
BView::AllArchived(archive)
	INPUT:
		BMessage* archive;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->AllArchived(archive);
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

void
BView::AddChild(view, ...)
	INPUT:
		BView* view;
	INIT:
		BView* sibling = NULL;
	CODE:
		// item 0: THIS
		// item 1: view
		must_not_delete_cpp_object(ST(1), true);
		// item 2: sibling
		if (items > 2) {
			sibling = (BView*)get_cpp_object(ST(2));
		}
		
		THIS->AddChild(view, sibling);

bool
BView::RemoveChild(view)
	INPUT:
		BView* view;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: view
		
		retval = THIS->RemoveChild(view);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BView::CountChildren()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountChildren();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BView::ChildAt(index)
	INPUT:
		int32 index;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ChildAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::NextSibling()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->NextSibling();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::PreviousSibling()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->PreviousSibling();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BView::RemoveSelf()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->RemoveSelf();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BView::Window()
	INIT:
		BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Window();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Window", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::BeginRectTracking(rect, ...)
	INPUT:
		BRect rect;
	INIT:
		uint32 how = B_TRACK_WHOLE_RECT;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: how
		if (items > 2) {
			how = (uint32)SvUV(ST(2));
		}
		
		THIS->BeginRectTracking(rect, how);

void
BView::EndRectTracking()
	CODE:
		// item 0: THIS
		
		THIS->EndRectTracking();

void
BView::GetMouse(...)
	INIT:
		BPoint location;
		uint32 buttons;
		bool checkMessageQueue = true;
		SV* location_sv = newSV(0);	// retcount > 1
		SV* buttons_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 3: checkMessageQueue
		if (items > 3) {
			checkMessageQueue = SvTRUE(ST(3));
		}
		
		THIS->GetMouse(&location, &buttons, checkMessageQueue);
		sv_setuv(buttons_sv, (UV)buttons);
		
		location_sv = create_perl_object((void*)&location, "Haiku::Point", false);
		DUMPME(1,location_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(location_sv));
		PUSHs(sv_2mortal(buttons_sv));

void
BView::WithRect(message, rect, ...)
	INPUT:
		BMessage* message;
		BRect rect;
	INIT:
		BHandler* replyTarget = NULL;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: rect
		// item 3: replyTarget
		if (items > 3) {
			replyTarget = (BHandler*)get_cpp_object(ST(3));
		}
		
		THIS->DragMessage(message, rect, replyTarget);

SV*
BView::FindView(name)
	INPUT:
		const char* name;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: name
		
		retval = THIS->FindView(name);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::Parent()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Parent();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::Bounds()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Bounds();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::Frame()
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

SV*
BView::ConvertPointToScreen(localPoint)
	INPUT:
		BPoint localPoint;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: localPoint
		
		retval = THIS->ConvertToScreen(localPoint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertPointFromScreen(screenPoint)
	INPUT:
		BPoint screenPoint;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: screenPoint
		
		retval = THIS->ConvertFromScreen(screenPoint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertRectToScreen(localRect)
	INPUT:
		BRect localRect;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: localRect
		
		retval = THIS->ConvertToScreen(localRect);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertRectFromScreen(screenRect)
	INPUT:
		BRect screenRect;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: screenRect
		
		retval = THIS->ConvertFromScreen(screenRect);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertPointToParent(localPoint)
	INPUT:
		BPoint localPoint;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: localPoint
		
		retval = THIS->ConvertToParent(localPoint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertPointFromParent(parentPoint)
	INPUT:
		BPoint parentPoint;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: parentPoint
		
		retval = THIS->ConvertFromParent(parentPoint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertRectToParent(localRect)
	INPUT:
		BRect localRect;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: localRect
		
		retval = THIS->ConvertToParent(localRect);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ConvertRectFromParent(parentRect)
	INPUT:
		BRect parentRect;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: parentRect
		
		retval = THIS->ConvertFromParent(parentRect);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::LeftTop()
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

void
BView::ClipToPicture(picture, ...)
	INPUT:
		BPicture* picture;
	INIT:
		BPoint where = B_ORIGIN;
		bool sync = true;
	CODE:
		// item 0: THIS
		// item 1: picture
		// item 2: where
		if (items > 2) {
			where = *(BPoint*)get_cpp_object(ST(2));
		}
		// item 3: sync
		if (items > 3) {
			sync = SvTRUE(ST(3));
		}
		
		THIS->ClipToPicture(picture, where, sync);

void
BView::ClipToInversePicture(picture, ...)
	INPUT:
		BPicture* picture;
	INIT:
		BPoint where = B_ORIGIN;
		bool sync = true;
	CODE:
		// item 0: THIS
		// item 1: picture
		// item 2: where
		if (items > 2) {
			where = *(BPoint*)get_cpp_object(ST(2));
		}
		// item 3: sync
		if (items > 3) {
			sync = SvTRUE(ST(3));
		}
		
		THIS->ClipToInversePicture(picture, where, sync);

void
BView::SetDrawingMode(mode)
	INPUT:
		drawing_mode mode;
	CODE:
		// item 0: THIS
		// item 1: mode
		
		THIS->SetDrawingMode(mode);

drawing_mode
BView::DrawingMode()
	INIT:
		drawing_mode retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->DrawingMode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::SetBlendingMode(srcAlpha, alphaFunc)
	INPUT:
		source_alpha srcAlpha;
		alpha_function alphaFunc;
	CODE:
		// item 0: THIS
		// item 1: srcAlpha
		// item 2: alphaFunc
		
		THIS->SetBlendingMode(srcAlpha, alphaFunc);

void
BView::GetBlendingMode()
	INIT:
		source_alpha srcAlpha;
		alpha_function alphaFunc;
		SV* srcAlpha_sv = newSV(0);	// retcount > 1
		SV* alphaFunc_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetBlendingMode(&srcAlpha, &alphaFunc);
		sv_setiv(srcAlpha_sv, (IV)srcAlpha);
		sv_setiv(alphaFunc_sv, (IV)alphaFunc);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(srcAlpha_sv));
		PUSHs(sv_2mortal(alphaFunc_sv));

void
BView::SetPenSize(size)
	INPUT:
		float size;
	CODE:
		// item 0: THIS
		// item 1: size
		
		THIS->SetPenSize(size);

float
BView::PenSize()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->PenSize();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::SetViewCursor(cursor, ...)
	INPUT:
		BCursor* cursor;
	INIT:
		bool sync = true;
	CODE:
		// item 0: THIS
		// item 1: cursor
		// item 2: sync
		if (items > 2) {
			sync = SvTRUE(ST(2));
		}
		
		THIS->SetViewCursor(cursor, sync);

void
BView::SetViewColor(c)
	INPUT:
		rgb_color c;
	CODE:
		// item 0: THIS
		// item 1: c
		
		THIS->SetViewColor(c);

void
BView::SetViewColorWithRGBA(r, g, b, ...)
	INPUT:
		uchar r;
		uchar g;
		uchar b;
	INIT:
		uchar a = 255;
	CODE:
		// item 0: THIS
		// item 1: r
		// item 2: g
		// item 3: b
		// item 4: a
		if (items > 4) {
			a = (uchar)SvUV(ST(4));
		}
		
		THIS->SetViewColor(r, g, b, a);

SV*
BView::ViewColor()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->ViewColor();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::ClearViewOverlay()
	CODE:
		// item 0: THIS
		
		THIS->ClearViewOverlay();

void
BView::SetHighColor(c)
	INPUT:
		rgb_color c;
	CODE:
		// item 0: THIS
		// item 1: c
		
		THIS->SetHighColor(c);

void
BView::SetHighColorWithRGBA(r, g, b, ...)
	INPUT:
		uchar r;
		uchar g;
		uchar b;
	INIT:
		uchar a = 255;
	CODE:
		// item 0: THIS
		// item 1: r
		// item 2: g
		// item 3: b
		// item 4: a
		if (items > 4) {
			a = (uchar)SvUV(ST(4));
		}
		
		THIS->SetHighColor(r, g, b, a);

SV*
BView::HighColor()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->HighColor();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::SetLowColor(c)
	INPUT:
		rgb_color c;
	CODE:
		// item 0: THIS
		// item 1: c
		
		THIS->SetLowColor(c);

void
BView::SetLowColorWithRGBA(r, g, b, ...)
	INPUT:
		uchar r;
		uchar g;
		uchar b;
	INIT:
		uchar a = 255;
	CODE:
		// item 0: THIS
		// item 1: r
		// item 2: g
		// item 3: b
		// item 4: a
		if (items > 4) {
			a = (uchar)SvUV(ST(4));
		}
		
		THIS->SetLowColor(r, g, b, a);

SV*
BView::LowColor()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->LowColor();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::SetLineMode(lineCap, lineJoin, ...)
	INPUT:
		cap_mode lineCap;
		join_mode lineJoin;
	INIT:
		float miterLimit = B_DEFAULT_MITER_LIMIT;
	CODE:
		// item 0: THIS
		// item 1: lineCap
		// item 2: lineJoin
		// item 3: miterLimit
		if (items > 3) {
			miterLimit = (float)SvNV(ST(3));
		}
		
		THIS->SetLineMode(lineCap, lineJoin, miterLimit);

join_mode
BView::LineJoinMode()
	INIT:
		join_mode retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->LineJoinMode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

cap_mode
BView::LineCapMode()
	INIT:
		cap_mode retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->LineCapMode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BView::LineMiterLimit()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->LineMiterLimit();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::SetOrigin(point)
	INPUT:
		BPoint point;
	CODE:
		// item 0: THIS
		// item 1: point
		
		THIS->SetOrigin(point);

void
BView::SetOriginWithXY(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->SetOrigin(x, y);

SV*
BView::Origin()
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Origin();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::PushState()
	CODE:
		// item 0: THIS
		
		THIS->PushState();

void
BView::PopState()
	CODE:
		// item 0: THIS
		
		THIS->PopState();

void
BView::MovePenTo(point)
	INPUT:
		BPoint point;
	CODE:
		// item 0: THIS
		// item 1: point
		
		THIS->MovePenTo(point);

void
BView::MovePenToXY(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->MovePenTo(x, y);

void
BView::MovePenBy(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->MovePenBy(x, y);

SV*
BView::PenLocation()
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->PenLocation();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::StrokeLineFromPenLocation(toPoint, ...)
	INPUT:
		BPoint toPoint;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: toPoint
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->StrokeLine(toPoint, p);

void
BView::StrokeLine(a, b, ...)
	INPUT:
		BPoint a;
		BPoint b;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: a
		// item 2: b
		// item 3: p
		if (items > 3) {
			p = *(pattern*)get_cpp_object(ST(3));
		}
		
		THIS->StrokeLine(a, b, p);

void
BView::BeginLineArray(count)
	INPUT:
		int32 count;
	CODE:
		// item 0: THIS
		// item 1: count
		
		THIS->BeginLineArray(count);

void
BView::AddLine(a, b, color)
	INPUT:
		BPoint a;
		BPoint b;
		rgb_color color;
	CODE:
		// item 0: THIS
		// item 1: a
		// item 2: b
		// item 3: color
		
		THIS->AddLine(a, b, color);

void
BView::EndLineArray()
	CODE:
		// item 0: THIS
		
		THIS->EndLineArray();

void
BView::StrokePolygon(polygon, ...)
	INPUT:
		BPolygon* polygon;
	INIT:
		bool closed = true;
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: polygon
		// item 2: closed
		if (items > 2) {
			closed = SvTRUE(ST(2));
		}
		// item 3: p
		if (items > 3) {
			p = *(pattern*)get_cpp_object(ST(3));
		}
		
		THIS->StrokePolygon(polygon, closed, p);

void
BView::StrokePolygonFromPointArray(pointArray_sv, ...)
	INPUT:
		SV* pointArray_sv;
	INIT:
		BPoint* pointArray;
		AV* pointArray_sv_av;
		int32 numPoints;
		bool closed = true;
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: pointArray
		pointArray = (BPoint*)malloc(numPoints * sizeof(BPoint));
		//Converting Perl arg 'pointArray_sv' to C array 'pointArray'
		pointArray_sv_av = (AV*)SvRV(pointArray_sv);
		numPoints = av_len(pointArray_sv_av) + 1;
		for (int i = 0; i < numPoints; i++) {
			SV** element_sv = av_fetch(pointArray_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			pointArray[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: numPoints
		// item 2: closed
		if (items > 2) {
			closed = SvTRUE(ST(2));
		}
		// item 3: p
		if (items > 3) {
			p = *(pattern*)get_cpp_object(ST(3));
		}
		
		THIS->StrokePolygon(pointArray, numPoints, closed, p);
		
		free((void*)pointArray);

void
BView::StrokePolygonFromPointArrayWithinBounds(pointArray_sv, bounds, ...)
	INPUT:
		SV* pointArray_sv;
		BRect bounds;
	INIT:
		BPoint* pointArray;
		AV* pointArray_sv_av;
		int32 numPoints;
		bool closed = true;
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: pointArray
		pointArray = (BPoint*)malloc(numPoints * sizeof(BPoint));
		//Converting Perl arg 'pointArray_sv' to C array 'pointArray'
		pointArray_sv_av = (AV*)SvRV(pointArray_sv);
		numPoints = av_len(pointArray_sv_av) + 1;
		for (int i = 0; i < numPoints; i++) {
			SV** element_sv = av_fetch(pointArray_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			pointArray[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: numPoints
		// item 2: bounds
		// item 3: closed
		if (items > 3) {
			closed = SvTRUE(ST(3));
		}
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->StrokePolygon(pointArray, numPoints, bounds, closed, p);
		
		free((void*)pointArray);

void
BView::FillPolygon(polygon, ...)
	INPUT:
		BPolygon* polygon;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: polygon
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->FillPolygon(polygon, p);

void
BView::FillPolygonFromPointArray(pointArray_sv, ...)
	INPUT:
		SV* pointArray_sv;
	INIT:
		BPoint* pointArray;
		AV* pointArray_sv_av;
		int32 numPoints;
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: pointArray
		pointArray = (BPoint*)malloc(numPoints * sizeof(BPoint));
		//Converting Perl arg 'pointArray_sv' to C array 'pointArray'
		pointArray_sv_av = (AV*)SvRV(pointArray_sv);
		numPoints = av_len(pointArray_sv_av) + 1;
		for (int i = 0; i < numPoints; i++) {
			SV** element_sv = av_fetch(pointArray_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			pointArray[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: numPoints
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->FillPolygon(pointArray, numPoints, p);
		
		free((void*)pointArray);

void
BView::FillPolygonFromPointArrayWithinBounds(pointArray_sv, bounds, ...)
	INPUT:
		SV* pointArray_sv;
		BRect bounds;
	INIT:
		BPoint* pointArray;
		AV* pointArray_sv_av;
		int32 numPoints;
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: pointArray
		pointArray = (BPoint*)malloc(numPoints * sizeof(BPoint));
		//Converting Perl arg 'pointArray_sv' to C array 'pointArray'
		pointArray_sv_av = (AV*)SvRV(pointArray_sv);
		numPoints = av_len(pointArray_sv_av) + 1;
		for (int i = 0; i < numPoints; i++) {
			SV** element_sv = av_fetch(pointArray_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			pointArray[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: numPoints
		// item 2: bounds
		// item 3: p
		if (items > 3) {
			p = *(pattern*)get_cpp_object(ST(3));
		}
		
		THIS->FillPolygon(pointArray, numPoints, bounds, p);
		
		free((void*)pointArray);

void
BView::StrokeTriangle(point1, point2, point3, ...)
	INPUT:
		BPoint point1;
		BPoint point2;
		BPoint point3;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: point1
		// item 2: point2
		// item 3: point3
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->StrokeTriangle(point1, point2, point3, p);

void
BView::StrokeTriangleWithinBounds(point1, point2, point3, bounds, ...)
	INPUT:
		BPoint point1;
		BPoint point2;
		BPoint point3;
		BRect bounds;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: point1
		// item 2: point2
		// item 3: point3
		// item 4: bounds
		// item 5: p
		if (items > 5) {
			p = *(pattern*)get_cpp_object(ST(5));
		}
		
		THIS->StrokeTriangle(point1, point2, point3, bounds, p);

void
BView::FillTriangle(point1, point2, point3, ...)
	INPUT:
		BPoint point1;
		BPoint point2;
		BPoint point3;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: point1
		// item 2: point2
		// item 3: point3
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->FillTriangle(point1, point2, point3, p);

void
BView::FillTriangleWithinBounds(point1, point2, point3, bounds, ...)
	INPUT:
		BPoint point1;
		BPoint point2;
		BPoint point3;
		BRect bounds;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: point1
		// item 2: point2
		// item 3: point3
		// item 4: bounds
		// item 5: p
		if (items > 5) {
			p = *(pattern*)get_cpp_object(ST(5));
		}
		
		THIS->FillTriangle(point1, point2, point3, bounds, p);

void
BView::StrokeRect(rect, ...)
	INPUT:
		BRect rect;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->StrokeRect(rect, p);

void
BView::FillRect(rect, ...)
	INPUT:
		BRect rect;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->FillRect(rect, p);

void
BView::InvertRect(rect)
	INPUT:
		BRect rect;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		THIS->InvertRect(rect);

void
BView::StrokeRoundRect(rect, xRadius, yRadius, ...)
	INPUT:
		BRect rect;
		float xRadius;
		float yRadius;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: xRadius
		// item 3: yRadius
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->StrokeRoundRect(rect, xRadius, yRadius, p);

void
BView::FillRoundRect(rect, xRadius, yRadius, ...)
	INPUT:
		BRect rect;
		float xRadius;
		float yRadius;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: xRadius
		// item 3: yRadius
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->FillRoundRect(rect, xRadius, yRadius, p);

void
BView::StrokeEllipse(center, xRadius, yRadius, ...)
	INPUT:
		BPoint center;
		float xRadius;
		float yRadius;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: center
		// item 2: xRadius
		// item 3: yRadius
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->StrokeEllipse(center, xRadius, yRadius, p);

void
BView::StrokeEllipseFromRect(rect, ...)
	INPUT:
		BRect rect;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->StrokeEllipse(rect, p);

void
BView::FillEllipse(center, xRadius, yRadius, ...)
	INPUT:
		BPoint center;
		float xRadius;
		float yRadius;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: center
		// item 2: xRadius
		// item 3: yRadius
		// item 4: p
		if (items > 4) {
			p = *(pattern*)get_cpp_object(ST(4));
		}
		
		THIS->FillEllipse(center, xRadius, yRadius, p);

void
BView::FillEllipseFromRect(rect, ...)
	INPUT:
		BRect rect;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: rect
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->FillEllipse(rect, p);

void
BView::StrokeArc(center, xRadius, yRadius, startAngle, arcAngle, ...)
	INPUT:
		BPoint center;
		float xRadius;
		float yRadius;
		float startAngle;
		float arcAngle;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: center
		// item 2: xRadius
		// item 3: yRadius
		// item 4: startAngle
		// item 5: arcAngle
		// item 6: p
		if (items > 6) {
			p = *(pattern*)get_cpp_object(ST(6));
		}
		
		THIS->StrokeArc(center, xRadius, yRadius, startAngle, arcAngle, p);

void
BView::StrokeArcFromRect(center, xRadius, yRadius, startAngle, arcAngle, ...)
	INPUT:
		BPoint center;
		float xRadius;
		float yRadius;
		float startAngle;
		float arcAngle;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: center
		// item 2: xRadius
		// item 3: yRadius
		// item 4: startAngle
		// item 5: arcAngle
		// item 6: p
		if (items > 6) {
			p = *(pattern*)get_cpp_object(ST(6));
		}
		
		THIS->StrokeArc(center, xRadius, yRadius, startAngle, arcAngle, p);

void
BView::FillArc(center, xRadius, yRadius, startAngle, arcAngle, ...)
	INPUT:
		BPoint center;
		float xRadius;
		float yRadius;
		float startAngle;
		float arcAngle;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: center
		// item 2: xRadius
		// item 3: yRadius
		// item 4: startAngle
		// item 5: arcAngle
		// item 6: p
		if (items > 6) {
			p = *(pattern*)get_cpp_object(ST(6));
		}
		
		THIS->FillArc(center, xRadius, yRadius, startAngle, arcAngle, p);

void
BView::FillArcFromRect(center, xRadius, yRadius, startAngle, arcAngle, ...)
	INPUT:
		BPoint center;
		float xRadius;
		float yRadius;
		float startAngle;
		float arcAngle;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: center
		// item 2: xRadius
		// item 3: yRadius
		// item 4: startAngle
		// item 5: arcAngle
		// item 6: p
		if (items > 6) {
			p = *(pattern*)get_cpp_object(ST(6));
		}
		
		THIS->FillArc(center, xRadius, yRadius, startAngle, arcAngle, p);

void
BView::StrokeBezier(controlPoints, ...)
	INPUT:
		BPoint* controlPoints;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: controlPoints
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->StrokeBezier(controlPoints, p);

void
BView::FillBezier(controlPoints, ...)
	INPUT:
		BPoint* controlPoints;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: controlPoints
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->FillBezier(controlPoints, p);

void
BView::StrokeShape(shape, ...)
	INPUT:
		BShape* shape;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: shape
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->StrokeShape(shape, p);

void
BView::FillShape(shape, ...)
	INPUT:
		BShape* shape;
	INIT:
		pattern p = B_SOLID_HIGH;
	CODE:
		// item 0: THIS
		// item 1: shape
		// item 2: p
		if (items > 2) {
			p = *(pattern*)get_cpp_object(ST(2));
		}
		
		THIS->FillShape(shape, p);

void
BView::CopyBits(src, dst)
	INPUT:
		BRect src;
		BRect dst;
	CODE:
		// item 0: THIS
		// item 1: src
		// item 2: dst
		
		THIS->CopyBits(src, dst);

void
BView::DrawChar(aChar)
	INPUT:
		char aChar;
	CODE:
		// item 0: THIS
		// item 1: aChar
		
		THIS->DrawChar(aChar);

void
BView::DrawCharToPoint(aChar, location)
	INPUT:
		char aChar;
		BPoint location;
	CODE:
		// item 0: THIS
		// item 1: aChar
		// item 2: location
		
		THIS->DrawChar(aChar, location);

void
BView::DrawString(string, ...)
	INPUT:
		char* string;
	INIT:
		escapement_delta* delta = NULL;
	CODE:
		// item 0: THIS
		// item 1: string
		// item 2: delta
		if (items > 2) {
			delta = (escapement_delta*)get_cpp_object(ST(2));
		}
		
		THIS->DrawString(string, delta);

void
BView::DrawStringToPoint(string, location, ...)
	INPUT:
		char* string;
		BPoint location;
	INIT:
		escapement_delta* delta = NULL;
	CODE:
		// item 0: THIS
		// item 1: string
		// item 2: location
		// item 3: delta
		if (items > 3) {
			delta = (escapement_delta*)get_cpp_object(ST(3));
		}
		
		THIS->DrawString(string, location, delta);

void
BView::DrawStringWithLength(string_sv, ...)
	INPUT:
		SV* string_sv;
	INIT:
		char* string;
		STRLEN string_sv_length;
		int32 length;
		escapement_delta* delta = NULL;
	CODE:
		// item 0: THIS
		// item 1: string
		string = (char*)SvPV(string_sv, string_sv_length);
		length = string_sv_length;
		// not an XS input: length
		// item 2: delta
		if (items > 2) {
			delta = (escapement_delta*)get_cpp_object(ST(2));
		}
		
		THIS->DrawString(string, length, delta);

void
BView::DrawStringWithLengthToPoint(string_sv, location, ...)
	INPUT:
		SV* string_sv;
		BPoint location;
	INIT:
		char* string;
		STRLEN string_sv_length;
		int32 length;
		escapement_delta* delta = NULL;
	CODE:
		// item 0: THIS
		// item 1: string
		string = (char*)SvPV(string_sv, string_sv_length);
		length = string_sv_length;
		// not an XS input: length
		// item 2: location
		// item 3: delta
		if (items > 3) {
			delta = (escapement_delta*)get_cpp_object(ST(3));
		}
		
		THIS->DrawString(string, length, location, delta);

void
BView::DrawStringToPointArray(string, locations_sv)
	INPUT:
		char* string;
		SV* locations_sv;
	INIT:
		BPoint* locations;
		AV* locations_sv_av;
		int32 locationCount;
	CODE:
		// item 0: THIS
		// item 1: string
		// item 2: locations
		locations = (BPoint*)malloc(locationCount * sizeof(BPoint));
		//Converting Perl arg 'locations_sv' to C array 'locations'
		locations_sv_av = (AV*)SvRV(locations_sv);
		locationCount = av_len(locations_sv_av) + 1;
		for (int i = 0; i < locationCount; i++) {
			SV** element_sv = av_fetch(locations_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			locations[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: locationCount
		
		THIS->DrawString(string, locations, locationCount);
		
		free((void*)locations);

void
BView::DrawStringWithLengthToPointArray(string_sv, locations_sv)
	INPUT:
		SV* string_sv;
		SV* locations_sv;
	INIT:
		char* string;
		STRLEN string_sv_length;
		int32 length;
		BPoint* locations;
		AV* locations_sv_av;
		int32 locationCount;
	CODE:
		// item 0: THIS
		// item 1: string
		string = (char*)SvPV(string_sv, string_sv_length);
		length = string_sv_length;
		// not an XS input: length
		// item 2: locations
		locations = (BPoint*)malloc(locationCount * sizeof(BPoint));
		//Converting Perl arg 'locations_sv' to C array 'locations'
		locations_sv_av = (AV*)SvRV(locations_sv);
		locationCount = av_len(locations_sv_av) + 1;
		for (int i = 0; i < locationCount; i++) {
			SV** element_sv = av_fetch(locations_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			locations[i] = *(BPoint*)get_cpp_object(*element_sv);
		}
		// not an XS input: locationCount
		
		THIS->DrawString(string, length, locations, locationCount);
		
		free((void*)locations);

void
BView::SetFont(font, ...)
	INPUT:
		BFont* font;
	INIT:
		uint32 mask = B_FONT_ALL;
	CODE:
		// item 0: THIS
		// item 1: font
		// item 2: mask
		if (items > 2) {
			mask = (uint32)SvUV(ST(2));
		}
		
		THIS->SetFont(font, mask);

SV*
BView::GetFont()
	INIT:
		BFont* font;
		SV* font_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		THIS->GetFont(font);
		
		font_sv = create_perl_object((void*)font, "Haiku::Font", false);
		DUMPME(1,font_sv);
		RETVAL = newSVsv(font_sv);
		SvREFCNT_dec(font_sv);
	OUTPUT:
		RETVAL

float
BView::StringWidth(string)
	INPUT:
		const char* string;
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		// item 1: string
		
		retval = THIS->StringWidth(string);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BView::StringWidthWithLength(string_sv)
	INPUT:
		SV* string_sv;
	INIT:
		const char* string;
		STRLEN string_sv_length;
		int32 length;
		float retval;
	CODE:
		// item 0: THIS
		// item 1: string
		string = (const char*)SvPV(string_sv, string_sv_length);
		length = string_sv_length;
		// not an XS input: length
		
		retval = THIS->StringWidth(string, length);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BView::GetStringWidths(stringArray_sv, lengthArray_sv)
	INPUT:
		SV* stringArray_sv;
		SV* lengthArray_sv;
	INIT:
		char** stringArray;
		AV* stringArray_sv_av;
		int32* lengthArray;
		AV* lengthArray_sv_av;
		int32 numStrings;
		float* widthArray;
		AV* widthArray_sv_av;
		SV* widthArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: stringArray
		stringArray = (char**)malloc(numStrings * sizeof(char*));
		//Converting Perl arg 'stringArray_sv' to C array 'stringArray'
		stringArray_sv_av = (AV*)SvRV(stringArray_sv);
		numStrings = av_len(stringArray_sv_av) + 1;
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(stringArray_sv_av, i, 0);
			if (element_sv == NULL) {
				stringArray[i] = NULL;
				continue;
			}
			stringArray[i] = (char*)SvPV_nolen(*element_sv);
		}
		// item 2: lengthArray
		lengthArray = (int32*)malloc(numStrings * sizeof(int32));
		//Converting Perl arg 'lengthArray_sv' to C array 'lengthArray'
		lengthArray_sv_av = (AV*)SvRV(lengthArray_sv);
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(lengthArray_sv_av, i, 0);
			if (element_sv == NULL) {
				lengthArray[i] = 0;
				continue;
			}
			lengthArray[i] = (int32)SvIV(*element_sv);
		}
		// not an XS input: numStrings
		
		THIS->GetStringWidths(stringArray, lengthArray, numStrings, widthArray);
		
		free((void*)stringArray);
		free((void*)lengthArray);
		//Converting C array 'widthArray' to Perl arg 'widthArray_sv'
		widthArray_sv_av = newAV();
		for (int i = 0; i < numStrings; i++) {
			SV* element_sv = newSV(0);
			sv_setnv(element_sv, (double)widthArray[i]);
			av_push(widthArray_sv_av, element_sv);
		}
		widthArray_sv = newRV_noinc((SV*) widthArray_sv_av);
		RETVAL = widthArray_sv;
	OUTPUT:
		RETVAL

void
BView::SetFontSize(size)
	INPUT:
		float size;
	CODE:
		// item 0: THIS
		// item 1: size
		
		THIS->SetFontSize(size);

void
BView::ForceFontAliasing(enable)
	INPUT:
		bool enable;
	CODE:
		// item 0: THIS
		// item 1: enable
		
		THIS->ForceFontAliasing(enable);

SV*
BView::GetFontHeight()
	INIT:
		font_height* height;
		SV* height_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		THIS->GetFontHeight(height);
		
		height_sv = create_perl_object((void*)height, "Haiku::font_height", false);
		DUMPME(1,height_sv);
		RETVAL = newSVsv(height_sv);
		SvREFCNT_dec(height_sv);
	OUTPUT:
		RETVAL

void
BView::Invalidate()
	CODE:
		// item 0: THIS
		
		THIS->Invalidate();

void
BView::InavlidateRect(invalRect)
	INPUT:
		BRect invalRect;
	CODE:
		// item 0: THIS
		// item 1: invalRect
		
		THIS->Invalidate(invalRect);

void
BView::SetDiskMode(filename, offset)
	INPUT:
		char* filename;
		long offset;
	CODE:
		// item 0: THIS
		// item 1: filename
		// item 2: offset
		
		THIS->SetDiskMode(filename, offset);

void
BView::BeginPicture(aPicture)
	INPUT:
		BPicture* aPicture;
	CODE:
		// item 0: THIS
		// item 1: aPicture
		
		THIS->BeginPicture(aPicture);

void
BView::AppendToPicture(aPicture)
	INPUT:
		BPicture* aPicture;
	CODE:
		// item 0: THIS
		// item 1: aPicture
		
		THIS->AppendToPicture(aPicture);

SV*
BView::EndPicture()
	INIT:
		BPicture* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->EndPicture();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Picture", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BView::DrawPicture(aPicture)
	INPUT:
		BPicture* aPicture;
	CODE:
		// item 0: THIS
		// item 1: aPicture
		
		THIS->DrawPicture(aPicture);

void
BView::DrawPictureToPoint(aPicture, where)
	INPUT:
		BPicture* aPicture;
		BPoint where;
	CODE:
		// item 0: THIS
		// item 1: aPicture
		// item 2: where
		
		THIS->DrawPicture(aPicture, where);

void
BView::DrawPictureFromFile(filename, offset, where)
	INPUT:
		const char* filename;
		long offset;
		BPoint where;
	CODE:
		// item 0: THIS
		// item 1: filename
		// item 2: offset
		// item 3: where
		
		THIS->DrawPicture(filename, offset, where);

void
BView::DrawPictureAsync(aPicture)
	INPUT:
		BPicture* aPicture;
	CODE:
		// item 0: THIS
		// item 1: aPicture
		
		THIS->DrawPictureAsync(aPicture);

void
BView::DrawPictureAsyncToPoint(aPicture, where)
	INPUT:
		BPicture* aPicture;
		BPoint where;
	CODE:
		// item 0: THIS
		// item 1: aPicture
		// item 2: where
		
		THIS->DrawPictureAsync(aPicture, where);

void
BView::DrawPictureAsyncFromFile(filename, offset, where)
	INPUT:
		const char* filename;
		long offset;
		BPoint where;
	CODE:
		// item 0: THIS
		// item 1: filename
		// item 2: offset
		// item 3: where
		
		THIS->DrawPictureAsync(filename, offset, where);

bool
BView::SetEventMask(mask, ...)
	INPUT:
		uint32 mask;
	INIT:
		uint32 options = 0;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: mask
		// item 2: options
		if (items > 2) {
			options = (uint32)SvUV(ST(2));
		}
		
		retval = THIS->SetEventMask(mask, options);
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

uint32
BView::EventMask()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->EventMask();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BView::SetMouseEventMask(mask, ...)
	INPUT:
		uint32 mask;
	INIT:
		uint32 options = 0;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: mask
		// item 2: options
		if (items > 2) {
			options = (uint32)SvUV(ST(2));
		}
		
		retval = THIS->SetMouseEventMask(mask, options);
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

void
BView::SetFlags(flags)
	INPUT:
		uint32 flags;
	CODE:
		// item 0: THIS
		// item 1: flags
		
		THIS->SetFlags(flags);

uint32
BView::Flags()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Flags();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::SetResizingMode(mode)
	INPUT:
		uint32 mode;
	CODE:
		// item 0: THIS
		// item 1: mode
		
		THIS->SetResizingMode(mode);

uint32
BView::ResizingMode()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->ResizingMode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::MoveBy(horizontal, vertical)
	INPUT:
		float horizontal;
		float vertical;
	CODE:
		// item 0: THIS
		// item 1: horizontal
		// item 2: vertical
		
		THIS->MoveBy(horizontal, vertical);

void
BView::MoveTo(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->MoveTo(x, y);

void
BView::ResizeBy(horizontal, vertical)
	INPUT:
		float horizontal;
		float vertical;
	CODE:
		// item 0: THIS
		// item 1: horizontal
		// item 2: vertical
		
		THIS->ResizeBy(horizontal, vertical);

void
BView::ResizeTo(width, height)
	INPUT:
		float width;
		float height;
	CODE:
		// item 0: THIS
		// item 1: width
		// item 2: height
		
		THIS->ResizeTo(width, height);

void
BView::ScrollBy(horizontal, vertical)
	INPUT:
		float horizontal;
		float vertical;
	CODE:
		// item 0: THIS
		// item 1: horizontal
		// item 2: vertical
		
		THIS->ScrollBy(horizontal, vertical);

void
BView::ScrollTo(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->ScrollTo(x, y);

void
BView::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

bool
BView::IsFocus()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFocus();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::Show()
	CODE:
		// item 0: THIS
		
		THIS->Show();

void
BView::Hide()
	CODE:
		// item 0: THIS
		
		THIS->Hide();

bool
BView::IsHidden()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsHidden();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::Flush()
	CODE:
		// item 0: THIS
		
		THIS->Flush();

void
BView::Sync()
	CODE:
		// item 0: THIS
		
		THIS->Sync();

void
BView::GetPreferredSize()
	INIT:
		float width;
		float height;
		SV* width_sv = newSV(0);	// retcount > 1
		SV* height_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetPreferredSize(&width, &height);
		sv_setnv(width_sv, (double)width);
		sv_setnv(height_sv, (double)height);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(width_sv));
		PUSHs(sv_2mortal(height_sv));

void
BView::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

SV*
BView::ScrollBar(posture)
	INPUT:
		orientation posture;
	INIT:
		BScrollBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: posture
		
		retval = THIS->ScrollBar(posture);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::ScrollBar", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BView::ResolveSpecifier(message, index, specifier, form, property)
	INPUT:
		BMessage* message;
		int32 index;
		BMessage* specifier;
		int32 form;
		const char* property;
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: index
		// item 3: specifier
		// item 4: form
		// item 5: property
		
		retval = THIS->ResolveSpecifier(message, index, specifier, form, property);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BView::GetSupportedSuites(data)
	INPUT:
		BMessage* data;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->GetSupportedSuites(data);
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
BView::IsPrinting()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsPrinting();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::SetScale(scale)
	INPUT:
		float scale;
	CODE:
		// item 0: THIS
		// item 1: scale
		
		THIS->SetScale(scale);

float
BView::Scale()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Scale();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::DrawAfterChildren(rect)
	INPUT:
		BRect rect;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		THIS->DrawAfterChildren(rect);

bool
BView::HasHeightForWidth()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->HasHeightForWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::GetHeightForWidth(width)
	INPUT:
		float width;
	INIT:
		float min;
		float max;
		float preferred;
		SV* min_sv = newSV(0);	// retcount > 1
		SV* max_sv = newSV(0);	// retcount > 1
		SV* preferred_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: width
		
		THIS->GetHeightForWidth(width, &min, &max, &preferred);
		sv_setnv(min_sv, (double)min);
		sv_setnv(max_sv, (double)max);
		sv_setnv(preferred_sv, (double)preferred);
		
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(min_sv));
		PUSHs(sv_2mortal(max_sv));
		PUSHs(sv_2mortal(preferred_sv));

void
BView::InvalidateLayout(...)
	INIT:
		bool descendants = false;
	CODE:
		// item 0: THIS
		// item 1: descendants
		if (items > 1) {
			descendants = SvTRUE(ST(1));
		}
		
		THIS->InvalidateLayout(descendants);

void
BView::EnableLayoutInvalidation()
	CODE:
		// item 0: THIS
		
		THIS->EnableLayoutInvalidation();

void
BView::DisableLayoutInvalidation()
	CODE:
		// item 0: THIS
		
		THIS->DisableLayoutInvalidation();

bool
BView::IsLayoutValid()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsLayoutValid();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BView::ResetLayoutInvalidation()
	CODE:
		// item 0: THIS
		
		THIS->ResetLayoutInvalidation();

void
BView::Layout(force)
	INPUT:
		bool force;
	CODE:
		// item 0: THIS
		// item 1: force
		
		THIS->Layout(force);

void
BView::Relayout()
	CODE:
		// item 0: THIS
		
		THIS->Relayout();

void
BView::SetTooltipWithText(text)
	INPUT:
		const char* text;
	CODE:
		// item 0: THIS
		// item 1: text
		
		THIS->SetToolTip(text);

void
BView::ShowToolTip()
	CODE:
		// item 0: THIS
		
		THIS->ShowToolTip();

void
BView::HideToolTip()
	CODE:
		// item 0: THIS
		
		THIS->HideToolTip();

SV*
B_PRIMARY_MOUSE_BUTTON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIMARY_MOUSE_BUTTON);
		dualize(RETVAL, "B_PRIMARY_MOUSE_BUTTON");
	OUTPUT:
		RETVAL

SV*
B_SECONDARY_MOUSE_BUTTON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SECONDARY_MOUSE_BUTTON);
		dualize(RETVAL, "B_SECONDARY_MOUSE_BUTTON");
	OUTPUT:
		RETVAL

SV*
B_TERTIARY_MOUSE_BUTTON()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TERTIARY_MOUSE_BUTTON);
		dualize(RETVAL, "B_TERTIARY_MOUSE_BUTTON");
	OUTPUT:
		RETVAL

SV*
B_ENTERED_VIEW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ENTERED_VIEW);
		dualize(RETVAL, "B_ENTERED_VIEW");
	OUTPUT:
		RETVAL

SV*
B_INSIDE_VIEW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_INSIDE_VIEW);
		dualize(RETVAL, "B_INSIDE_VIEW");
	OUTPUT:
		RETVAL

SV*
B_EXITED_VIEW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_EXITED_VIEW);
		dualize(RETVAL, "B_EXITED_VIEW");
	OUTPUT:
		RETVAL

SV*
B_OUTSIDE_VIEW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OUTSIDE_VIEW);
		dualize(RETVAL, "B_OUTSIDE_VIEW");
	OUTPUT:
		RETVAL

SV*
B_POINTER_EVENTS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_POINTER_EVENTS);
		dualize(RETVAL, "B_POINTER_EVENTS");
	OUTPUT:
		RETVAL

SV*
B_KEYBOARD_EVENTS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_KEYBOARD_EVENTS);
		dualize(RETVAL, "B_KEYBOARD_EVENTS");
	OUTPUT:
		RETVAL

SV*
B_LOCK_WINDOW_FOCUS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LOCK_WINDOW_FOCUS);
		dualize(RETVAL, "B_LOCK_WINDOW_FOCUS");
	OUTPUT:
		RETVAL

SV*
B_SUSPEND_VIEW_FOCUS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SUSPEND_VIEW_FOCUS);
		dualize(RETVAL, "B_SUSPEND_VIEW_FOCUS");
	OUTPUT:
		RETVAL

SV*
B_NO_POINTER_HISTORY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_POINTER_HISTORY);
		dualize(RETVAL, "B_NO_POINTER_HISTORY");
	OUTPUT:
		RETVAL

SV*
B_FULL_POINTER_HISTORY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FULL_POINTER_HISTORY);
		dualize(RETVAL, "B_FULL_POINTER_HISTORY");
	OUTPUT:
		RETVAL

SV*
B_TRACK_WHOLE_RECT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRACK_WHOLE_RECT);
		dualize(RETVAL, "B_TRACK_WHOLE_RECT");
	OUTPUT:
		RETVAL

SV*
B_TRACK_RECT_CORNER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRACK_RECT_CORNER);
		dualize(RETVAL, "B_TRACK_RECT_CORNER");
	OUTPUT:
		RETVAL

SV*
B_FONT_FAMILY_AND_STYLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_FAMILY_AND_STYLE);
		dualize(RETVAL, "B_FONT_FAMILY_AND_STYLE");
	OUTPUT:
		RETVAL

SV*
B_FONT_SIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_SIZE);
		dualize(RETVAL, "B_FONT_SIZE");
	OUTPUT:
		RETVAL

SV*
B_FONT_SHEAR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_SHEAR);
		dualize(RETVAL, "B_FONT_SHEAR");
	OUTPUT:
		RETVAL

SV*
B_FONT_ROTATION()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_ROTATION);
		dualize(RETVAL, "B_FONT_ROTATION");
	OUTPUT:
		RETVAL

SV*
B_FONT_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_SPACING);
		dualize(RETVAL, "B_FONT_SPACING");
	OUTPUT:
		RETVAL

SV*
B_FONT_ENCODING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_ENCODING);
		dualize(RETVAL, "B_FONT_ENCODING");
	OUTPUT:
		RETVAL

SV*
B_FONT_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_FACE);
		dualize(RETVAL, "B_FONT_FACE");
	OUTPUT:
		RETVAL

SV*
B_FONT_FLAGS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_FLAGS);
		dualize(RETVAL, "B_FONT_FLAGS");
	OUTPUT:
		RETVAL

SV*
B_FONT_FALSE_BOLD_WIDTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_FALSE_BOLD_WIDTH);
		dualize(RETVAL, "B_FONT_FALSE_BOLD_WIDTH");
	OUTPUT:
		RETVAL

SV*
B_FONT_ALL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_ALL);
		dualize(RETVAL, "B_FONT_ALL");
	OUTPUT:
		RETVAL

SV*
B_FULL_UPDATE_ON_RESIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FULL_UPDATE_ON_RESIZE);
		dualize(RETVAL, "B_FULL_UPDATE_ON_RESIZE");
	OUTPUT:
		RETVAL

SV*
B_WILL_DRAW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WILL_DRAW);
		dualize(RETVAL, "B_WILL_DRAW");
	OUTPUT:
		RETVAL

SV*
B_PULSE_NEEDED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PULSE_NEEDED);
		dualize(RETVAL, "B_PULSE_NEEDED");
	OUTPUT:
		RETVAL

SV*
B_NAVIGABLE_JUMP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NAVIGABLE_JUMP);
		dualize(RETVAL, "B_NAVIGABLE_JUMP");
	OUTPUT:
		RETVAL

SV*
B_FRAME_EVENTS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FRAME_EVENTS);
		dualize(RETVAL, "B_FRAME_EVENTS");
	OUTPUT:
		RETVAL

SV*
B_NAVIGABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NAVIGABLE);
		dualize(RETVAL, "B_NAVIGABLE");
	OUTPUT:
		RETVAL

SV*
B_SUBPIXEL_PRECISE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SUBPIXEL_PRECISE);
		dualize(RETVAL, "B_SUBPIXEL_PRECISE");
	OUTPUT:
		RETVAL

SV*
B_DRAW_ON_CHILDREN()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_DRAW_ON_CHILDREN);
		dualize(RETVAL, "B_DRAW_ON_CHILDREN");
	OUTPUT:
		RETVAL

SV*
B_INPUT_METHOD_AWARE()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_INPUT_METHOD_AWARE);
		dualize(RETVAL, "B_INPUT_METHOD_AWARE");
	OUTPUT:
		RETVAL

SV*
B_SUPPORTS_LAYOUT()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_SUPPORTS_LAYOUT);
		dualize(RETVAL, "B_SUPPORTS_LAYOUT");
	OUTPUT:
		RETVAL

SV*
B_INVALIDATE_AFTER_LAYOUT()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_INVALIDATE_AFTER_LAYOUT);
		dualize(RETVAL, "B_INVALIDATE_AFTER_LAYOUT");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_NONE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_NONE);
		dualize(RETVAL, "B_FOLLOW_NONE");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_ALL_SIDES()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_ALL_SIDES);
		dualize(RETVAL, "B_FOLLOW_ALL_SIDES");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_ALL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_ALL);
		dualize(RETVAL, "B_FOLLOW_ALL");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_LEFT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_LEFT);
		dualize(RETVAL, "B_FOLLOW_LEFT");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_RIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_RIGHT);
		dualize(RETVAL, "B_FOLLOW_RIGHT");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_LEFT_RIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_LEFT_RIGHT);
		dualize(RETVAL, "B_FOLLOW_LEFT_RIGHT");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_H_CENTER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_H_CENTER);
		dualize(RETVAL, "B_FOLLOW_H_CENTER");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_TOP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_TOP);
		dualize(RETVAL, "B_FOLLOW_TOP");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_BOTTOM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_BOTTOM);
		dualize(RETVAL, "B_FOLLOW_BOTTOM");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_TOP_BOTTOM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_TOP_BOTTOM);
		dualize(RETVAL, "B_FOLLOW_TOP_BOTTOM");
	OUTPUT:
		RETVAL

SV*
B_FOLLOW_V_CENTER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOLLOW_V_CENTER);
		dualize(RETVAL, "B_FOLLOW_V_CENTER");
	OUTPUT:
		RETVAL

bool
BView::operator_eq(object, swap)
	INPUT:
		BView* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BView::operator_ne(object, swap)
	INPUT:
		BView* object;
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
		get_sv("Haiku::View::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::View::()", XS_Haiku__InterfaceKit_nil, file);

