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

#include "InterfaceKit.cpp"
#include "ext/Haiku/CustomWindow.cpp"
#include "ext/Haiku/CustomTextView.cpp"

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::InterfaceKit

INCLUDE: ext/Haiku/Window.xs
INCLUDE: ext/Haiku/CustomWindow.xs
INCLUDE: ext/Haiku/Alert.xs
INCLUDE: ext/Haiku/View.xs
INCLUDE: ext/Haiku/Box.xs
INCLUDE: ext/Haiku/Control.xs
INCLUDE: ext/Haiku/Button.xs
INCLUDE: ext/Haiku/CheckBox.xs
INCLUDE: ext/Haiku/ColorControl.xs
INCLUDE: ext/Haiku/PictureButton.xs
INCLUDE: ext/Haiku/RadioButton.xs
INCLUDE: ext/Haiku/Slider.xs
INCLUDE: ext/Haiku/TextControl.xs
INCLUDE: ext/Haiku/ListView.xs
INCLUDE: ext/Haiku/OutlineListView.xs
INCLUDE: ext/Haiku/Menu.xs
INCLUDE: ext/Haiku/menu_info.xs
INCLUDE: ext/Haiku/MenuBar.xs
INCLUDE: ext/Haiku/PopUpMenu.xs
INCLUDE: ext/Haiku/MenuField.xs
INCLUDE: ext/Haiku/ScrollBar.xs
INCLUDE: ext/Haiku/ScrollView.xs
INCLUDE: ext/Haiku/StatusBar.xs
INCLUDE: ext/Haiku/StringView.xs
INCLUDE: ext/Haiku/TabView.xs
INCLUDE: ext/Haiku/Tab.xs
INCLUDE: ext/Haiku/TextView.xs
INCLUDE: ext/Haiku/CustomTextView.xs
INCLUDE: ext/Haiku/text_run.xs
INCLUDE: ext/Haiku/text_run_array.xs
INCLUDE: ext/Haiku/MenuItem.xs
INCLUDE: ext/Haiku/SeparatorItem.xs
INCLUDE: ext/Haiku/ListItem.xs
INCLUDE: ext/Haiku/StringItem.xs
INCLUDE: ext/Haiku/Font.xs
INCLUDE: ext/Haiku/unicode_block.xs
INCLUDE: ext/Haiku/edge_info.xs
INCLUDE: ext/Haiku/font_height.xs
INCLUDE: ext/Haiku/escapement_delta.xs
INCLUDE: ext/Haiku/font_cache_info.xs
INCLUDE: ext/Haiku/tuned_font_info.xs
INCLUDE: ext/Haiku/Picture.xs
INCLUDE: ext/Haiku/Point.xs
INCLUDE: ext/Haiku/Polygon.xs
INCLUDE: ext/Haiku/Rect.xs
INCLUDE: ext/Haiku/Screen.xs
INCLUDE: ext/Haiku/Shape.xs
INCLUDE: ext/Haiku/ShapeIterator.xs
INCLUDE: ext/Haiku/key_info.xs
INCLUDE: ext/Haiku/key_map.xs
INCLUDE: ext/Haiku/mouse_map.xs
INCLUDE: ext/Haiku/scroll_bar_info.xs
INCLUDE: ext/Haiku/pattern.xs
INCLUDE: ext/Haiku/rgb_color.xs
INCLUDE: ext/Haiku/color_map.xs
INCLUDE: ext/Haiku/overlay_rect_limits.xs
INCLUDE: ext/Haiku/overlay_restrictions.xs
INCLUDE: ext/Haiku/screen_id.xs

# since the XS included above probably changed it, force correct module
MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::InterfaceKit

bool
get_deskbar_frame(frame)
	INPUT:
		BRect frame;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: frame
		
		retval = get_deskbar_frame(&frame);
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
system_colors()
	INIT:
		const color_map* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		retval = system_colors();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::color_map", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
get_scroll_bar_info()
	INIT:
		scroll_bar_info info;
		status_t retval;
		SV* error_sv;
		SV* info_sv = newSV(0);	// retcount == 1
	CODE:
		retval = get_scroll_bar_info(&info);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		info_sv = create_perl_object((void*)&info, "Haiku::scroll_bar_info", false);
		DUMPME(1,info_sv);
		RETVAL = newSVsv(info_sv);
		SvREFCNT_dec(info_sv);
	OUTPUT:
		RETVAL

bool
set_scroll_bar_info(info)
	INPUT:
		scroll_bar_info* info;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: info
		
		retval = set_scroll_bar_info(info);
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

int32
get_mouse_type()
	INIT:
		int32 type;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_mouse_type(&type);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = type;
	OUTPUT:
		RETVAL

bool
set_mouse_type(type)
	INPUT:
		int32 type;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: type
		
		retval = set_mouse_type(type);
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
get_mouse_map()
	INIT:
		mouse_map map;
		status_t retval;
		SV* error_sv;
		SV* map_sv = newSV(0);	// retcount == 1
	CODE:
		retval = get_mouse_map(&map);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		map_sv = create_perl_object((void*)&map, "Haiku::mouse_map", false);
		DUMPME(1,map_sv);
		RETVAL = newSVsv(map_sv);
		SvREFCNT_dec(map_sv);
	OUTPUT:
		RETVAL

bool
set_mouse_map(map)
	INPUT:
		mouse_map* map;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: map
		
		retval = set_mouse_map(map);
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

bigtime_t
get_click_speed()
	INIT:
		bigtime_t speed;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_click_speed(&speed);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = speed;
	OUTPUT:
		RETVAL

bool
set_click_speed(speed)
	INPUT:
		bigtime_t speed;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: speed
		
		retval = set_click_speed(speed);
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

int32
get_mouse_speed()
	INIT:
		int32 speed;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_mouse_speed(&speed);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = speed;
	OUTPUT:
		RETVAL

bool
set_mouse_speed(speed)
	INPUT:
		int32 speed;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: speed
		
		retval = set_mouse_speed(speed);
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

int32
get_mouse_acceleration()
	INIT:
		int32 speed;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_mouse_acceleration(&speed);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = speed;
	OUTPUT:
		RETVAL

bool
set_mouse_acceleration(speed)
	INPUT:
		int32 speed;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: speed
		
		retval = set_mouse_acceleration(speed);
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

int32
get_key_repeat_rate()
	INIT:
		int32 rate;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_key_repeat_rate(&rate);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = rate;
	OUTPUT:
		RETVAL

bool
set_key_repeat_rate(rate)
	INPUT:
		int32 rate;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: rate
		
		retval = set_key_repeat_rate(rate);
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

bigtime_t
get_key_repeat_delay()
	INIT:
		bigtime_t delay;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_key_repeat_delay(&delay);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = delay;
	OUTPUT:
		RETVAL

bool
set_key_repeat_delay(delay)
	INPUT:
		bigtime_t delay;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: delay
		
		retval = set_key_repeat_delay(delay);
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

uint32
modifiers()
	INIT:
		uint32 retval;
	CODE:
		retval = modifiers();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
get_key_info()
	INIT:
		key_info* info;
		status_t retval;
		SV* error_sv;
		SV* info_sv = newSV(0);	// retcount == 1
	CODE:
		retval = get_key_info(info);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		info_sv = create_perl_object((void*)info, "Haiku::key_info", false);
		DUMPME(1,info_sv);
		RETVAL = newSVsv(info_sv);
		SvREFCNT_dec(info_sv);
	OUTPUT:
		RETVAL

