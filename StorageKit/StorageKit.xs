/*
 * Automatically generated file
 */
 
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

#undef Copy // this macro might interfere with function names

#include "StorageKit.cpp"
MODULE = Haiku::StorageKit	PACKAGE = Haiku::StorageKit

INCLUDE: ext/Haiku/EntryList.xs
INCLUDE: ext/Haiku/Query.xs
INCLUDE: ext/Haiku/FindDirectory.xs
INCLUDE: ext/Haiku/Mime.xs
INCLUDE: ext/Haiku/MimeType.xs
INCLUDE: ext/Haiku/NodeInfo.xs
INCLUDE: ext/Haiku/NodeMonitor.xs
INCLUDE: ext/Haiku/Path.xs
INCLUDE: ext/Haiku/Statable.xs
INCLUDE: ext/Haiku/Entry.xs
INCLUDE: ext/Haiku/entry_ref.xs
INCLUDE: ext/Haiku/Node.xs
INCLUDE: ext/Haiku/node_ref.xs
INCLUDE: ext/Haiku/Volume.xs
INCLUDE: ext/Haiku/VolumeRoster.xs
INCLUDE: ext/Haiku/dirent.xs
INCLUDE: ext/Haiku/stat_beos.xs
INCLUDE: ext/Haiku/stat_beos_time.xs
INCLUDE: ext/Haiku/stat.xs
INCLUDE: ext/Haiku/timespec.xs
INCLUDE: ext/Haiku/attr_info.xs

# since the XS included above probably changed it, force correct module
MODULE = Haiku::StorageKit	PACKAGE = Haiku::StorageKit

SV*
B_DEV_NAME_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DEV_NAME_LENGTH);
		dualize(RETVAL, "B_DEV_NAME_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_FILE_NAME_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FILE_NAME_LENGTH);
		dualize(RETVAL, "B_FILE_NAME_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_PATH_NAME_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PATH_NAME_LENGTH);
		dualize(RETVAL, "B_PATH_NAME_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_ATTR_NAME_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ATTR_NAME_LENGTH);
		dualize(RETVAL, "B_ATTR_NAME_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_MIME_TYPE_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MIME_TYPE_LENGTH);
		dualize(RETVAL, "B_MIME_TYPE_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_MAX_SYMLINKS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MAX_SYMLINKS);
		dualize(RETVAL, "B_MAX_SYMLINKS");
	OUTPUT:
		RETVAL

SV*
B_READ_ONLY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_READ_ONLY);
		dualize(RETVAL, "B_READ_ONLY");
	OUTPUT:
		RETVAL

SV*
B_WRITE_ONLY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WRITE_ONLY);
		dualize(RETVAL, "B_WRITE_ONLY");
	OUTPUT:
		RETVAL

SV*
B_READ_WRITE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_READ_WRITE);
		dualize(RETVAL, "B_READ_WRITE");
	OUTPUT:
		RETVAL

SV*
B_FAIL_IF_EXISTS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FAIL_IF_EXISTS);
		dualize(RETVAL, "B_FAIL_IF_EXISTS");
	OUTPUT:
		RETVAL

SV*
B_CREATE_FILE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CREATE_FILE);
		dualize(RETVAL, "B_CREATE_FILE");
	OUTPUT:
		RETVAL

SV*
B_ERASE_FILE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ERASE_FILE);
		dualize(RETVAL, "B_ERASE_FILE");
	OUTPUT:
		RETVAL

SV*
B_OPEN_AT_END()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPEN_AT_END);
		dualize(RETVAL, "B_OPEN_AT_END");
	OUTPUT:
		RETVAL

SV*
B_FILE_NODE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FILE_NODE);
		dualize(RETVAL, "B_FILE_NODE");
	OUTPUT:
		RETVAL

SV*
B_SYMLINK_NODE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SYMLINK_NODE);
		dualize(RETVAL, "B_SYMLINK_NODE");
	OUTPUT:
		RETVAL

SV*
B_DIRECTORY_NODE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DIRECTORY_NODE);
		dualize(RETVAL, "B_DIRECTORY_NODE");
	OUTPUT:
		RETVAL

SV*
B_ANY_NODE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ANY_NODE);
		dualize(RETVAL, "B_ANY_NODE");
	OUTPUT:
		RETVAL

MODULE = Haiku::StorageKit	PACKAGE = Haiku::StorageKit::DEBUG

SV*
FETCH(tie_obj)
		SV* tie_obj;
	CODE:
		RETVAL = newSViv(debug_level);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	CODE:
		debug_level = SvIV(value);
		
MODULE = Haiku::StorageKit	PACKAGE = Haiku::StorageKit

BOOT:
	set_up_debug_sv("Haiku::StorageKit::DEBUG");
