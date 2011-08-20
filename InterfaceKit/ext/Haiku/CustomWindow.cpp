/*
 * Automatically generated file
 */

#include "CustomWindow.h"

Custom_BWindow::Custom_BWindow(BRect frame, const char* title, window_type type, uint32 flags, uint32 workspaces)
	: BWindow(frame, title, type, flags, workspaces) {}

Custom_BWindow::Custom_BWindow(BRect frame, const char* title, window_look look, window_feel feel, uint32 flags, uint32 workspaces)
	: BWindow(frame, title, look, feel, flags, workspaces) {}

Custom_BWindow::Custom_BWindow(BMessage* archive)
	: BWindow(archive) {}

Custom_BWindow::~Custom_BWindow() {
	DEBUGME(2,"Deleting Custom_BWindow");
	// if the perl object was previously unlinked,
	// we no longer need to keep the data around
	if (perl_link_data->perl_object == NULL)
		delete perl_link_data;
}

void Custom_BWindow::MessageReceived(BMessage* message) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::MessageReceived(message);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* message_sv;
		
		message_sv = sv_newmortal();
		sv_setsv(message_sv, create_perl_object((void*)message, "Haiku::Message", true));
		must_not_delete_cpp_object(message_sv, true);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(message_sv);
		
		PUTBACK;
		
		call_method("MessageReceived", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::MessageReceived

void Custom_BWindow::FrameMoved(BPoint newPosition) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::FrameMoved(newPosition);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* newPosition_sv;
		
		newPosition_sv = sv_newmortal();
		sv_setsv(newPosition_sv, create_perl_object((void*)&newPosition, "Haiku::Point"));
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(newPosition_sv);
		
		PUTBACK;
		
		call_method("FrameMoved", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::FrameMoved

void Custom_BWindow::WorkspacesChanged(uint32 oldWorkspaces, uint32 newWorkspaces) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::WorkspacesChanged(oldWorkspaces, newWorkspaces);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* oldWorkspaces_sv;
		SV* newWorkspaces_sv;
		
		oldWorkspaces_sv = sv_newmortal();
		sv_setuv(oldWorkspaces_sv, (UV)oldWorkspaces);
		newWorkspaces_sv = sv_newmortal();
		sv_setuv(newWorkspaces_sv, (UV)newWorkspaces);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 3);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(oldWorkspaces_sv);
		XPUSHs(newWorkspaces_sv);
		
		PUTBACK;
		
		call_method("WorkspacesChanged", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::WorkspacesChanged

void Custom_BWindow::WorkspaceActivated(int32 workspaces, bool state) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::WorkspaceActivated(workspaces, state);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* workspaces_sv;
		SV* state_sv;
		
		workspaces_sv = sv_newmortal();
		sv_setiv(workspaces_sv, (IV)workspaces);
		state_sv = sv_newmortal();
		state_sv = boolSV(state);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 3);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(workspaces_sv);
		XPUSHs(state_sv);
		
		PUTBACK;
		
		call_method("WorkspaceActivated", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::WorkspaceActivated

void Custom_BWindow::FrameResized(float newWidth, float newHeight) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::FrameResized(newWidth, newHeight);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* newWidth_sv;
		SV* newHeight_sv;
		
		newWidth_sv = sv_newmortal();
		sv_setnv(newWidth_sv, (double)newWidth);
		newHeight_sv = sv_newmortal();
		sv_setnv(newHeight_sv, (double)newHeight);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 3);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(newWidth_sv);
		XPUSHs(newHeight_sv);
		
		PUTBACK;
		
		call_method("FrameResized", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::FrameResized

void Custom_BWindow::Zoom(BPoint origin, float width, float height) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::Zoom(origin, width, height);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* origin_sv;
		SV* width_sv;
		SV* height_sv;
		
		origin_sv = sv_newmortal();
		sv_setsv(origin_sv, create_perl_object((void*)&origin, "Haiku::Point"));
		width_sv = sv_newmortal();
		sv_setnv(width_sv, (double)width);
		height_sv = sv_newmortal();
		sv_setnv(height_sv, (double)height);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 4);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(origin_sv);
		XPUSHs(width_sv);
		XPUSHs(height_sv);
		
		PUTBACK;
		
		call_method("Zoom", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::Zoom

void Custom_BWindow::ScreenChanged(BRect screenSize, color_space format) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::ScreenChanged(screenSize, format);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* screenSize_sv;
		SV* format_sv;
		
		screenSize_sv = sv_newmortal();
		sv_setsv(screenSize_sv, create_perl_object((void*)&screenSize, "Haiku::Rect"));
		format_sv = sv_newmortal();
		sv_setiv(format_sv, (IV)format);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 3);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(screenSize_sv);
		XPUSHs(format_sv);
		
		PUTBACK;
		
		call_method("ScreenChanged", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::ScreenChanged

void Custom_BWindow::MenusBeginning() {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::MenusBeginning();
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 1);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		
		PUTBACK;
		
		call_method("MenusBeginning", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::MenusBeginning

void Custom_BWindow::MenusEnded() {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::MenusEnded();
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 1);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		
		PUTBACK;
		
		call_method("MenusEnded", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::MenusEnded

void Custom_BWindow::WindowActivated(bool state) {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::WindowActivated(state);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* state_sv;
		
		state_sv = sv_newmortal();
		state_sv = boolSV(state);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(state_sv);
		
		PUTBACK;
		
		call_method("WindowActivated", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BWindow::WindowActivated

bool Custom_BWindow::QuitRequested() {
	if (perl_link_data->perl_object == NULL) {
		return BWindow::QuitRequested();
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		bool retval;
		SV* retval_sv;
		int perl_return_count;
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 1);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		
		PUTBACK;
		
		perl_return_count = call_method("QuitRequested", G_SCALAR);
		SPAGAIN;
		
		// need to add some real error checking here
		if (perl_return_count != 1)
			DEBUGME(4, "Got a bad number of returns from perl call: %d", perl_return_count);
		
		retval_sv = POPs;
		retval = SvTRUE(retval_sv);
		PUTBACK;
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
		
		return retval;
	}
} // Custom_BWindow::QuitRequested

