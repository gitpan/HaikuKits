#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Window

PROTOTYPES: DISABLE

SV*
BWindow::new(frame, title, type, flags, ...)
	INPUT:
		BRect frame;
		const char* title;
		window_type type;
		uint32 flags;
	INIT:
		uint32 workspaces = B_CURRENT_WORKSPACE;
		BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: title
		// item 3: type
		// item 4: flags
		// item 5: workspaces
		if (items > 5) {
			workspaces = (uint32)SvUV(ST(5));
		}
		
		retval = new BWindow(frame, title, type, flags, workspaces);
		
		retval_sv = create_perl_object((void*)retval, CLASS, true);
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
newFromLookAndFeel(CLASS, frame, title, look, feel, flags, ...)
	INPUT:
		char* CLASS;
		BRect frame;
		const char* title;
		window_look look;
		window_feel feel;
		uint32 flags;
	INIT:
		uint32 workspaces = B_CURRENT_WORKSPACE;
		BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: title
		// item 3: look
		// item 4: feel
		// item 5: flags
		// item 6: workspaces
		if (items > 6) {
			workspaces = (uint32)SvUV(ST(6));
		}
		
		retval = new BWindow(frame, title, look, feel, flags, workspaces);
		
		retval_sv = create_perl_object((void*)retval, CLASS, true);
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
		BWindow* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BWindow(archive);
		
		retval_sv = create_perl_object((void*)retval, CLASS, true);
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
		BWindow* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BWindow");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BWindow*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BWindow::Instantiate(data)
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
BWindow::Archive(...)
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

void
BWindow::Quit()
	CODE:
		// item 0: THIS
		
		THIS->Quit();

void
BWindow::Close()
	CODE:
		// item 0: THIS
		
		THIS->Close();

void
BWindow::AddChild(view, ...)
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
BWindow::RemoveChild(view)
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
BWindow::CountChildren()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountChildren();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BWindow::ChildAt(index)
	INPUT:
		int32 index;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		retval = THIS->ChildAt(index);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BWindow::DispatchMessage(message, handler)
	INPUT:
		BMessage* message;
		BHandler* handler;
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: handler
		
		THIS->DispatchMessage(message, handler);

void
BWindow::Minimize(minimize)
	INPUT:
		bool minimize;
	CODE:
		// item 0: THIS
		// item 1: minimize
		
		THIS->Minimize(minimize);

void
BWindow::DoZoom()
	CODE:
		// item 0: THIS
		
		THIS->Zoom();

void
BWindow::SetZoomLimits(maxWidth, maxHeight)
	INPUT:
		float maxWidth;
		float maxHeight;
	CODE:
		// item 0: THIS
		// item 1: maxWidth
		// item 2: maxHeight
		
		THIS->SetZoomLimits(maxWidth, maxHeight);

void
BWindow::SetPulseRate(microseconds)
	INPUT:
		bigtime_t microseconds;
	CODE:
		// item 0: THIS
		// item 1: microseconds
		
		THIS->SetPulseRate(microseconds);

bigtime_t
BWindow::PulseRate()
	INIT:
		bigtime_t retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->PulseRate();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::AddShortcut(key, modifiers, message)
	INPUT:
		uint32 key;
		uint32 modifiers;
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: key
		// item 2: modifiers
		// item 3: message
		
		THIS->AddShortcut(key, modifiers, message);

void
BWindow::AddShortcutWithTarget(key, modifiers, message, target)
	INPUT:
		uint32 key;
		uint32 modifiers;
		BMessage* message;
		BHandler* target;
	CODE:
		// item 0: THIS
		// item 1: key
		// item 2: modifiers
		// item 3: message
		// item 4: target
		
		THIS->AddShortcut(key, modifiers, message, target);

void
BWindow::RemoveShortcut(key, modifiers)
	INPUT:
		uint32 key;
		uint32 modifiers;
	CODE:
		// item 0: THIS
		// item 1: key
		// item 2: modifiers
		
		THIS->RemoveShortcut(key, modifiers);