void
get_key_map()
	INIT:
		key_map* map;
		char* keyBuffer;
		SV* map_sv = newSV(0);	// retcount > 1
		SV* keyBuffer_sv = newSV(0);	// retcount > 1
	PPCODE:
		get_key_map(&map, &keyBuffer);
		sv_setpv((SV*)keyBuffer_sv, keyBuffer);
		
		map_sv = create_perl_object((void*)map, "Haiku::key_map", false);
		DUMPME(1,map_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(map_sv));
		PUSHs(sv_2mortal(keyBuffer_sv));

uint16
get_keyboard_id()
	INIT:
		uint16 id;
		status_t retval;
		SV* error_sv;
	CODE:
		retval = get_keyboard_id(&id);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = id;
	OUTPUT:
		RETVAL

uint32
get_modifier_key(modifier)
	INPUT:
		uint32 modifier;
	INIT:
		uint32 key;
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: modifier
		
		retval = get_modifier_key(modifier, &key);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		RETVAL = key;
	OUTPUT:
		RETVAL

void
set_modifier_key(modifier, key)
	INPUT:
		uint32 modifier;
		uint32 key;
	CODE:
		// item 0: modifier
		// item 1: key
		
		set_modifier_key(modifier, key);

void
set_keyboard_locks(modifiers)
	INPUT:
		uint32 modifiers;
	CODE:
		// item 0: modifiers
		
		set_keyboard_locks(modifiers);

SV*
keyboard_navigation_color()
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		retval = keyboard_navigation_color();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

int32
count_workspaces()
	INIT:
		int32 retval;
	CODE:
		retval = count_workspaces();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
set_workspace_count(count)
	INPUT:
		int32 count;
	CODE:
		// item 0: count
		
		set_workspace_count(count);

int32
current_workspace()
	INIT:
		int32 retval;
	CODE:
		retval = current_workspace();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
activate_workspace(workspace)
	INPUT:
		int32 workspace;
	CODE:
		// item 0: workspace
		
		activate_workspace(workspace);

bigtime_t
idle_time()
	INIT:
		bigtime_t retval;
	CODE:
		retval = idle_time();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
run_select_printer_panel()
	CODE:
		run_select_printer_panel();

void
run_add_printer_panel()
	CODE:
		run_add_printer_panel();

void
run_be_about()
	CODE:
		run_be_about();

void
set_focus_follows_mouse(follow)
	INPUT:
		bool follow;
	CODE:
		// item 0: follow
		
		set_focus_follows_mouse(follow);

bool
focus_follows_mouse()
	INIT:
		bool retval;
	CODE:
		retval = focus_follows_mouse();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
set_mouse_mode(mode)
	INPUT:
		mode_mouse mode;
	CODE:
		// item 0: mode
		
		set_mouse_mode(mode);

mode_mouse
mouse_mode()
	INIT:
		mode_mouse retval;
	CODE:
		retval = mouse_mode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
set_focus_follows_mouse_mode(mode)
	INPUT:
		mode_focus_follows_mouse mode;
	CODE:
		// item 0: mode
		
		set_focus_follows_mouse_mode(mode);

mode_focus_follows_mouse
focus_follows_mouse_mode()
	INIT:
		mode_focus_follows_mouse retval;
	CODE:
		retval = focus_follows_mouse_mode();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
get_mouse()
	INIT:
		BPoint* screenWhere;
		uint32 buttons;
		status_t retval;
		SV* error_sv;
		SV* screenWhere_sv = newSV(0);	// retcount > 1
		SV* buttons_sv = newSV(0);	// retcount > 1
	PPCODE:
		retval = get_mouse(screenWhere, &buttons);
		sv_setuv(buttons_sv, (UV)buttons);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		screenWhere_sv = create_perl_object((void*)screenWhere, "Haiku::Point", false);
		DUMPME(1,screenWhere_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(screenWhere_sv));
		PUSHs(sv_2mortal(buttons_sv));

void
set_accept_first_click(acceptFirstClick)
	INPUT:
		bool acceptFirstClick;
	CODE:
		// item 0: acceptFirstClick
		
		set_accept_first_click(acceptFirstClick);

bool
accept_first_click()
	INIT:
		bool retval;
	CODE:
		retval = accept_first_click();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
ui_color(which)
	INPUT:
		color_which which;
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: which
		
		retval = ui_color(which);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
set_ui_color(which, color)
	INPUT:
		color_which which;
		rgb_color color;
	CODE:
		// item 0: which
		// item 1: color
		
		set_ui_color(which, color);

SV*
tint_color(color, tint)
	INPUT:
		rgb_color color;
		float tint;
	INIT:
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: color
		// item 1: tint
		
		retval = tint_color(color, tint);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
make_color(red, green, blue, ...)
	INPUT:
		uint8 red;
		uint8 green;
		uint8 blue;
	INIT:
		uint8 alpha = 255;
		rgb_color retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: red
		// item 1: green
		// item 2: blue
		// item 3: alpha
		if (items > 3) {
			alpha = (uint8)SvUV(ST(3));
		}
		
		retval = make_color(red, green, blue, alpha);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::rgb_color", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
bitmaps_support_space(space)
	INPUT:
		color_space space;
	INIT:
		uint32 flags;
		bool retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* flags_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: space
		
		retval = bitmaps_support_space(space, &flags);
		retval_sv = boolSV(retval);
		sv_setuv(flags_sv, (UV)flags);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(flags_sv));

void
get_pixel_size_for(space)
	INPUT:
		color_space space;
	INIT:
		size_t pixelChunk;
		size_t rowAlignment;
		size_t pixelsPerChunk;
		status_t retval;
		SV* error_sv;
		SV* pixelChunk_sv = newSV(0);	// retcount > 1
		SV* rowAlignment_sv = newSV(0);	// retcount > 1
		SV* pixelsPerChunk_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: space
		
		retval = get_pixel_size_for(space, &pixelChunk, &rowAlignment, &pixelsPerChunk);
		sv_setiv(pixelChunk_sv, (IV)pixelChunk);
		sv_setiv(rowAlignment_sv, (IV)rowAlignment);
		sv_setiv(pixelsPerChunk_sv, (IV)pixelsPerChunk);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(pixelChunk_sv));
		PUSHs(sv_2mortal(rowAlignment_sv));
		PUSHs(sv_2mortal(pixelsPerChunk_sv));

SV*
B_UTF8_BULLET()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_BULLET);
		dualize(RETVAL, "B_UTF8_BULLET");
	OUTPUT:
		RETVAL

SV*
B_UTF8_ELLIPSIS()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_ELLIPSIS);
		dualize(RETVAL, "B_UTF8_ELLIPSIS");
	OUTPUT:
		RETVAL

SV*
B_UTF8_OPEN_QUOTE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_OPEN_QUOTE);
		dualize(RETVAL, "B_UTF8_OPEN_QUOTE");
	OUTPUT:
		RETVAL

SV*
B_UTF8_CLOSE_QUOTE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_CLOSE_QUOTE);
		dualize(RETVAL, "B_UTF8_CLOSE_QUOTE");
	OUTPUT:
		RETVAL

SV*
B_UTF8_COPYRIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_COPYRIGHT);
		dualize(RETVAL, "B_UTF8_COPYRIGHT");
	OUTPUT:
		RETVAL

SV*
B_UTF8_REGISTERED()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_REGISTERED);
		dualize(RETVAL, "B_UTF8_REGISTERED");
	OUTPUT:
		RETVAL

