/*
 * Automatically generated file
 */

#include "CustomTextView.h"

Custom_BTextView::Custom_BTextView(BRect frame, const char* name, BRect textRect, uint32 resizingMode, uint32 flags)
	: BTextView(frame, name, textRect, resizingMode, flags) {}

Custom_BTextView::Custom_BTextView(BRect frame, const char* name, BRect textRect, BFont* font, rgb_color* color, uint32 resizingMode, uint32 flags)
	: BTextView(frame, name, textRect, font, color, resizingMode, flags) {}

Custom_BTextView::Custom_BTextView(const char* name, uint32 flags)
	: BTextView(name, flags) {}

Custom_BTextView::Custom_BTextView(const char* name, BFont* font, rgb_color* color, uint32 flags)
	: BTextView(name, font, color, flags) {}

Custom_BTextView::Custom_BTextView(BMessage* archive)
	: BTextView(archive) {}

Custom_BTextView::~Custom_BTextView() {
	DEBUGME(2,"Deleting Custom_BTextView");
	// if the perl object was previously unlinked,
	// we no longer need to keep the data around
	if (perl_link_data->perl_object == NULL)
		delete perl_link_data;
}

void Custom_BTextView::AttachedToWindow() {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::AttachedToWindow();
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
		
		call_method("AttachedToWindow", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::AttachedToWindow

void Custom_BTextView::DetachedFromWindow() {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::DetachedFromWindow();
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
		
		call_method("DetachedFromWindow", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::DetachedFromWindow

void Custom_BTextView::Draw(BRect updateRect) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::Draw(updateRect);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* updateRect_sv;
		
		updateRect_sv = sv_newmortal();
		sv_setsv(updateRect_sv, create_perl_object((void*)&updateRect, "Haiku::Rect"));
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(updateRect_sv);
		
		PUTBACK;
		
		call_method("Draw", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::Draw

void Custom_BTextView::MouseDown(BPoint point) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::MouseDown(point);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* point_sv;
		
		point_sv = sv_newmortal();
		sv_setsv(point_sv, create_perl_object((void*)&point, "Haiku::Point"));
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(point_sv);
		
		PUTBACK;
		
		call_method("MouseDown", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::MouseDown

void Custom_BTextView::MouseUp(BPoint point) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::MouseUp(point);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* point_sv;
		
		point_sv = sv_newmortal();
		sv_setsv(point_sv, create_perl_object((void*)&point, "Haiku::Point"));
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(point_sv);
		
		PUTBACK;
		
		call_method("MouseUp", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::MouseUp

void Custom_BTextView::MouseMoved(BPoint point, uint32 transit, BMessage* message) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::MouseMoved(point, transit, message);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* point_sv;
		SV* transit_sv;
		SV* message_sv;
		
		point_sv = sv_newmortal();
		sv_setsv(point_sv, create_perl_object((void*)&point, "Haiku::Point"));
		transit_sv = sv_newmortal();
		sv_setuv(transit_sv, (UV)transit);
		message_sv = sv_newmortal();
		sv_setsv(message_sv, create_perl_object((void*)message, "Haiku::Message"));
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 4);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(point_sv);
		XPUSHs(transit_sv);
		XPUSHs(message_sv);
		
		PUTBACK;
		
		call_method("MouseMoved", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::MouseMoved

void Custom_BTextView::WindowActivated(bool state) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::WindowActivated(state);
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
} // Custom_BTextView::WindowActivated

void Custom_BTextView::KeyDown(const char* bytes, int32 numBytes) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::KeyDown(bytes, numBytes);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* bytes_sv;
		
		bytes_sv = sv_newmortal();
		bytes_sv = newSVpvn((char*)bytes, (STRLEN)numBytes);
		if (is_utf8_string((const U8*)bytes, (STRLEN)numBytes)) {
			SvUTF8_on(bytes_sv);
		}
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(bytes_sv);
		
		PUTBACK;
		
		call_method("KeyDown", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::KeyDown

void Custom_BTextView::Pulse() {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::Pulse();
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
		
		call_method("Pulse", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::Pulse

void Custom_BTextView::FrameResized(float newWidth, float newHeight) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::FrameResized(newWidth, newHeight);
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
} // Custom_BTextView::FrameResized

void Custom_BTextView::MessageReceived(BMessage* message) {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::MessageReceived(message);
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
} // Custom_BTextView::MessageReceived

void Custom_BTextView::AllAttached() {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::AllAttached();
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
		
		call_method("AllAttached", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::AllAttached

void Custom_BTextView::AllDetached() {
	if (perl_link_data->perl_object == NULL) {
		return BTextView::AllDetached();
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
		
		call_method("AllDetached", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BTextView::AllDetached

