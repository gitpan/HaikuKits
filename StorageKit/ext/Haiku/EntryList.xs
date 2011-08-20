#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::EntryList

PROTOTYPES: DISABLE

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::EntryList::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::EntryList::()", XS_Haiku__StorageKit_nil, file);