SV*
B_UTF8_TRADEMARK()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_TRADEMARK);
		dualize(RETVAL, "B_UTF8_TRADEMARK");
	OUTPUT:
		RETVAL

SV*
B_UTF8_SMILING_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_SMILING_FACE);
		dualize(RETVAL, "B_UTF8_SMILING_FACE");
	OUTPUT:
		RETVAL

SV*
B_UTF8_HIROSHI()
	CODE:
		RETVAL = newSV(0);
		sv_setpv((SV*)RETVAL, B_UTF8_HIROSHI);
		dualize(RETVAL, "B_UTF8_HIROSHI");
	OUTPUT:
		RETVAL

SV*
B_BACKSPACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BACKSPACE);
		dualize(RETVAL, "B_BACKSPACE");
	OUTPUT:
		RETVAL

SV*
B_RETURN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RETURN);
		dualize(RETVAL, "B_RETURN");
	OUTPUT:
		RETVAL

SV*
B_ENTER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ENTER);
		dualize(RETVAL, "B_ENTER");
	OUTPUT:
		RETVAL

SV*
B_SPACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SPACE);
		dualize(RETVAL, "B_SPACE");
	OUTPUT:
		RETVAL

SV*
B_TAB()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TAB);
		dualize(RETVAL, "B_TAB");
	OUTPUT:
		RETVAL

SV*
B_ESCAPE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ESCAPE);
		dualize(RETVAL, "B_ESCAPE");
	OUTPUT:
		RETVAL

SV*
B_SUBSTITUTE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SUBSTITUTE);
		dualize(RETVAL, "B_SUBSTITUTE");
	OUTPUT:
		RETVAL

SV*
B_LEFT_ARROW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LEFT_ARROW);
		dualize(RETVAL, "B_LEFT_ARROW");
	OUTPUT:
		RETVAL

SV*
B_RIGHT_ARROW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RIGHT_ARROW);
		dualize(RETVAL, "B_RIGHT_ARROW");
	OUTPUT:
		RETVAL

SV*
B_UP_ARROW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UP_ARROW);
		dualize(RETVAL, "B_UP_ARROW");
	OUTPUT:
		RETVAL

SV*
B_DOWN_ARROW()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DOWN_ARROW);
		dualize(RETVAL, "B_DOWN_ARROW");
	OUTPUT:
		RETVAL

SV*
B_INSERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_INSERT);
		dualize(RETVAL, "B_INSERT");
	OUTPUT:
		RETVAL

SV*
B_DELETE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DELETE);
		dualize(RETVAL, "B_DELETE");
	OUTPUT:
		RETVAL

SV*
B_HOME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HOME);
		dualize(RETVAL, "B_HOME");
	OUTPUT:
		RETVAL

SV*
B_END()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_END);
		dualize(RETVAL, "B_END");
	OUTPUT:
		RETVAL

SV*
B_PAGE_UP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PAGE_UP);
		dualize(RETVAL, "B_PAGE_UP");
	OUTPUT:
		RETVAL

SV*
B_PAGE_DOWN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PAGE_DOWN);
		dualize(RETVAL, "B_PAGE_DOWN");
	OUTPUT:
		RETVAL

SV*
B_FUNCTION_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FUNCTION_KEY);
		dualize(RETVAL, "B_FUNCTION_KEY");
	OUTPUT:
		RETVAL

SV*
B_KATAKANA_HIRAGANA()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_KATAKANA_HIRAGANA);
		dualize(RETVAL, "B_KATAKANA_HIRAGANA");
	OUTPUT:
		RETVAL

SV*
B_HANKAKU_ZENKAKU()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HANKAKU_ZENKAKU);
		dualize(RETVAL, "B_HANKAKU_ZENKAKU");
	OUTPUT:
		RETVAL

SV*
B_F1_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F1_KEY);
		dualize(RETVAL, "B_F1_KEY");
	OUTPUT:
		RETVAL

SV*
B_F2_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F2_KEY);
		dualize(RETVAL, "B_F2_KEY");
	OUTPUT:
		RETVAL

SV*
B_F3_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F3_KEY);
		dualize(RETVAL, "B_F3_KEY");
	OUTPUT:
		RETVAL

SV*
B_F4_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F4_KEY);
		dualize(RETVAL, "B_F4_KEY");
	OUTPUT:
		RETVAL

SV*
B_F5_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F5_KEY);
		dualize(RETVAL, "B_F5_KEY");
	OUTPUT:
		RETVAL

SV*
B_F6_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F6_KEY);
		dualize(RETVAL, "B_F6_KEY");
	OUTPUT:
		RETVAL

SV*
B_F7_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F7_KEY);
		dualize(RETVAL, "B_F7_KEY");
	OUTPUT:
		RETVAL

SV*
B_F8_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F8_KEY);
		dualize(RETVAL, "B_F8_KEY");
	OUTPUT:
		RETVAL

SV*
B_F9_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F9_KEY);
		dualize(RETVAL, "B_F9_KEY");
	OUTPUT:
		RETVAL

SV*
B_F10_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F10_KEY);
		dualize(RETVAL, "B_F10_KEY");
	OUTPUT:
		RETVAL

SV*
B_F11_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F11_KEY);
		dualize(RETVAL, "B_F11_KEY");
	OUTPUT:
		RETVAL

SV*
B_F12_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_F12_KEY);
		dualize(RETVAL, "B_F12_KEY");
	OUTPUT:
		RETVAL

SV*
B_PRINT_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRINT_KEY);
		dualize(RETVAL, "B_PRINT_KEY");
	OUTPUT:
		RETVAL

SV*
B_SCROLL_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCROLL_KEY);
		dualize(RETVAL, "B_SCROLL_KEY");
	OUTPUT:
		RETVAL

SV*
B_PAUSE_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PAUSE_KEY);
		dualize(RETVAL, "B_PAUSE_KEY");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTROL_TABLE);
		dualize(RETVAL, "B_CONTROL_TABLE");
	OUTPUT:
		RETVAL

SV*
B_OPTION_CAPS_SHIFT_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPTION_CAPS_SHIFT_TABLE);
		dualize(RETVAL, "B_OPTION_CAPS_SHIFT_TABLE");
	OUTPUT:
		RETVAL

SV*
B_OPTION_CAPS_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPTION_CAPS_TABLE);
		dualize(RETVAL, "B_OPTION_CAPS_TABLE");
	OUTPUT:
		RETVAL

SV*
B_OPTION_SHIFT_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPTION_SHIFT_TABLE);
		dualize(RETVAL, "B_OPTION_SHIFT_TABLE");
	OUTPUT:
		RETVAL

SV*
B_OPTION_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPTION_TABLE);
		dualize(RETVAL, "B_OPTION_TABLE");
	OUTPUT:
		RETVAL

SV*
B_CAPS_SHIFT_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CAPS_SHIFT_TABLE);
		dualize(RETVAL, "B_CAPS_SHIFT_TABLE");
	OUTPUT:
		RETVAL

SV*
B_CAPS_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CAPS_TABLE);
		dualize(RETVAL, "B_CAPS_TABLE");
	OUTPUT:
		RETVAL

SV*
B_SHIFT_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SHIFT_TABLE);
		dualize(RETVAL, "B_SHIFT_TABLE");
	OUTPUT:
		RETVAL

SV*
B_NORMAL_TABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NORMAL_TABLE);
		dualize(RETVAL, "B_NORMAL_TABLE");
	OUTPUT:
		RETVAL

