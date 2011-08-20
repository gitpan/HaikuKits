#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::stat_beos_time

PROTOTYPES: DISABLE

MODULE = Haiku::StorageKit	PACKAGE = Haiku::stat_beos_time::tv_sec

SV*
FETCH(tie_obj)
		SV* tie_obj;
	INIT:
		SV* cpp_obj_sv;
		stat_beos_time* cpp_obj;
	CODE:
		RETVAL = newSV(0);
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (stat_beos_time*)SvIV(cpp_obj_sv);
		sv_setiv(RETVAL, (IV)cpp_obj->tv_sec);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	INIT:
		SV* cpp_obj_sv;
		stat_beos_time* cpp_obj;
	CODE:
		cpp_obj_sv = SvRV(tie_obj);
		cpp_obj = (stat_beos_time*)SvIV(cpp_obj_sv);
		cpp_obj->tv_sec = (time_t)SvIV(value);

MODULE = Haiku::StorageKit	PACKAGE = Haiku::stat_beos_time

# Some structs must be prefaced with the keyword 'struct' or gcc 
# complains. Unfortunately, if you put 'struct' in the XSub def,
# xsubpp can't parse the type, and if you don't, xsubpp complains
# about the non-'struct' version not being in the typemap. So we
# get the THIS variable ourselves in the property XSub instead of
# prefixing the XSub name as 'stat_beos_time::tv_sec'

SV*
tv_sec(THIS)
	INPUT:
		stat_beos_time* THIS;
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
		tie_obj_stash = gv_stashpv("Haiku::stat_beos_time::tv_sec", TRUE);
		sv_bless(tie_obj, tie_obj_stash);
		
		// tie the blessed object to the RETVAL scalar
		sv_magic(RETVAL, tie_obj, PERL_MAGIC_tiedscalar, NULL, 0);
	OUTPUT:
		RETVAL

BOOT:
	CvFLAGS(get_cv("Haiku::stat_beos_time::tv_sec", TRUE)) |= CVf_LVALUE;

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::stat_beos_time::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::stat_beos_time::()", XS_Haiku__StorageKit_nil, file);

