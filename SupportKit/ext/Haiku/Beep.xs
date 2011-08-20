#
# Automatically generated file
#

MODULE = Haiku::SupportKit	PACKAGE = Haiku::Beep

PROTOTYPES: DISABLE

bool
beep()
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		retval = beep();
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
system_beep(eventName)
	INPUT:
		const char* eventName;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: eventName
		
		retval = system_beep(eventName);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
add_system_beep_event(eventName, ...)
	INPUT:
		const char* eventName;
	INIT:
		uint32 flags = 0;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: eventName
		// item 1: flags
		if (items > 1) {
			flags = (uint32)SvUV(ST(1));
		}
		
		retval = add_system_beep_event(eventName, flags);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::SupportKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__SupportKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Beep::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Beep::()", XS_Haiku__SupportKit_nil, file);