SV*
B_SHIFT_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SHIFT_KEY);
		dualize(RETVAL, "B_SHIFT_KEY");
	OUTPUT:
		RETVAL

SV*
B_COMMAND_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_COMMAND_KEY);
		dualize(RETVAL, "B_COMMAND_KEY");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTROL_KEY);
		dualize(RETVAL, "B_CONTROL_KEY");
	OUTPUT:
		RETVAL

SV*
B_CAPS_LOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CAPS_LOCK);
		dualize(RETVAL, "B_CAPS_LOCK");
	OUTPUT:
		RETVAL

SV*
B_SCROLL_LOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCROLL_LOCK);
		dualize(RETVAL, "B_SCROLL_LOCK");
	OUTPUT:
		RETVAL

SV*
B_NUM_LOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NUM_LOCK);
		dualize(RETVAL, "B_NUM_LOCK");
	OUTPUT:
		RETVAL

SV*
B_OPTION_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OPTION_KEY);
		dualize(RETVAL, "B_OPTION_KEY");
	OUTPUT:
		RETVAL

SV*
B_MENU_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_KEY);
		dualize(RETVAL, "B_MENU_KEY");
	OUTPUT:
		RETVAL

SV*
B_LEFT_SHIFT_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LEFT_SHIFT_KEY);
		dualize(RETVAL, "B_LEFT_SHIFT_KEY");
	OUTPUT:
		RETVAL

SV*
B_RIGHT_SHIFT_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RIGHT_SHIFT_KEY);
		dualize(RETVAL, "B_RIGHT_SHIFT_KEY");
	OUTPUT:
		RETVAL

SV*
B_LEFT_COMMAND_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LEFT_COMMAND_KEY);
		dualize(RETVAL, "B_LEFT_COMMAND_KEY");
	OUTPUT:
		RETVAL

SV*
B_RIGHT_COMMAND_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RIGHT_COMMAND_KEY);
		dualize(RETVAL, "B_RIGHT_COMMAND_KEY");
	OUTPUT:
		RETVAL

SV*
B_LEFT_CONTROL_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LEFT_CONTROL_KEY);
		dualize(RETVAL, "B_LEFT_CONTROL_KEY");
	OUTPUT:
		RETVAL

SV*
B_RIGHT_CONTROL_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RIGHT_CONTROL_KEY);
		dualize(RETVAL, "B_RIGHT_CONTROL_KEY");
	OUTPUT:
		RETVAL

SV*
B_LEFT_OPTION_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LEFT_OPTION_KEY);
		dualize(RETVAL, "B_LEFT_OPTION_KEY");
	OUTPUT:
		RETVAL

SV*
B_RIGHT_OPTION_KEY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RIGHT_OPTION_KEY);
		dualize(RETVAL, "B_RIGHT_OPTION_KEY");
	OUTPUT:
		RETVAL

SV*
B_MAX_MOUSE_BUTTONS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MAX_MOUSE_BUTTONS);
		dualize(RETVAL, "B_MAX_MOUSE_BUTTONS");
	OUTPUT:
		RETVAL

SV*
B_NORMAL_MOUSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NORMAL_MOUSE);
		dualize(RETVAL, "B_NORMAL_MOUSE");
	OUTPUT:
		RETVAL

SV*
B_CLICK_TO_FOCUS_MOUSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CLICK_TO_FOCUS_MOUSE);
		dualize(RETVAL, "B_CLICK_TO_FOCUS_MOUSE");
	OUTPUT:
		RETVAL

SV*
B_FOCUS_FOLLOWS_MOUSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FOCUS_FOLLOWS_MOUSE);
		dualize(RETVAL, "B_FOCUS_FOLLOWS_MOUSE");
	OUTPUT:
		RETVAL

SV*
B_NORMAL_FOCUS_FOLLOWS_MOUSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NORMAL_FOCUS_FOLLOWS_MOUSE);
		dualize(RETVAL, "B_NORMAL_FOCUS_FOLLOWS_MOUSE");
	OUTPUT:
		RETVAL

SV*
B_WARP_FOCUS_FOLLOWS_MOUSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WARP_FOCUS_FOLLOWS_MOUSE);
		dualize(RETVAL, "B_WARP_FOCUS_FOLLOWS_MOUSE");
	OUTPUT:
		RETVAL

SV*
B_INSTANT_WARP_FOCUS_FOLLOWS_MOUSE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_INSTANT_WARP_FOCUS_FOLLOWS_MOUSE);
		dualize(RETVAL, "B_INSTANT_WARP_FOCUS_FOLLOWS_MOUSE");
	OUTPUT:
		RETVAL

SV*
B_PLAIN_BORDER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PLAIN_BORDER);
		dualize(RETVAL, "B_PLAIN_BORDER");
	OUTPUT:
		RETVAL

SV*
B_FANCY_BORDER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FANCY_BORDER);
		dualize(RETVAL, "B_FANCY_BORDER");
	OUTPUT:
		RETVAL

SV*
B_NO_BORDER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_BORDER);
		dualize(RETVAL, "B_NO_BORDER");
	OUTPUT:
		RETVAL

SV*
B_HORIZONTAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HORIZONTAL);
		dualize(RETVAL, "B_HORIZONTAL");
	OUTPUT:
		RETVAL

SV*
B_VERTICAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_VERTICAL);
		dualize(RETVAL, "B_VERTICAL");
	OUTPUT:
		RETVAL

SV*
B_WIDTH_AS_USUAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WIDTH_AS_USUAL);
		dualize(RETVAL, "B_WIDTH_AS_USUAL");
	OUTPUT:
		RETVAL

SV*
B_WIDTH_FROM_WIDEST()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WIDTH_FROM_WIDEST);
		dualize(RETVAL, "B_WIDTH_FROM_WIDEST");
	OUTPUT:
		RETVAL

SV*
B_WIDTH_FROM_LABEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WIDTH_FROM_LABEL);
		dualize(RETVAL, "B_WIDTH_FROM_LABEL");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_LEFT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_LEFT);
		dualize(RETVAL, "B_ALIGN_LEFT");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_RIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_RIGHT);
		dualize(RETVAL, "B_ALIGN_RIGHT");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_CENTER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_CENTER);
		dualize(RETVAL, "B_ALIGN_CENTER");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_HORIZONTAL_CENTER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_HORIZONTAL_CENTER);
		dualize(RETVAL, "B_ALIGN_HORIZONTAL_CENTER");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_HORIZONTAL_UNSET()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_HORIZONTAL_UNSET);
		dualize(RETVAL, "B_ALIGN_HORIZONTAL_UNSET");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_USE_FULL_WIDTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_USE_FULL_WIDTH);
		dualize(RETVAL, "B_ALIGN_USE_FULL_WIDTH");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_TOP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_TOP);
		dualize(RETVAL, "B_ALIGN_TOP");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_MIDDLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_MIDDLE);
		dualize(RETVAL, "B_ALIGN_MIDDLE");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_BOTTOM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_BOTTOM);
		dualize(RETVAL, "B_ALIGN_BOTTOM");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_VERTICAL_CENTER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_VERTICAL_CENTER);
		dualize(RETVAL, "B_ALIGN_VERTICAL_CENTER");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_VERTICAL_UNSET()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_VERTICAL_UNSET);
		dualize(RETVAL, "B_ALIGN_VERTICAL_UNSET");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_NO_VERTICAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_NO_VERTICAL);
		dualize(RETVAL, "B_ALIGN_NO_VERTICAL");
	OUTPUT:
		RETVAL