void
BWindow::SetDefaultButton(button)
	INPUT:
		BButton* button;
	CODE:
		// item 0: THIS
		// item 1: button
		
		THIS->SetDefaultButton(button);

SV*
BWindow::DefaultButton()
	INIT:
		BButton* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DefaultButton();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Button", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BWindow::NeedsUpdate()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->NeedsUpdate();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::UpdateIfNeeded()
	CODE:
		// item 0: THIS
		
		THIS->UpdateIfNeeded();

SV*
BWindow::FindView(viewName)
	INPUT:
		const char* viewName;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: viewName
		
		retval = THIS->FindView(viewName);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BWindow::FindViewAtPoint(point)
	INPUT:
		BPoint point;
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->FindView(point);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BWindow::CurrentFocus()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->CurrentFocus();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", true);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BWindow::Activate(...)
	INIT:
		bool flag = true;
	CODE:
		// item 0: THIS
		// item 1: flag
		if (items > 1) {
			flag = SvTRUE(ST(1));
		}
		
		THIS->Activate(flag);

SV*
BWindow::ConvertPointToScreen(windowPoint)
	INPUT:
		BPoint windowPoint;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: windowPoint
		
		retval = THIS->ConvertToScreen(windowPoint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BWindow::ConvertPointFromScreen(windowPoint)
	INPUT:
		BPoint windowPoint;
	INIT:
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: windowPoint
		
		retval = THIS->ConvertFromScreen(windowPoint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BWindow::ConvertRectToScreen(windowRect)
	INPUT:
		BRect windowRect;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: windowRect
		
		retval = THIS->ConvertToScreen(windowRect);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BWindow::ConvertRectFromScreen(windowRect)
	INPUT:
		BRect windowRect;
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: windowRect
		
		retval = THIS->ConvertFromScreen(windowRect);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BWindow::MoveBy(horizontal, vertical)
	INPUT:
		float horizontal;
		float vertical;
	CODE:
		// item 0: THIS
		// item 1: horizontal
		// item 2: vertical
		
		THIS->MoveBy(horizontal, vertical);

void
BWindow::MoveTo(x, y)
	INPUT:
		float x;
		float y;
	CODE:
		// item 0: THIS
		// item 1: x
		// item 2: y
		
		THIS->MoveTo(x, y);

void
BWindow::MoveToPoint(where)
	INPUT:
		BPoint where;
	CODE:
		// item 0: THIS
		// item 1: where
		
		THIS->MoveTo(where);

void
BWindow::ResizeBy(horizontal, vertical)
	INPUT:
		float horizontal;
		float vertical;
	CODE:
		// item 0: THIS
		// item 1: horizontal
		// item 2: vertical
		
		THIS->ResizeBy(horizontal, vertical);

void
BWindow::ResizeTo(width, height)
	INPUT:
		float width;
		float height;
	CODE:
		// item 0: THIS
		// item 1: width
		// item 2: height
		
		THIS->ResizeTo(width, height);

void
BWindow::CenterIn(rect)
	INPUT:
		BRect rect;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		THIS->CenterIn(rect);

void
BWindow::CenterOnScreen()
	CODE:
		// item 0: THIS
		
		THIS->CenterOnScreen();

void
BWindow::Show()
	CODE:
		// item 0: THIS
		
		THIS->Show();

void
BWindow::Hide()
	CODE:
		// item 0: THIS
		
		THIS->Hide();

bool
BWindow::IsHidden()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsHidden();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BWindow::IsMinimized()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsMinimized();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::Flush()
	CODE:
		// item 0: THIS
		
		THIS->Flush();

void
BWindow::Sync()
	CODE:
		// item 0: THIS
		
		THIS->Sync();

bool
BWindow::SendBehind(window)
	INPUT:
		BWindow* window;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: window
		
		retval = THIS->SendBehind(window);
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
BWindow::DisableUpdates()
	CODE:
		// item 0: THIS
		
		THIS->DisableUpdates();

void
BWindow::EnableUpdates()
	CODE:
		// item 0: THIS
		
		THIS->EnableUpdates();

void
BWindow::BeginViewTransaction()
	CODE:
		// item 0: THIS
		
		THIS->BeginViewTransaction();

void
BWindow::EndViewTransaction()
	CODE:
		// item 0: THIS
		
		THIS->EndViewTransaction();

bool
BWindow::InViewTransaction()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->InViewTransaction();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BWindow::Bounds()
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
BWindow::Frame()
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
BWindow::DecoratorFrame()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->DecoratorFrame();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

const char*
BWindow::Title()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Title();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::SetTitle(newTitle)
	INPUT:
		const char* newTitle;
	CODE:
		// item 0: THIS
		// item 1: newTitle
		
		THIS->SetTitle(newTitle);

bool
BWindow::IsFront()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFront();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BWindow::IsActive()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsActive();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::SetKeyMenuBar(bar)
	INPUT:
		BMenuBar* bar;
	CODE:
		// item 0: THIS
		// item 1: bar
		
		THIS->SetKeyMenuBar(bar);

SV*
BWindow::KeyMenuBar()
	INIT:
		BMenuBar* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->KeyMenuBar();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::MenuBar", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BWindow::SetSizeLimits(minWidth, maxWidth, minHeight, maxHeight)
	INPUT:
		float minWidth;
		float maxWidth;
		float minHeight;
		float maxHeight;
	CODE:
		// item 0: THIS
		// item 1: minWidth
		// item 2: maxWidth
		// item 3: minHeight
		// item 4: maxHeight
		
		THIS->SetSizeLimits(minWidth, maxWidth, minHeight, maxHeight);

void
BWindow::GetSizeLimits()
	INIT:
		float minWidth;
		float maxWidth;
		float minHeight;
		float maxHeight;
		SV* minWidth_sv = newSV(0);	// retcount > 1
		SV* maxWidth_sv = newSV(0);	// retcount > 1
		SV* minHeight_sv = newSV(0);	// retcount > 1
		SV* maxHeight_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetSizeLimits(&minWidth, &maxWidth, &minHeight, &maxHeight);
		sv_setnv(minWidth_sv, (double)minWidth);
		sv_setnv(maxWidth_sv, (double)maxWidth);
		sv_setnv(minHeight_sv, (double)minHeight);
		sv_setnv(maxHeight_sv, (double)maxHeight);
		
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(minWidth_sv));
		PUSHs(sv_2mortal(maxWidth_sv));
		PUSHs(sv_2mortal(minHeight_sv));
		PUSHs(sv_2mortal(maxHeight_sv));

void
BWindow::UpdateSizeLimits()
	CODE:
		// item 0: THIS
		
		THIS->UpdateSizeLimits();

bool
BWindow::SetDecoratorSettings(settings)
	INPUT:
		BMessage settings;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: settings
		
		retval = THIS->SetDecoratorSettings(settings);
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

SV*
BWindow::GetDecoratorSettings()
	INIT:
		BMessage* settings;
		status_t retval;
		SV* error_sv;
		SV* settings_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->GetDecoratorSettings(settings);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		settings_sv = create_perl_object((void*)settings, "Haiku::Message", false);
		DUMPME(1,settings_sv);
		RETVAL = newSVsv(settings_sv);
		SvREFCNT_dec(settings_sv);
	OUTPUT:
		RETVAL

void
BWindow::SetWorkspaces(workspaces)
	INPUT:
		uint32 workspaces;
	CODE:
		// item 0: THIS
		// item 1: workspaces
		
		THIS->SetWorkspaces(workspaces);

uint32
BWindow::Workspaces()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Workspaces();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BWindow::LastMouseMovedView()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->LastMouseMovedView();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BWindow::ResolveSpecifier(message, index, specifier, form, property)
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
BWindow::GetSupportedSuites(data)
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
BWindow::AddToSubset(window)
	INPUT:
		BWindow* window;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: window
		
		retval = THIS->AddToSubset(window);
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
BWindow::RemoveFromSubset(window)
	INPUT:
		BWindow* window;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: window
		
		retval = THIS->RemoveFromSubset(window);
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
BWindow::SetType(type)
	INPUT:
		window_type type;
	CODE:
		// item 0: THIS
		// item 1: type
		
		THIS->SetType(type);

window_type
BWindow::Type()
	INIT:
		window_type retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Type();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::SetLook(look)
	INPUT:
		window_look look;
	CODE:
		// item 0: THIS
		// item 1: look
		
		THIS->SetLook(look);

window_look
BWindow::Look()
	INIT:
		window_look retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Look();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::SetFeel(feel)
	INPUT:
		window_feel feel;
	CODE:
		// item 0: THIS
		// item 1: feel
		
		THIS->SetFeel(feel);

window_feel
BWindow::Feel()
	INIT:
		window_feel retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Feel();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BWindow::SetFlags(flags)
	INPUT:
		uint32 flags;
	CODE:
		// item 0: THIS
		// item 1: flags
		
		THIS->SetFlags(flags);

uint32
BWindow::Flags()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Flags();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BWindow::IsFloating()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFloating();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BWindow::IsModal()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsModal();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BWindow::SetWindowAlignment(mode, h, ...)
	INPUT:
		window_alignment mode;
		int32 h;
	INIT:
		int32 hOffset = 0;
		int32 width = 0;
		int32 widthOffset = 0;
		int32 v = 0;
		int32 vOffset = 0;
		int32 height = 0;
		int32 heightOffset = 0;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: mode
		// item 2: h
		// item 3: hOffset
		if (items > 3) {
			hOffset = (int32)SvIV(ST(3));
		}
		// item 4: width
		if (items > 4) {
			width = (int32)SvIV(ST(4));
		}
		// item 5: widthOffset
		if (items > 5) {
			widthOffset = (int32)SvIV(ST(5));
		}
		// item 6: v
		if (items > 6) {
			v = (int32)SvIV(ST(6));
		}
		// item 7: vOffset
		if (items > 7) {
			vOffset = (int32)SvIV(ST(7));
		}
		// item 8: height
		if (items > 8) {
			height = (int32)SvIV(ST(8));
		}
		// item 9: heightOffset
		if (items > 9) {
			heightOffset = (int32)SvIV(ST(9));
		}
		
		retval = THIS->SetWindowAlignment(mode, h, hOffset, width, widthOffset, v, vOffset, height, heightOffset);
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
BWindow::GetWindowAlignment()
	INIT:
		window_alignment mode;
		int32 h;
		int32 hOffset = 0;
		int32 width;
		int32 widthOffset = 0;
		int32 v;
		int32 vOffset = 0;
		int32 height;
		int32 heightOffset = 0;
		status_t retval;
		SV* error_sv;
		SV* mode_sv = newSV(0);	// retcount > 1
		SV* h_sv = newSV(0);	// retcount > 1
		SV* hOffset_sv = newSV(0);	// retcount > 1
		SV* width_sv = newSV(0);	// retcount > 1
		SV* widthOffset_sv = newSV(0);	// retcount > 1
		SV* v_sv = newSV(0);	// retcount > 1
		SV* vOffset_sv = newSV(0);	// retcount > 1
		SV* height_sv = newSV(0);	// retcount > 1
		SV* heightOffset_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		retval = THIS->GetWindowAlignment(&mode, &h, &hOffset, &width, &widthOffset, &v, &vOffset, &height, &heightOffset);
		sv_setiv(mode_sv, (IV)mode);
		sv_setiv(h_sv, (IV)h);
		sv_setiv(hOffset_sv, (IV)hOffset);
		sv_setiv(width_sv, (IV)width);
		sv_setiv(widthOffset_sv, (IV)widthOffset);
		sv_setiv(v_sv, (IV)v);
		sv_setiv(vOffset_sv, (IV)vOffset);
		sv_setiv(height_sv, (IV)height);
		sv_setiv(heightOffset_sv, (IV)heightOffset);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		EXTEND(SP, 9);
		PUSHs(sv_2mortal(mode_sv));
		PUSHs(sv_2mortal(h_sv));
		PUSHs(sv_2mortal(hOffset_sv));
		PUSHs(sv_2mortal(width_sv));
		PUSHs(sv_2mortal(widthOffset_sv));
		PUSHs(sv_2mortal(v_sv));
		PUSHs(sv_2mortal(vOffset_sv));
		PUSHs(sv_2mortal(height_sv));
		PUSHs(sv_2mortal(heightOffset_sv));

void
BWindow::Run()
	CODE:
		// item 0: THIS
		
		THIS->Run();

void
BWindow::InvalidateLayout(...)
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
BWindow::MessageReceived(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		must_not_delete_cpp_object(ST(1), true);
		
		THIS->BWindow::MessageReceived(message);

void
BWindow::FrameMoved(newPosition)
	INPUT:
		BPoint newPosition;
	CODE:
		// item 0: THIS
		// item 1: newPosition
		
		THIS->BWindow::FrameMoved(newPosition);

void
BWindow::WorkspacesChanged(oldWorkspaces, newWorkspaces)
	INPUT:
		uint32 oldWorkspaces;
		uint32 newWorkspaces;
	CODE:
		// item 0: THIS
		// item 1: oldWorkspaces
		// item 2: newWorkspaces
		
		THIS->BWindow::WorkspacesChanged(oldWorkspaces, newWorkspaces);

void
BWindow::WorkspaceActivated(workspaces, state)
	INPUT:
		int32 workspaces;
		bool state;
	CODE:
		// item 0: THIS
		// item 1: workspaces
		// item 2: state
		
		THIS->BWindow::WorkspaceActivated(workspaces, state);

void
BWindow::FrameResized(newWidth, newHeight)
	INPUT:
		float newWidth;
		float newHeight;
	CODE:
		// item 0: THIS
		// item 1: newWidth
		// item 2: newHeight
		
		THIS->BWindow::FrameResized(newWidth, newHeight);

void
BWindow::Zoom(origin, width, height)
	INPUT:
		BPoint origin;
		float width;
		float height;
	CODE:
		// item 0: THIS
		// item 1: origin
		// item 2: width
		// item 3: height
		
		THIS->BWindow::Zoom(origin, width, height);

void
BWindow::ScreenChanged(screenSize, format)
	INPUT:
		BRect screenSize;
		color_space format;
	CODE:
		// item 0: THIS
		// item 1: screenSize
		// item 2: format
		
		THIS->BWindow::ScreenChanged(screenSize, format);

void
BWindow::MenusBeginning()
	CODE:
		// item 0: THIS
		
		THIS->BWindow::MenusBeginning();

void
BWindow::MenusEnded()
	CODE:
		// item 0: THIS
		
		THIS->BWindow::MenusEnded();

void
BWindow::WindowActivated(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->BWindow::WindowActivated(state);

bool
BWindow::QuitRequested()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->BWindow::QuitRequested();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
B_UNTYPED_WINDOW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNTYPED_WINDOW);
		dualize(RETVAL, "B_UNTYPED_WINDOW");
	OUTPUT:
		RETVAL

SV*
B_TITLED_WINDOW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TITLED_WINDOW);
		dualize(RETVAL, "B_TITLED_WINDOW");
	OUTPUT:
		RETVAL

SV*
B_MODAL_WINDOW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MODAL_WINDOW);
		dualize(RETVAL, "B_MODAL_WINDOW");
	OUTPUT:
		RETVAL

