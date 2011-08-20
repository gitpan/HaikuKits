/*
 * Automatically generated file
 */

#include "CustomApplication.h"

Custom_BApplication::Custom_BApplication(const char* signature, status_t* error)
	: BApplication(signature, error) {}

Custom_BApplication::Custom_BApplication(BMessage* archive)
	: BApplication(archive) {}

Custom_BApplication::~Custom_BApplication() {
	DEBUGME(2,"Deleting Custom_BApplication");
	// if the perl object was previously unlinked,
	// we no longer need to keep the data around
	if (perl_link_data->perl_object == NULL)
		delete perl_link_data;
}

bool Custom_BApplication::QuitRequested() {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::QuitRequested();
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
} // Custom_BApplication::QuitRequested

void Custom_BApplication::Pulse() {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::Pulse();
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
} // Custom_BApplication::Pulse

void Custom_BApplication::ReadyToRun() {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::ReadyToRun();
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
		
		call_method("ReadyToRun", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BApplication::ReadyToRun

void Custom_BApplication::MessageReceived(BMessage* message) {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::MessageReceived(message);
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
} // Custom_BApplication::MessageReceived

void Custom_BApplication::ArgvReceived(int32 argc, char** argv) {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::ArgvReceived(argc, argv);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* argv_sv;
		AV* argv_sv_av;
		
		argv_sv = sv_newmortal();
		//Converting C array 'argv' to Perl arg 'argv_sv'
		argv_sv_av = newAV();
		for (int i = 0; i < argc; i++) {
			SV* element_sv = newSV(0);
			sv_setpv((SV*)element_sv, argv[i]);
			av_push(argv_sv_av, element_sv);
		}
		argv_sv = newRV_noinc((SV*) argv_sv_av);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(argv_sv);
		
		PUTBACK;
		
		call_method("ArgvReceived", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BApplication::ArgvReceived

void Custom_BApplication::AppActivated(bool active) {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::AppActivated(active);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* active_sv;
		
		active_sv = sv_newmortal();
		active_sv = boolSV(active);
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(active_sv);
		
		PUTBACK;
		
		call_method("AppActivated", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BApplication::AppActivated

void Custom_BApplication::RefsReceived(BMessage* message) {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::RefsReceived(message);
	}
	else {
		DUMPME(1,perl_link_data->perl_object);
		SV* message_sv;
		
		message_sv = sv_newmortal();
		sv_setsv(message_sv, create_perl_object((void*)message, "Haiku::Message"));
		
		be_app->LockLooper();	// lock before manipulating stack
		dSP;
		ENTER;
		SAVETMPS;
		//EXTEND(SP, 2);
		PUSHMARK(SP);
		
		XPUSHs(newRV_noinc((SV*)perl_link_data->perl_object));
		XPUSHs(message_sv);
		
		PUTBACK;
		
		call_method("RefsReceived", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BApplication::RefsReceived

void Custom_BApplication::AboutRequested() {
	if (perl_link_data->perl_object == NULL) {
		return BApplication::AboutRequested();
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
		
		call_method("AboutRequested", G_DISCARD);
		SPAGAIN;
		
		FREETMPS;
		LEAVE;
		be_app->UnlockLooper();	// unlock after manipulating stack
	}
} // Custom_BApplication::AboutRequested