SV*
B_ALIGN_USE_FULL_HEIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALIGN_USE_FULL_HEIGHT);
		dualize(RETVAL, "B_ALIGN_USE_FULL_HEIGHT");
	OUTPUT:
		RETVAL

SV*
B_USE_DEFAULT_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_USE_DEFAULT_SPACING);
		dualize(RETVAL, "B_USE_DEFAULT_SPACING");
	OUTPUT:
		RETVAL

SV*
B_ROUND_JOIN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ROUND_JOIN);
		dualize(RETVAL, "B_ROUND_JOIN");
	OUTPUT:
		RETVAL

SV*
B_MITER_JOIN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MITER_JOIN);
		dualize(RETVAL, "B_MITER_JOIN");
	OUTPUT:
		RETVAL

SV*
B_BEVEL_JOIN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BEVEL_JOIN);
		dualize(RETVAL, "B_BEVEL_JOIN");
	OUTPUT:
		RETVAL

SV*
B_BUTT_JOIN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BUTT_JOIN);
		dualize(RETVAL, "B_BUTT_JOIN");
	OUTPUT:
		RETVAL

SV*
B_SQUARE_JOIN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SQUARE_JOIN);
		dualize(RETVAL, "B_SQUARE_JOIN");
	OUTPUT:
		RETVAL

SV*
B_ROUND_CAP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ROUND_CAP);
		dualize(RETVAL, "B_ROUND_CAP");
	OUTPUT:
		RETVAL

SV*
B_BUTT_CAP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BUTT_CAP);
		dualize(RETVAL, "B_BUTT_CAP");
	OUTPUT:
		RETVAL

SV*
B_SQUARE_CAP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SQUARE_CAP);
		dualize(RETVAL, "B_SQUARE_CAP");
	OUTPUT:
		RETVAL

SV*
B_DEFAULT_MITER_LIMIT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DEFAULT_MITER_LIMIT);
		dualize(RETVAL, "B_DEFAULT_MITER_LIMIT");
	OUTPUT:
		RETVAL

SV*
B_TILE_BITMAP_X()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TILE_BITMAP_X);
		dualize(RETVAL, "B_TILE_BITMAP_X");
	OUTPUT:
		RETVAL

SV*
B_TILE_BITMAP_Y()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TILE_BITMAP_Y);
		dualize(RETVAL, "B_TILE_BITMAP_Y");
	OUTPUT:
		RETVAL

SV*
B_TILE_BITMAP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TILE_BITMAP);
		dualize(RETVAL, "B_TILE_BITMAP");
	OUTPUT:
		RETVAL

SV*
B_FILTER_BITMAP_BILINEAR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FILTER_BITMAP_BILINEAR);
		dualize(RETVAL, "B_FILTER_BITMAP_BILINEAR");
	OUTPUT:
		RETVAL

SV*
B_WAIT_FOR_RETRACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WAIT_FOR_RETRACE);
		dualize(RETVAL, "B_WAIT_FOR_RETRACE");
	OUTPUT:
		RETVAL

SV*
B_OVERLAY_FILTER_HORIZONTAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OVERLAY_FILTER_HORIZONTAL);
		dualize(RETVAL, "B_OVERLAY_FILTER_HORIZONTAL");
	OUTPUT:
		RETVAL

SV*
B_OVERLAY_FILTER_VERTICAL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OVERLAY_FILTER_VERTICAL);
		dualize(RETVAL, "B_OVERLAY_FILTER_VERTICAL");
	OUTPUT:
		RETVAL

SV*
B_OVERLAY_MIRROR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OVERLAY_MIRROR);
		dualize(RETVAL, "B_OVERLAY_MIRROR");
	OUTPUT:
		RETVAL

SV*
B_OVERLAY_TRANSFER_CHANNEL()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OVERLAY_TRANSFER_CHANNEL);
		dualize(RETVAL, "B_OVERLAY_TRANSFER_CHANNEL");
	OUTPUT:
		RETVAL

SV*
B_PANEL_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PANEL_BACKGROUND_COLOR);
		dualize(RETVAL, "B_PANEL_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_PANEL_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PANEL_TEXT_COLOR);
		dualize(RETVAL, "B_PANEL_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_DOCUMENT_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DOCUMENT_BACKGROUND_COLOR);
		dualize(RETVAL, "B_DOCUMENT_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_DOCUMENT_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DOCUMENT_TEXT_COLOR);
		dualize(RETVAL, "B_DOCUMENT_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTROL_BACKGROUND_COLOR);
		dualize(RETVAL, "B_CONTROL_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTROL_TEXT_COLOR);
		dualize(RETVAL, "B_CONTROL_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_BORDER_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTROL_BORDER_COLOR);
		dualize(RETVAL, "B_CONTROL_BORDER_COLOR");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_HIGHLIGHT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONTROL_HIGHLIGHT_COLOR);
		dualize(RETVAL, "B_CONTROL_HIGHLIGHT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_NAVIGATION_BASE_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NAVIGATION_BASE_COLOR);
		dualize(RETVAL, "B_NAVIGATION_BASE_COLOR");
	OUTPUT:
		RETVAL

SV*
B_NAVIGATION_PULSE_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NAVIGATION_PULSE_COLOR);
		dualize(RETVAL, "B_NAVIGATION_PULSE_COLOR");
	OUTPUT:
		RETVAL

SV*
B_SHINE_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SHINE_COLOR);
		dualize(RETVAL, "B_SHINE_COLOR");
	OUTPUT:
		RETVAL

SV*
B_SHADOW_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SHADOW_COLOR);
		dualize(RETVAL, "B_SHADOW_COLOR");
	OUTPUT:
		RETVAL

SV*
B_MENU_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_BACKGROUND_COLOR);
		dualize(RETVAL, "B_MENU_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_MENU_SELECTED_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_SELECTED_BACKGROUND_COLOR);
		dualize(RETVAL, "B_MENU_SELECTED_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_MENU_ITEM_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_ITEM_TEXT_COLOR);
		dualize(RETVAL, "B_MENU_ITEM_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_MENU_SELECTED_ITEM_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_SELECTED_ITEM_TEXT_COLOR);
		dualize(RETVAL, "B_MENU_SELECTED_ITEM_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_MENU_SELECTED_BORDER_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_SELECTED_BORDER_COLOR);
		dualize(RETVAL, "B_MENU_SELECTED_BORDER_COLOR");
	OUTPUT:
		RETVAL

SV*
B_TOOL_TIP_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TOOL_TIP_BACKGROUND_COLOR);
		dualize(RETVAL, "B_TOOL_TIP_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_TOOL_TIP_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TOOL_TIP_TEXT_COLOR);
		dualize(RETVAL, "B_TOOL_TIP_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_SUCCESS_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SUCCESS_COLOR);
		dualize(RETVAL, "B_SUCCESS_COLOR");
	OUTPUT:
		RETVAL

SV*
B_FAILURE_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FAILURE_COLOR);
		dualize(RETVAL, "B_FAILURE_COLOR");
	OUTPUT:
		RETVAL

SV*
B_KEYBOARD_NAVIGATION_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_KEYBOARD_NAVIGATION_COLOR);
		dualize(RETVAL, "B_KEYBOARD_NAVIGATION_COLOR");
	OUTPUT:
		RETVAL

SV*
B_MENU_SELECTION_BACKGROUND_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MENU_SELECTION_BACKGROUND_COLOR);
		dualize(RETVAL, "B_MENU_SELECTION_BACKGROUND_COLOR");
	OUTPUT:
		RETVAL

SV*
B_DESKTOP_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DESKTOP_COLOR);
		dualize(RETVAL, "B_DESKTOP_COLOR");
	OUTPUT:
		RETVAL

SV*
B_WINDOW_TAB_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WINDOW_TAB_COLOR);
		dualize(RETVAL, "B_WINDOW_TAB_COLOR");
	OUTPUT:
		RETVAL

SV*
B_WINDOW_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WINDOW_TEXT_COLOR);
		dualize(RETVAL, "B_WINDOW_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_WINDOW_INACTIVE_TAB_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WINDOW_INACTIVE_TAB_COLOR);
		dualize(RETVAL, "B_WINDOW_INACTIVE_TAB_COLOR");
	OUTPUT:
		RETVAL

SV*
B_WINDOW_INACTIVE_TEXT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_WINDOW_INACTIVE_TEXT_COLOR);
		dualize(RETVAL, "B_WINDOW_INACTIVE_TEXT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_LIGHTEN_MAX_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_LIGHTEN_MAX_TINT);
		dualize(RETVAL, "B_LIGHTEN_MAX_TINT");
	OUTPUT:
		RETVAL

SV*
B_LIGHTEN_2_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_LIGHTEN_2_TINT);
		dualize(RETVAL, "B_LIGHTEN_2_TINT");
	OUTPUT:
		RETVAL

SV*
B_LIGHTEN_1_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_LIGHTEN_1_TINT);
		dualize(RETVAL, "B_LIGHTEN_1_TINT");
	OUTPUT:
		RETVAL