SV*
B_DOCUMENT_WINDOW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DOCUMENT_WINDOW);
		dualize(RETVAL, "B_DOCUMENT_WINDOW");
	OUTPUT:
		RETVAL

SV*
B_BORDERED_WINDOW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BORDERED_WINDOW);
		dualize(RETVAL, "B_BORDERED_WINDOW");
	OUTPUT:
		RETVAL

SV*
B_FLOATING_WINDOW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FLOATING_WINDOW);
		dualize(RETVAL, "B_FLOATING_WINDOW");
	OUTPUT:
		RETVAL

SV*
B_BORDERED_WINDOW_LOOK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BORDERED_WINDOW_LOOK);
		dualize(RETVAL, "B_BORDERED_WINDOW_LOOK");
	OUTPUT:
		RETVAL

SV*
B_NO_BORDER_WINDOW_LOOK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_BORDER_WINDOW_LOOK);
		dualize(RETVAL, "B_NO_BORDER_WINDOW_LOOK");
	OUTPUT:
		RETVAL

SV*
B_TITLED_WINDOW_LOOK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TITLED_WINDOW_LOOK);
		dualize(RETVAL, "B_TITLED_WINDOW_LOOK");
	OUTPUT:
		RETVAL

SV*
B_DOCUMENT_WINDOW_LOOK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DOCUMENT_WINDOW_LOOK);
		dualize(RETVAL, "B_DOCUMENT_WINDOW_LOOK");
	OUTPUT:
		RETVAL

