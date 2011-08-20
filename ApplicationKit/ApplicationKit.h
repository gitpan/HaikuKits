/*
 * Automatically generated file
 */
 
#include <Application.h>
#include <Clipboard.h>
#include <Cursor.h>
#include <Handler.h>
#include <Invoker.h>
#include <Looper.h>
#include <Message.h>
#include <Messenger.h>

// comment this out to disallow debugging
#define DEBUGOK

#ifdef DEBUGOK
#define DEBUGME(LEVEL, PATTERN, ...) debug_me(LEVEL, __FILE__, __LINE__, PATTERN, ##__VA_ARGS__)
#else
#define DEBUGME(LEVEL, PATTERN, ...)
#endif

#ifdef DEBUGOK
#define DUMPME(LEVEL, ARG) dump_me(LEVEL, __FILE__, __LINE__, ARG)
#else
#define DUMPME(LEVEL, ARG)
#endif

int debug_level = 0;

void set_up_debug_sv();
void debug_me(int level, const char* file, int line, const char* pattern, ...);
void dump_me(int level, const char* file, int line, SV* arg);

struct object_link_data {
	void* cpp_object;
	SV*   perl_object;
	bool  can_delete_cpp_object;
	const char* perl_class_name;
};

SV* create_perl_object(void* cpp_obj_address, const char* perl_class_name, bool must_not_delete = false);
object_link_data* get_link_data(SV* perl_obj);
void unlink_perl_object(SV* perl_obj);
void must_not_delete_cpp_object(SV* perl_obj, bool must_not_delete);
void* get_cpp_object(SV* perl_obj);
bool can_delete_cpp_object(SV* perl_obj);

void dualize(SV* arg, const char* string);