SV*
B_NO_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_NO_TINT);
		dualize(RETVAL, "B_NO_TINT");
	OUTPUT:
		RETVAL

SV*
B_DARKEN_1_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DARKEN_1_TINT);
		dualize(RETVAL, "B_DARKEN_1_TINT");
	OUTPUT:
		RETVAL

SV*
B_DARKEN_2_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DARKEN_2_TINT);
		dualize(RETVAL, "B_DARKEN_2_TINT");
	OUTPUT:
		RETVAL

SV*
B_DARKEN_3_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DARKEN_3_TINT);
		dualize(RETVAL, "B_DARKEN_3_TINT");
	OUTPUT:
		RETVAL

SV*
B_DARKEN_4_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DARKEN_4_TINT);
		dualize(RETVAL, "B_DARKEN_4_TINT");
	OUTPUT:
		RETVAL

SV*
B_DARKEN_MAX_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DARKEN_MAX_TINT);
		dualize(RETVAL, "B_DARKEN_MAX_TINT");
	OUTPUT:
		RETVAL

SV*
B_DISABLED_LABEL_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DISABLED_LABEL_TINT);
		dualize(RETVAL, "B_DISABLED_LABEL_TINT");
	OUTPUT:
		RETVAL

SV*
B_HIGHLIGHT_BACKGROUND_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_HIGHLIGHT_BACKGROUND_TINT);
		dualize(RETVAL, "B_HIGHLIGHT_BACKGROUND_TINT");
	OUTPUT:
		RETVAL

SV*
B_DISABLED_MARK_TINT()
	CODE:
		RETVAL = newSV(0);
		sv_setnv(RETVAL, (double)B_DISABLED_MARK_TINT);
		dualize(RETVAL, "B_DISABLED_MARK_TINT");
	OUTPUT:
		RETVAL

SV*
B_SOLID_HIGH()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_SOLID_HIGH, "Haiku::pattern", true));
		dualize(RETVAL, "B_SOLID_HIGH");
	OUTPUT:
		RETVAL

SV*
B_MIXED_COLORS()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_MIXED_COLORS, "Haiku::pattern", true));
		dualize(RETVAL, "B_MIXED_COLORS");
	OUTPUT:
		RETVAL

SV*
B_SOLID_LOW()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_SOLID_LOW, "Haiku::pattern", true));
		dualize(RETVAL, "B_SOLID_LOW");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_COLOR()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_TRANSPARENT_COLOR, "Haiku::rgb_color", true));
		dualize(RETVAL, "B_TRANSPARENT_COLOR");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_MAGIC_CMAP8()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_TRANSPARENT_MAGIC_CMAP8);
		dualize(RETVAL, "B_TRANSPARENT_MAGIC_CMAP8");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_MAGIC_RGBA15()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_TRANSPARENT_MAGIC_RGBA15);
		dualize(RETVAL, "B_TRANSPARENT_MAGIC_RGBA15");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_MAGIC_RGBA15_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_TRANSPARENT_MAGIC_RGBA15_BIG);
		dualize(RETVAL, "B_TRANSPARENT_MAGIC_RGBA15_BIG");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_MAGIC_RGBA32()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_TRANSPARENT_MAGIC_RGBA32);
		dualize(RETVAL, "B_TRANSPARENT_MAGIC_RGBA32");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_MAGIC_RGBA32_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_TRANSPARENT_MAGIC_RGBA32_BIG);
		dualize(RETVAL, "B_TRANSPARENT_MAGIC_RGBA32_BIG");
	OUTPUT:
		RETVAL

SV*
B_TRANSPARENT_8_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setuv(RETVAL, (UV)B_TRANSPARENT_8_BIT);
		dualize(RETVAL, "B_TRANSPARENT_8_BIT");
	OUTPUT:
		RETVAL

SV*
B_MAIN_SCREEN_ID()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_MAIN_SCREEN_ID, "Haiku::screen_id", true));
		dualize(RETVAL, "B_MAIN_SCREEN_ID");
	OUTPUT:
		RETVAL

SV*
B_NO_COLOR_SPACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NO_COLOR_SPACE);
		dualize(RETVAL, "B_NO_COLOR_SPACE");
	OUTPUT:
		RETVAL

SV*
B_RGB32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB32);
		dualize(RETVAL, "B_RGB32");
	OUTPUT:
		RETVAL

SV*
B_RGBA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGBA32);
		dualize(RETVAL, "B_RGBA32");
	OUTPUT:
		RETVAL

SV*
B_RGB24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB24);
		dualize(RETVAL, "B_RGB24");
	OUTPUT:
		RETVAL

SV*
B_RGB16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB16);
		dualize(RETVAL, "B_RGB16");
	OUTPUT:
		RETVAL

SV*
B_RGB15()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB15);
		dualize(RETVAL, "B_RGB15");
	OUTPUT:
		RETVAL

SV*
B_RGBA15()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGBA15);
		dualize(RETVAL, "B_RGBA15");
	OUTPUT:
		RETVAL

SV*
B_CMAP8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CMAP8);
		dualize(RETVAL, "B_CMAP8");
	OUTPUT:
		RETVAL

SV*
B_GRAY8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_GRAY8);
		dualize(RETVAL, "B_GRAY8");
	OUTPUT:
		RETVAL

SV*
B_GRAY1()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_GRAY1);
		dualize(RETVAL, "B_GRAY1");
	OUTPUT:
		RETVAL

SV*
B_RGB32_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB32_BIG);
		dualize(RETVAL, "B_RGB32_BIG");
	OUTPUT:
		RETVAL

SV*
B_RGBA32_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGBA32_BIG);
		dualize(RETVAL, "B_RGBA32_BIG");
	OUTPUT:
		RETVAL

SV*
B_RGB24_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB24_BIG);
		dualize(RETVAL, "B_RGB24_BIG");
	OUTPUT:
		RETVAL