SV*
B_MODAL_WINDOW_LOOK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MODAL_WINDOW_LOOK);
		dualize(RETVAL, "B_MODAL_WINDOW_LOOK");
	OUTPUT:
		RETVAL

SV*
B_FLOATING_WINDOW_LOOK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FLOATING_WINDOW_LOOK);
		dualize(RETVAL, "B_FLOATING_WINDOW_LOOK");
	OUTPUT:
		RETVAL

SV*
B_NORMAL_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NORMAL_WINDOW_FEEL);
		dualize(RETVAL, "B_NORMAL_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_MODAL_SUBSET_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MODAL_SUBSET_WINDOW_FEEL);
		dualize(RETVAL, "B_MODAL_SUBSET_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_MODAL_APP_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MODAL_APP_WINDOW_FEEL);
		dualize(RETVAL, "B_MODAL_APP_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_MODAL_ALL_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MODAL_ALL_WINDOW_FEEL);
		dualize(RETVAL, "B_MODAL_ALL_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_FLOATING_SUBSET_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FLOATING_SUBSET_WINDOW_FEEL);
		dualize(RETVAL, "B_FLOATING_SUBSET_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_FLOATING_APP_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FLOATING_APP_WINDOW_FEEL);
		dualize(RETVAL, "B_FLOATING_APP_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_FLOATING_ALL_WINDOW_FEEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FLOATING_ALL_WINDOW_FEEL);
		dualize(RETVAL, "B_FLOATING_ALL_WINDOW_FEEL");
	OUTPUT:
		RETVAL

SV*
B_BYTE_ALIGNMENT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BYTE_ALIGNMENT);
		dualize(RETVAL, "B_BYTE_ALIGNMENT");
	OUTPUT:
		RETVAL

SV*
B_PIXEL_ALIGNMENT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PIXEL_ALIGNMENT);
		dualize(RETVAL, "B_PIXEL_ALIGNMENT");
	OUTPUT:
		RETVAL

SV*
B_NOT_MOVABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_MOVABLE);
		dualize(RETVAL, "B_NOT_MOVABLE");
	OUTPUT:
		RETVAL

SV*
B_NOT_CLOSABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_CLOSABLE);
		dualize(RETVAL, "B_NOT_CLOSABLE");
	OUTPUT:
		RETVAL

SV*
B_NOT_ZOOMABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_ZOOMABLE);
		dualize(RETVAL, "B_NOT_ZOOMABLE");
	OUTPUT:
		RETVAL

SV*
B_NOT_MINIMIZABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_MINIMIZABLE);
		dualize(RETVAL, "B_NOT_MINIMIZABLE");
	OUTPUT:
		RETVAL

