#
# Automatically generated file
#

MODULE = Haiku::StorageKit	PACKAGE = Haiku::NodeMonitor

PROTOTYPES: DISABLE

bool
watch_volume_with_messenger(volume, flags, target)
	INPUT:
		dev_t volume;
		uint32 flags;
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: volume
		// item 1: flags
		// item 2: target
		
		retval = watch_volume(volume, flags, target);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
watch_volume(volume, flags, handler, ...)
	INPUT:
		dev_t volume;
		uint32 flags;
		const BHandler* handler;
	INIT:
		const BLooper* looper = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: volume
		// item 1: flags
		// item 2: handler
		// item 3: looper
		if (items > 3) {
			looper = (const BLooper*)get_cpp_object(ST(3));
		}
		
		retval = watch_volume(volume, flags, handler, looper);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
watch_node_with_messenger(node, flags, target)
	INPUT:
		const node_ref* node;
		uint32 flags;
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: node
		// item 1: flags
		// item 2: target
		
		retval = watch_node(node, flags, target);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
watch_node(node, flags, handler, ...)
	INPUT:
		const node_ref* node;
		uint32 flags;
		const BHandler* handler;
	INIT:
		const BLooper* looper = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: node
		// item 1: flags
		// item 2: handler
		// item 3: looper
		if (items > 3) {
			looper = (const BLooper*)get_cpp_object(ST(3));
		}
		
		retval = watch_node(node, flags, handler, looper);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
stop_watching_with_messenger(target)
	INPUT:
		BMessenger target;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: target
		
		retval = stop_watching(target);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

bool
stop_watching(handler, ...)
	INPUT:
		const BHandler* handler;
	INIT:
		const BLooper* looper = NULL;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: handler
		// item 1: looper
		if (items > 1) {
			looper = (const BLooper*)get_cpp_object(ST(1));
		}
		
		retval = stop_watching(handler, looper);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::StorageKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

SV*
B_STOP_WATCHING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STOP_WATCHING);
		dualize(RETVAL, "B_STOP_WATCHING");
	OUTPUT:
		RETVAL

SV*
B_WATCH_NAME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_NAME);
		dualize(RETVAL, "B_WATCH_NAME");
	OUTPUT:
		RETVAL

SV*
B_WATCH_STAT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_STAT);
		dualize(RETVAL, "B_WATCH_STAT");
	OUTPUT:
		RETVAL

SV*
B_WATCH_ATTR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_ATTR);
		dualize(RETVAL, "B_WATCH_ATTR");
	OUTPUT:
		RETVAL

SV*
B_WATCH_DIRECTORY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_DIRECTORY);
		dualize(RETVAL, "B_WATCH_DIRECTORY");
	OUTPUT:
		RETVAL

SV*
B_WATCH_ALL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_ALL);
		dualize(RETVAL, "B_WATCH_ALL");
	OUTPUT:
		RETVAL

SV*
B_WATCH_MOUNT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_MOUNT);
		dualize(RETVAL, "B_WATCH_MOUNT");
	OUTPUT:
		RETVAL

SV*
B_WATCH_INTERIM_STAT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WATCH_INTERIM_STAT);
		dualize(RETVAL, "B_WATCH_INTERIM_STAT");
	OUTPUT:
		RETVAL

SV*
B_ENTRY_CREATED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ENTRY_CREATED);
		dualize(RETVAL, "B_ENTRY_CREATED");
	OUTPUT:
		RETVAL

SV*
B_ENTRY_REMOVED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ENTRY_REMOVED);
		dualize(RETVAL, "B_ENTRY_REMOVED");
	OUTPUT:
		RETVAL

SV*
B_ENTRY_MOVED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ENTRY_MOVED);
		dualize(RETVAL, "B_ENTRY_MOVED");
	OUTPUT:
		RETVAL

SV*
B_STAT_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_CHANGED);
		dualize(RETVAL, "B_STAT_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_ATTR_CHANGED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ATTR_CHANGED);
		dualize(RETVAL, "B_ATTR_CHANGED");
	OUTPUT:
		RETVAL

SV*
B_DEVICE_MOUNTED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DEVICE_MOUNTED);
		dualize(RETVAL, "B_DEVICE_MOUNTED");
	OUTPUT:
		RETVAL

SV*
B_DEVICE_UNMOUNTED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DEVICE_UNMOUNTED);
		dualize(RETVAL, "B_DEVICE_UNMOUNTED");
	OUTPUT:
		RETVAL

SV*
B_ATTR_CREATED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ATTR_CREATED);
		dualize(RETVAL, "B_ATTR_CREATED");
	OUTPUT:
		RETVAL

SV*
B_ATTR_REMOVED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ATTR_REMOVED);
		dualize(RETVAL, "B_ATTR_REMOVED");
	OUTPUT:
		RETVAL

SV*
B_STAT_MODE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_MODE);
		dualize(RETVAL, "B_STAT_MODE");
	OUTPUT:
		RETVAL

SV*
B_STAT_UID()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_UID);
		dualize(RETVAL, "B_STAT_UID");
	OUTPUT:
		RETVAL

SV*
B_STAT_GID()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_GID);
		dualize(RETVAL, "B_STAT_GID");
	OUTPUT:
		RETVAL

SV*
B_STAT_SIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_SIZE);
		dualize(RETVAL, "B_STAT_SIZE");
	OUTPUT:
		RETVAL

SV*
B_STAT_ACCESS_TIME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_ACCESS_TIME);
		dualize(RETVAL, "B_STAT_ACCESS_TIME");
	OUTPUT:
		RETVAL

SV*
B_STAT_MODIFICATION_TIME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_MODIFICATION_TIME);
		dualize(RETVAL, "B_STAT_MODIFICATION_TIME");
	OUTPUT:
		RETVAL

SV*
B_STAT_CREATION_TIME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_CREATION_TIME);
		dualize(RETVAL, "B_STAT_CREATION_TIME");
	OUTPUT:
		RETVAL

SV*
B_STAT_CHANGE_TIME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_CHANGE_TIME);
		dualize(RETVAL, "B_STAT_CHANGE_TIME");
	OUTPUT:
		RETVAL

SV*
B_STAT_INTERIM_UPDATE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STAT_INTERIM_UPDATE);
		dualize(RETVAL, "B_STAT_INTERIM_UPDATE");
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__StorageKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::NodeMonitor::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::NodeMonitor::()", XS_Haiku__StorageKit_nil, file);