SV*
B_RGB16_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB16_BIG);
		dualize(RETVAL, "B_RGB16_BIG");
	OUTPUT:
		RETVAL

SV*
B_RGB15_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB15_BIG);
		dualize(RETVAL, "B_RGB15_BIG");
	OUTPUT:
		RETVAL

SV*
B_RGBA15_BIG()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGBA15_BIG);
		dualize(RETVAL, "B_RGBA15_BIG");
	OUTPUT:
		RETVAL

SV*
B_RGB32_LITTLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB32_LITTLE);
		dualize(RETVAL, "B_RGB32_LITTLE");
	OUTPUT:
		RETVAL

SV*
B_RGBA32_LITTLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGBA32_LITTLE);
		dualize(RETVAL, "B_RGBA32_LITTLE");
	OUTPUT:
		RETVAL

SV*
B_RGB24_LITTLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB24_LITTLE);
		dualize(RETVAL, "B_RGB24_LITTLE");
	OUTPUT:
		RETVAL

SV*
B_RGB16_LITTLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB16_LITTLE);
		dualize(RETVAL, "B_RGB16_LITTLE");
	OUTPUT:
		RETVAL

SV*
B_RGB15_LITTLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB15_LITTLE);
		dualize(RETVAL, "B_RGB15_LITTLE");
	OUTPUT:
		RETVAL

SV*
B_RGBA15_LITTLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGBA15_LITTLE);
		dualize(RETVAL, "B_RGBA15_LITTLE");
	OUTPUT:
		RETVAL

SV*
B_YCbCr422()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YCbCr422);
		dualize(RETVAL, "B_YCbCr422");
	OUTPUT:
		RETVAL

SV*
B_YCbCr411()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YCbCr411);
		dualize(RETVAL, "B_YCbCr411");
	OUTPUT:
		RETVAL

SV*
B_YCbCr444()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YCbCr444);
		dualize(RETVAL, "B_YCbCr444");
	OUTPUT:
		RETVAL

SV*
B_YCbCr420()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YCbCr420);
		dualize(RETVAL, "B_YCbCr420");
	OUTPUT:
		RETVAL

SV*
B_YUV422()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YUV422);
		dualize(RETVAL, "B_YUV422");
	OUTPUT:
		RETVAL

SV*
B_YUV411()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YUV411);
		dualize(RETVAL, "B_YUV411");
	OUTPUT:
		RETVAL

SV*
B_YUV444()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YUV444);
		dualize(RETVAL, "B_YUV444");
	OUTPUT:
		RETVAL

SV*
B_YUV420()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YUV420);
		dualize(RETVAL, "B_YUV420");
	OUTPUT:
		RETVAL

SV*
B_YUV9()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YUV9);
		dualize(RETVAL, "B_YUV9");
	OUTPUT:
		RETVAL

SV*
B_YUV12()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_YUV12);
		dualize(RETVAL, "B_YUV12");
	OUTPUT:
		RETVAL

SV*
B_UVL24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UVL24);
		dualize(RETVAL, "B_UVL24");
	OUTPUT:
		RETVAL

SV*
B_UVL32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UVL32);
		dualize(RETVAL, "B_UVL32");
	OUTPUT:
		RETVAL

SV*
B_UVLA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UVLA32);
		dualize(RETVAL, "B_UVLA32");
	OUTPUT:
		RETVAL

SV*
B_LAB24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LAB24);
		dualize(RETVAL, "B_LAB24");
	OUTPUT:
		RETVAL

SV*
B_LAB32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LAB32);
		dualize(RETVAL, "B_LAB32");
	OUTPUT:
		RETVAL

SV*
B_LABA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LABA32);
		dualize(RETVAL, "B_LABA32");
	OUTPUT:
		RETVAL

SV*
B_HSI24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HSI24);
		dualize(RETVAL, "B_HSI24");
	OUTPUT:
		RETVAL

SV*
B_HSI32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HSI32);
		dualize(RETVAL, "B_HSI32");
	OUTPUT:
		RETVAL

SV*
B_HSIA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HSIA32);
		dualize(RETVAL, "B_HSIA32");
	OUTPUT:
		RETVAL

SV*
B_HSV24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HSV24);
		dualize(RETVAL, "B_HSV24");
	OUTPUT:
		RETVAL

SV*
B_HSV32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HSV32);
		dualize(RETVAL, "B_HSV32");
	OUTPUT:
		RETVAL

SV*
B_HSVA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HSVA32);
		dualize(RETVAL, "B_HSVA32");
	OUTPUT:
		RETVAL

SV*
B_HLS24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HLS24);
		dualize(RETVAL, "B_HLS24");
	OUTPUT:
		RETVAL

SV*
B_HLS32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HLS32);
		dualize(RETVAL, "B_HLS32");
	OUTPUT:
		RETVAL

SV*
B_HLSA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HLSA32);
		dualize(RETVAL, "B_HLSA32");
	OUTPUT:
		RETVAL

SV*
B_CMY24()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CMY24);
		dualize(RETVAL, "B_CMY24");
	OUTPUT:
		RETVAL

SV*
B_CMY32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CMY32);
		dualize(RETVAL, "B_CMY32");
	OUTPUT:
		RETVAL

SV*
B_CMYA32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CMYA32);
		dualize(RETVAL, "B_CMYA32");
	OUTPUT:
		RETVAL

SV*
B_CMYK32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CMYK32);
		dualize(RETVAL, "B_CMYK32");
	OUTPUT:
		RETVAL

SV*
B_MONOCHROME_1_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MONOCHROME_1_BIT);
		dualize(RETVAL, "B_MONOCHROME_1_BIT");
	OUTPUT:
		RETVAL

SV*
B_GRAYSCALE_8_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_GRAYSCALE_8_BIT);
		dualize(RETVAL, "B_GRAYSCALE_8_BIT");
	OUTPUT:
		RETVAL

SV*
B_COLOR_8_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_COLOR_8_BIT);
		dualize(RETVAL, "B_COLOR_8_BIT");
	OUTPUT:
		RETVAL

SV*
B_RGB_32_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB_32_BIT);
		dualize(RETVAL, "B_RGB_32_BIT");
	OUTPUT:
		RETVAL

SV*
B_RGB_16_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_RGB_16_BIT);
		dualize(RETVAL, "B_RGB_16_BIT");
	OUTPUT:
		RETVAL

SV*
B_BIG_RGB_32_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BIG_RGB_32_BIT);
		dualize(RETVAL, "B_BIG_RGB_32_BIT");
	OUTPUT:
		RETVAL

SV*
B_BIG_RGB_16_BIT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BIG_RGB_16_BIT);
		dualize(RETVAL, "B_BIG_RGB_16_BIT");
	OUTPUT:
		RETVAL

SV*
B_VIEWS_SUPPORT_DRAW_BITMAP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_VIEWS_SUPPORT_DRAW_BITMAP);
		dualize(RETVAL, "B_VIEWS_SUPPORT_DRAW_BITMAP");
	OUTPUT:
		RETVAL

SV*
B_BITMAPS_SUPPORT_ATTACHED_VIEWS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BITMAPS_SUPPORT_ATTACHED_VIEWS);
		dualize(RETVAL, "B_BITMAPS_SUPPORT_ATTACHED_VIEWS");
	OUTPUT:
		RETVAL

SV*
B_BITMAPS_SUPPORT_OVERLAY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BITMAPS_SUPPORT_OVERLAY);
		dualize(RETVAL, "B_BITMAPS_SUPPORT_OVERLAY");
	OUTPUT:
		RETVAL