SV*
B_NOT_RESIZABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_RESIZABLE);
		dualize(RETVAL, "B_NOT_RESIZABLE");
	OUTPUT:
		RETVAL

SV*
B_NOT_H_RESIZABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_H_RESIZABLE);
		dualize(RETVAL, "B_NOT_H_RESIZABLE");
	OUTPUT:
		RETVAL

SV*
B_NOT_V_RESIZABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_V_RESIZABLE);
		dualize(RETVAL, "B_NOT_V_RESIZABLE");
	OUTPUT:
		RETVAL

SV*
B_AVOID_FRONT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_AVOID_FRONT);
		dualize(RETVAL, "B_AVOID_FRONT");
	OUTPUT:
		RETVAL

SV*
B_AVOID_FOCUS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_AVOID_FOCUS);
		dualize(RETVAL, "B_AVOID_FOCUS");
	OUTPUT:
		RETVAL

SV*
B_WILL_ACCEPT_FIRST_CLICK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WILL_ACCEPT_FIRST_CLICK);
		dualize(RETVAL, "B_WILL_ACCEPT_FIRST_CLICK");
	OUTPUT:
		RETVAL

SV*
B_OUTLINE_RESIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OUTLINE_RESIZE);
		dualize(RETVAL, "B_OUTLINE_RESIZE");
	OUTPUT:
		RETVAL

SV*
B_NO_WORKSPACE_ACTIVATION()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_WORKSPACE_ACTIVATION);
		dualize(RETVAL, "B_NO_WORKSPACE_ACTIVATION");
	OUTPUT:
		RETVAL

SV*
B_NOT_ANCHORED_ON_ACTIVATE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NOT_ANCHORED_ON_ACTIVATE);
		dualize(RETVAL, "B_NOT_ANCHORED_ON_ACTIVATE");
	OUTPUT:
		RETVAL

SV*
B_ASYNCHRONOUS_CONTROLS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ASYNCHRONOUS_CONTROLS);
		dualize(RETVAL, "B_ASYNCHRONOUS_CONTROLS");
	OUTPUT:
		RETVAL

SV*
B_QUIT_ON_WINDOW_CLOSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_QUIT_ON_WINDOW_CLOSE);
		dualize(RETVAL, "B_QUIT_ON_WINDOW_CLOSE");
	OUTPUT:
		RETVAL

SV*
B_SAME_POSITION_IN_ALL_WORKSPACES()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SAME_POSITION_IN_ALL_WORKSPACES);
		dualize(RETVAL, "B_SAME_POSITION_IN_ALL_WORKSPACES");
	OUTPUT:
		RETVAL

SV*
B_AUTO_UPDATE_SIZE_LIMITS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_AUTO_UPDATE_SIZE_LIMITS);
		dualize(RETVAL, "B_AUTO_UPDATE_SIZE_LIMITS");
	OUTPUT:
		RETVAL

SV*
B_CLOSE_ON_ESCAPE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CLOSE_ON_ESCAPE);
		dualize(RETVAL, "B_CLOSE_ON_ESCAPE");
	OUTPUT:
		RETVAL

SV*
B_NO_SERVER_SIDE_WINDOW_MODIFIERS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_SERVER_SIDE_WINDOW_MODIFIERS);
		dualize(RETVAL, "B_NO_SERVER_SIDE_WINDOW_MODIFIERS");
	OUTPUT:
		RETVAL

SV*
B_CURRENT_WORKSPACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CURRENT_WORKSPACE);
		dualize(RETVAL, "B_CURRENT_WORKSPACE");
	OUTPUT:
		RETVAL

SV*
B_ALL_WORKSPACES()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALL_WORKSPACES);
		dualize(RETVAL, "B_ALL_WORKSPACES");
	OUTPUT:
		RETVAL

bool
BWindow::operator_eq(object, swap)
	INPUT:
		BWindow* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BWindow::operator_ne(object, swap)
	INPUT:
		BWindow* object;
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
		get_sv("Haiku::Window::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Window::()", XS_Haiku__InterfaceKit_nil, file);