SV*
B_BUFFER_TOP_TO_BOTTOM()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BUFFER_TOP_TO_BOTTOM);
		dualize(RETVAL, "B_BUFFER_TOP_TO_BOTTOM");
	OUTPUT:
		RETVAL

SV*
B_BUFFER_BOTTOM_TO_TOP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BUFFER_BOTTOM_TO_TOP);
		dualize(RETVAL, "B_BUFFER_BOTTOM_TO_TOP");
	OUTPUT:
		RETVAL

SV*
B_BUFFER_NONINTERLEAVED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BUFFER_NONINTERLEAVED);
		dualize(RETVAL, "B_BUFFER_NONINTERLEAVED");
	OUTPUT:
		RETVAL

SV*
B_OP_COPY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_COPY);
		dualize(RETVAL, "B_OP_COPY");
	OUTPUT:
		RETVAL

SV*
B_OP_OVER()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_OVER);
		dualize(RETVAL, "B_OP_OVER");
	OUTPUT:
		RETVAL

SV*
B_OP_ERASE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_ERASE);
		dualize(RETVAL, "B_OP_ERASE");
	OUTPUT:
		RETVAL

SV*
B_OP_INVERT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_INVERT);
		dualize(RETVAL, "B_OP_INVERT");
	OUTPUT:
		RETVAL

SV*
B_OP_ADD()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_ADD);
		dualize(RETVAL, "B_OP_ADD");
	OUTPUT:
		RETVAL

SV*
B_OP_SUBTRACT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_SUBTRACT);
		dualize(RETVAL, "B_OP_SUBTRACT");
	OUTPUT:
		RETVAL

SV*
B_OP_BLEND()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_BLEND);
		dualize(RETVAL, "B_OP_BLEND");
	OUTPUT:
		RETVAL

SV*
B_OP_MIN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_MIN);
		dualize(RETVAL, "B_OP_MIN");
	OUTPUT:
		RETVAL

SV*
B_OP_MAX()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_MAX);
		dualize(RETVAL, "B_OP_MAX");
	OUTPUT:
		RETVAL

SV*
B_OP_SELECT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_SELECT);
		dualize(RETVAL, "B_OP_SELECT");
	OUTPUT:
		RETVAL

SV*
B_OP_ALPHA()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OP_ALPHA);
		dualize(RETVAL, "B_OP_ALPHA");
	OUTPUT:
		RETVAL

SV*
B_PIXEL_ALPHA()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PIXEL_ALPHA);
		dualize(RETVAL, "B_PIXEL_ALPHA");
	OUTPUT:
		RETVAL

SV*
B_CONSTANT_ALPHA()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONSTANT_ALPHA);
		dualize(RETVAL, "B_CONSTANT_ALPHA");
	OUTPUT:
		RETVAL

SV*
B_ALPHA_OVERLAY()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALPHA_OVERLAY);
		dualize(RETVAL, "B_ALPHA_OVERLAY");
	OUTPUT:
		RETVAL

SV*
B_ALPHA_COMPOSITE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ALPHA_COMPOSITE);
		dualize(RETVAL, "B_ALPHA_COMPOSITE");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_640x480()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_640x480);
		dualize(RETVAL, "B_8_BIT_640x480");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_800x600()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_800x600);
		dualize(RETVAL, "B_8_BIT_800x600");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_1024x768()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_1024x768);
		dualize(RETVAL, "B_8_BIT_1024x768");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_1280x1024()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_1280x1024);
		dualize(RETVAL, "B_8_BIT_1280x1024");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_1600x1200()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_1600x1200);
		dualize(RETVAL, "B_8_BIT_1600x1200");
	OUTPUT:
		RETVAL

SV*
B_16_BIT_640x480()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_16_BIT_640x480);
		dualize(RETVAL, "B_16_BIT_640x480");
	OUTPUT:
		RETVAL

SV*
B_16_BIT_800x600()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_16_BIT_800x600);
		dualize(RETVAL, "B_16_BIT_800x600");
	OUTPUT:
		RETVAL

SV*
B_16_BIT_1024x768()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_16_BIT_1024x768);
		dualize(RETVAL, "B_16_BIT_1024x768");
	OUTPUT:
		RETVAL

SV*
B_16_BIT_1280x1024()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_16_BIT_1280x1024);
		dualize(RETVAL, "B_16_BIT_1280x1024");
	OUTPUT:
		RETVAL

SV*
B_16_BIT_1600x1200()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_16_BIT_1600x1200);
		dualize(RETVAL, "B_16_BIT_1600x1200");
	OUTPUT:
		RETVAL

SV*
B_32_BIT_640x480()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_32_BIT_640x480);
		dualize(RETVAL, "B_32_BIT_640x480");
	OUTPUT:
		RETVAL

SV*
B_32_BIT_800x600()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_32_BIT_800x600);
		dualize(RETVAL, "B_32_BIT_800x600");
	OUTPUT:
		RETVAL

SV*
B_32_BIT_1024x768()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_32_BIT_1024x768);
		dualize(RETVAL, "B_32_BIT_1024x768");
	OUTPUT:
		RETVAL

SV*
B_32_BIT_1280x1024()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_32_BIT_1280x1024);
		dualize(RETVAL, "B_32_BIT_1280x1024");
	OUTPUT:
		RETVAL

SV*
B_32_BIT_1600x1200()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_32_BIT_1600x1200);
		dualize(RETVAL, "B_32_BIT_1600x1200");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_1152x900()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_1152x900);
		dualize(RETVAL, "B_8_BIT_1152x900");
	OUTPUT:
		RETVAL

SV*
B_16_BIT_1152x900()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_16_BIT_1152x900);
		dualize(RETVAL, "B_16_BIT_1152x900");
	OUTPUT:
		RETVAL

SV*
B_32_BIT_1152x900()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_32_BIT_1152x900);
		dualize(RETVAL, "B_32_BIT_1152x900");
	OUTPUT:
		RETVAL

SV*
B_15_BIT_640x480()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_15_BIT_640x480);
		dualize(RETVAL, "B_15_BIT_640x480");
	OUTPUT:
		RETVAL

SV*
B_15_BIT_800x600()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_15_BIT_800x600);
		dualize(RETVAL, "B_15_BIT_800x600");
	OUTPUT:
		RETVAL

SV*
B_15_BIT_1024x768()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_15_BIT_1024x768);
		dualize(RETVAL, "B_15_BIT_1024x768");
	OUTPUT:
		RETVAL

SV*
B_15_BIT_1280x1024()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_15_BIT_1280x1024);
		dualize(RETVAL, "B_15_BIT_1280x1024");
	OUTPUT:
		RETVAL

SV*
B_15_BIT_1600x1200()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_15_BIT_1600x1200);
		dualize(RETVAL, "B_15_BIT_1600x1200");
	OUTPUT:
		RETVAL

SV*
B_15_BIT_1152x900()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_15_BIT_1152x900);
		dualize(RETVAL, "B_15_BIT_1152x900");
	OUTPUT:
		RETVAL

SV*
B_8_BIT_640x400()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_8_BIT_640x400);
		dualize(RETVAL, "B_8_BIT_640x400");
	OUTPUT:
		RETVAL

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::InterfaceKit::DEBUG

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
		
MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::InterfaceKit

BOOT:
	set_up_debug_sv("Haiku::InterfaceKit::DEBUG");
