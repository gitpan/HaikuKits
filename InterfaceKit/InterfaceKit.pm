#
# Automatically generated file
#

package Haiku::InterfaceKit;
use strict;
use warnings;
require Exporter;
require DynaLoader;

use Haiku::Window;
use Haiku::CustomWindow;
use Haiku::Alert;
use Haiku::View;
use Haiku::Box;
use Haiku::Control;
use Haiku::Button;
use Haiku::CheckBox;
use Haiku::ColorControl;
use Haiku::PictureButton;
use Haiku::RadioButton;
use Haiku::Slider;
use Haiku::TextControl;
use Haiku::ListView;
use Haiku::OutlineListView;
use Haiku::Menu;
use Haiku::menu_info;
use Haiku::MenuBar;
use Haiku::PopUpMenu;
use Haiku::MenuField;
use Haiku::ScrollBar;
use Haiku::ScrollView;
use Haiku::StatusBar;
use Haiku::StringView;
use Haiku::TabView;
use Haiku::Tab;
use Haiku::TextView;
use Haiku::CustomTextView;
use Haiku::text_run;
use Haiku::text_run_array;
use Haiku::MenuItem;
use Haiku::SeparatorItem;
use Haiku::ListItem;
use Haiku::StringItem;
use Haiku::Font;
use Haiku::unicode_block;
use Haiku::edge_info;
use Haiku::font_height;
use Haiku::escapement_delta;
use Haiku::font_cache_info;
use Haiku::tuned_font_info;
use Haiku::Picture;
use Haiku::Point;
use Haiku::Polygon;
use Haiku::Rect;
use Haiku::Screen;
use Haiku::Shape;
use Haiku::ShapeIterator;
use Haiku::key_info;
use Haiku::key_map;
use Haiku::mouse_map;
use Haiku::scroll_bar_info;
use Haiku::pattern;
use Haiku::rgb_color;
use Haiku::color_map;
use Haiku::overlay_rect_limits;
use Haiku::overlay_restrictions;
use Haiku::screen_id;

our $VERSION = 0.01;
our @ISA = qw(DynaLoader Exporter);

my @exported_functions = qw(get_deskbar_frame system_colors get_scroll_bar_info set_scroll_bar_info get_mouse_type set_mouse_type get_mouse_map set_mouse_map get_click_speed set_click_speed get_mouse_speed set_mouse_speed get_mouse_acceleration set_mouse_acceleration get_key_repeat_rate set_key_repeat_rate get_key_repeat_delay set_key_repeat_delay modifiers get_key_info get_key_map get_keyboard_id get_modifier_key set_modifier_key set_keyboard_locks keyboard_navigation_color count_workspaces set_workspace_count current_workspace activate_workspace idle_time run_select_printer_panel run_add_printer_panel run_be_about set_focus_follows_mouse focus_follows_mouse set_mouse_mode mouse_mode set_focus_follows_mouse_mode focus_follows_mouse_mode get_mouse set_accept_first_click accept_first_click ui_color set_ui_color tint_color make_color bitmaps_support_space get_pixel_size_for);

my @alignment_group = qw(B_ALIGN_LEFT B_ALIGN_RIGHT B_ALIGN_CENTER B_ALIGN_HORIZONTAL_CENTER B_ALIGN_HORIZONTAL_UNSET B_ALIGN_USE_FULL_WIDTH);
my @alpha_function_group = qw(B_ALPHA_OVERLAY B_ALPHA_COMPOSITE);
my @bitmap_drawing_options_group = qw(B_FILTER_BITMAP_BILINEAR B_WAIT_FOR_RETRACE);
my @bitmap_support_group = qw(B_VIEWS_SUPPORT_DRAW_BITMAP B_BITMAPS_SUPPORT_ATTACHED_VIEWS B_BITMAPS_SUPPORT_OVERLAY);
my @bitmap_tiling_group = qw(B_TILE_BITMAP_X B_TILE_BITMAP_Y B_TILE_BITMAP);
my @border_style_group = qw(B_PLAIN_BORDER B_FANCY_BORDER B_NO_BORDER);
my @buffer_layout_group = qw(B_BUFFER_NONINTERLEAVED);
my @buffer_orientation_group = qw(B_BUFFER_TOP_TO_BOTTOM B_BUFFER_BOTTOM_TO_TOP);
my @button_width_group = qw(B_WIDTH_AS_USUAL B_WIDTH_FROM_WIDEST B_WIDTH_FROM_LABEL);
my @cap_mode_group = qw(B_ROUND_CAP B_BUTT_CAP B_SQUARE_CAP);
my @color_space_group = qw(B_NO_COLOR_SPACE B_RGB32 B_RGBA32 B_RGB24 B_RGB16 B_RGB15 B_RGBA15 B_CMAP8 B_GRAY8 B_GRAY1 B_RGB32_BIG B_RGBA32_BIG B_RGB24_BIG B_RGB16_BIG B_RGB15_BIG B_RGBA15_BIG B_RGB32_LITTLE B_RGBA32_LITTLE B_RGB24_LITTLE B_RGB16_LITTLE B_RGB15_LITTLE B_RGBA15_LITTLE B_YCbCr422 B_YCbCr411 B_YCbCr444 B_YCbCr420 B_YUV422 B_YUV411 B_YUV444 B_YUV420 B_YUV9 B_YUV12 B_UVL24 B_UVL32 B_UVLA32 B_LAB24 B_LAB32 B_LABA32 B_HSI24 B_HSI32 B_HSIA32 B_HSV24 B_HSV32 B_HSVA32 B_HLS24 B_HLS32 B_HLSA32 B_CMY24 B_CMY32 B_CMYA32 B_CMYK32 B_MONOCHROME_1_BIT B_GRAYSCALE_8_BIT B_COLOR_8_BIT B_RGB_32_BIT B_RGB_16_BIT B_BIG_RGB_32_BIT B_BIG_RGB_16_BIT);
my @color_which_group = qw(B_PANEL_BACKGROUND_COLOR B_PANEL_TEXT_COLOR B_DOCUMENT_BACKGROUND_COLOR B_DOCUMENT_TEXT_COLOR B_CONTROL_BACKGROUND_COLOR B_CONTROL_TEXT_COLOR B_CONTROL_BORDER_COLOR B_CONTROL_HIGHLIGHT_COLOR B_NAVIGATION_BASE_COLOR B_NAVIGATION_PULSE_COLOR B_SHINE_COLOR B_SHADOW_COLOR B_MENU_BACKGROUND_COLOR B_MENU_SELECTED_BACKGROUND_COLOR B_MENU_ITEM_TEXT_COLOR B_MENU_SELECTED_ITEM_TEXT_COLOR B_MENU_SELECTED_BORDER_COLOR B_TOOL_TIP_BACKGROUND_COLOR B_TOOL_TIP_TEXT_COLOR B_SUCCESS_COLOR B_FAILURE_COLOR B_KEYBOARD_NAVIGATION_COLOR B_MENU_SELECTION_BACKGROUND_COLOR B_DESKTOP_COLOR B_WINDOW_TAB_COLOR B_WINDOW_TEXT_COLOR B_WINDOW_INACTIVE_TAB_COLOR B_WINDOW_INACTIVE_TEXT_COLOR);
my @drawing_mode_group = qw(B_OP_COPY B_OP_OVER B_OP_ERASE B_OP_INVERT B_OP_ADD B_OP_SUBTRACT B_OP_BLEND B_OP_MIN B_OP_MAX B_OP_SELECT B_OP_ALPHA);
my @fixed_screen_group = qw(B_8_BIT_640x480 B_8_BIT_800x600 B_8_BIT_1024x768 B_8_BIT_1280x1024 B_8_BIT_1600x1200 B_16_BIT_640x480 B_16_BIT_800x600 B_16_BIT_1024x768 B_16_BIT_1280x1024 B_16_BIT_1600x1200 B_32_BIT_640x480 B_32_BIT_800x600 B_32_BIT_1024x768 B_32_BIT_1280x1024 B_32_BIT_1600x1200 B_8_BIT_1152x900 B_16_BIT_1152x900 B_32_BIT_1152x900 B_15_BIT_640x480 B_15_BIT_800x600 B_15_BIT_1024x768 B_15_BIT_1280x1024 B_15_BIT_1600x1200 B_15_BIT_1152x900 B_8_BIT_640x400);
my @join_mode_group = qw(B_ROUND_JOIN B_MITER_JOIN B_BEVEL_JOIN B_BUTT_JOIN B_SQUARE_JOIN);
my @keymap_group = qw(B_CONTROL_TABLE B_OPTION_CAPS_SHIFT_TABLE B_OPTION_CAPS_TABLE B_OPTION_SHIFT_TABLE B_OPTION_TABLE B_CAPS_SHIFT_TABLE B_CAPS_TABLE B_SHIFT_TABLE B_NORMAL_TABLE);
my @keys_group = qw(B_BACKSPACE B_RETURN B_ENTER B_SPACE B_TAB B_ESCAPE B_SUBSTITUTE B_LEFT_ARROW B_RIGHT_ARROW B_UP_ARROW B_DOWN_ARROW B_INSERT B_DELETE B_HOME B_END B_PAGE_UP B_PAGE_DOWN B_FUNCTION_KEY B_KATAKANA_HIRAGANA B_HANKAKU_ZENKAKU B_F1_KEY B_F2_KEY B_F3_KEY B_F4_KEY B_F5_KEY B_F6_KEY B_F7_KEY B_F8_KEY B_F9_KEY B_F10_KEY B_F11_KEY B_F12_KEY B_PRINT_KEY B_SCROLL_KEY B_PAUSE_KEY);
my @mode_focus_follows_mouse_group = qw(B_NORMAL_FOCUS_FOLLOWS_MOUSE B_WARP_FOCUS_FOLLOWS_MOUSE B_INSTANT_WARP_FOCUS_FOLLOWS_MOUSE);
my @mode_mouse_group = qw(B_NORMAL_MOUSE B_CLICK_TO_FOCUS_MOUSE B_FOCUS_FOLLOWS_MOUSE);
my @modifiers_group = qw(B_SHIFT_KEY B_COMMAND_KEY B_CONTROL_KEY B_CAPS_LOCK B_SCROLL_LOCK B_NUM_LOCK B_OPTION_KEY B_MENU_KEY B_LEFT_SHIFT_KEY B_RIGHT_SHIFT_KEY B_LEFT_COMMAND_KEY B_RIGHT_COMMAND_KEY B_LEFT_CONTROL_KEY B_RIGHT_CONTROL_KEY B_LEFT_OPTION_KEY B_RIGHT_OPTION_KEY);
my @orientation_group = qw(B_HORIZONTAL B_VERTICAL);
my @overlay_options_group = qw(B_OVERLAY_FILTER_HORIZONTAL B_OVERLAY_FILTER_VERTICAL B_OVERLAY_MIRROR B_OVERLAY_TRANSFER_CHANNEL);
my @patterns_group = qw(B_SOLID_HIGH B_MIXED_COLORS B_SOLID_LOW);
my @source_alpha_group = qw(B_PIXEL_ALPHA B_CONSTANT_ALPHA);
my @tinting_group = qw(B_LIGHTEN_MAX_TINT B_LIGHTEN_2_TINT B_LIGHTEN_1_TINT B_NO_TINT B_DARKEN_1_TINT B_DARKEN_2_TINT B_DARKEN_3_TINT B_DARKEN_4_TINT B_DARKEN_MAX_TINT B_DISABLED_LABEL_TINT B_HIGHLIGHT_BACKGROUND_TINT B_DISABLED_MARK_TINT);
my @transparency_group = qw(B_TRANSPARENT_COLOR B_TRANSPARENT_MAGIC_CMAP8 B_TRANSPARENT_MAGIC_RGBA15 B_TRANSPARENT_MAGIC_RGBA15_BIG B_TRANSPARENT_MAGIC_RGBA32 B_TRANSPARENT_MAGIC_RGBA32_BIG B_TRANSPARENT_8_BIT);
my @utf8_group = qw(B_UTF8_BULLET B_UTF8_ELLIPSIS B_UTF8_OPEN_QUOTE B_UTF8_CLOSE_QUOTE B_UTF8_COPYRIGHT B_UTF8_REGISTERED B_UTF8_TRADEMARK B_UTF8_SMILING_FACE B_UTF8_HIROSHI);
my @vertical_alignment_group = qw(B_ALIGN_TOP B_ALIGN_MIDDLE B_ALIGN_BOTTOM B_ALIGN_VERTICAL_CENTER B_ALIGN_VERTICAL_UNSET B_ALIGN_NO_VERTICAL B_ALIGN_USE_FULL_HEIGHT);

our %EXPORT_TAGS = (
	alignment => [@alignment_group],
	alpha_function => [@alpha_function_group],
	bitmap_drawing_options => [@bitmap_drawing_options_group],
	bitmap_support => [@bitmap_support_group],
	bitmap_tiling => [@bitmap_tiling_group],
	border_style => [@border_style_group],
	buffer_layout => [@buffer_layout_group],
	buffer_orientation => [@buffer_orientation_group],
	button_width => [@button_width_group],
	cap_mode => [@cap_mode_group],
	color_space => [@color_space_group],
	color_which => [@color_which_group],
	drawing_mode => [@drawing_mode_group],
	fixed_screen => [@fixed_screen_group],
	join_mode => [@join_mode_group],
	keymap => [@keymap_group],
	keys => [@keys_group],
	mode_focus_follows_mouse => [@mode_focus_follows_mouse_group],
	mode_mouse => [@mode_mouse_group],
	modifiers => [@modifiers_group],
	orientation => [@orientation_group],
	overlay_options => [@overlay_options_group],
	patterns => [@patterns_group],
	source_alpha => [@source_alpha_group],
	tinting => [@tinting_group],
	transparency => [@transparency_group],
	utf8 => [@utf8_group],
	vertical_alignment => [@vertical_alignment_group]
);
our @EXPORT_OK = (@exported_functions, @alignment_group, @alpha_function_group, @bitmap_drawing_options_group, @bitmap_support_group, @bitmap_tiling_group, @border_style_group, @buffer_layout_group, @buffer_orientation_group, @button_width_group, @cap_mode_group, @color_space_group, @color_which_group, @drawing_mode_group, @fixed_screen_group, @join_mode_group, @keymap_group, @keys_group, @mode_focus_follows_mouse_group, @mode_mouse_group, @modifiers_group, @orientation_group, @overlay_options_group, @patterns_group, @source_alpha_group, @tinting_group, @transparency_group, @utf8_group, @vertical_alignment_group);

#
# POD for Haiku::InterfaceKit::get_deskbar_frame
#

#
# POD for Haiku::InterfaceKit::system_colors
#

#
# POD for Haiku::InterfaceKit::get_scroll_bar_info
#

#
# POD for Haiku::InterfaceKit::set_scroll_bar_info
#

#
# POD for Haiku::InterfaceKit::get_mouse_type
#

#
# POD for Haiku::InterfaceKit::set_mouse_type
#

#
# POD for Haiku::InterfaceKit::get_mouse_map
#

#
# POD for Haiku::InterfaceKit::set_mouse_map
#

#
# POD for Haiku::InterfaceKit::get_click_speed
#

#
# POD for Haiku::InterfaceKit::set_click_speed
#

#
# POD for Haiku::InterfaceKit::get_mouse_speed
#

#
# POD for Haiku::InterfaceKit::set_mouse_speed
#

#
# POD for Haiku::InterfaceKit::get_mouse_acceleration
#

#
# POD for Haiku::InterfaceKit::set_mouse_acceleration
#

#
# POD for Haiku::InterfaceKit::get_key_repeat_rate
#

#
# POD for Haiku::InterfaceKit::set_key_repeat_rate
#

#
# POD for Haiku::InterfaceKit::get_key_repeat_delay
#

#
# POD for Haiku::InterfaceKit::set_key_repeat_delay
#

#
# POD for Haiku::InterfaceKit::modifiers
#

#
# POD for Haiku::InterfaceKit::get_key_info
#

#
# POD for Haiku::InterfaceKit::get_key_map
#

#
# POD for Haiku::InterfaceKit::get_keyboard_id
#

#
# POD for Haiku::InterfaceKit::get_modifier_key
#

#
# POD for Haiku::InterfaceKit::set_modifier_key
#

#
# POD for Haiku::InterfaceKit::set_keyboard_locks
#

#
# POD for Haiku::InterfaceKit::keyboard_navigation_color
#

#
# POD for Haiku::InterfaceKit::count_workspaces
#

#
# POD for Haiku::InterfaceKit::set_workspace_count
#

#
# POD for Haiku::InterfaceKit::current_workspace
#

#
# POD for Haiku::InterfaceKit::activate_workspace
#

#
# POD for Haiku::InterfaceKit::idle_time
#

#
# POD for Haiku::InterfaceKit::run_select_printer_panel
#

#
# POD for Haiku::InterfaceKit::run_add_printer_panel
#

#
# POD for Haiku::InterfaceKit::run_be_about
#

#
# POD for Haiku::InterfaceKit::set_focus_follows_mouse
#

#
# POD for Haiku::InterfaceKit::focus_follows_mouse
#

#
# POD for Haiku::InterfaceKit::set_mouse_mode
#

#
# POD for Haiku::InterfaceKit::mouse_mode
#

#
# POD for Haiku::InterfaceKit::set_focus_follows_mouse_mode
#

#
# POD for Haiku::InterfaceKit::focus_follows_mouse_mode
#

#
# POD for Haiku::InterfaceKit::get_mouse
#

#
# POD for Haiku::InterfaceKit::set_accept_first_click
#

#
# POD for Haiku::InterfaceKit::accept_first_click
#

#
# POD for Haiku::InterfaceKit::ui_color
#

#
# POD for Haiku::InterfaceKit::set_ui_color
#

#
# POD for Haiku::InterfaceKit::tint_color
#

#
# POD for Haiku::InterfaceKit::make_color
#

#
# POD for Haiku::InterfaceKit::bitmaps_support_space
#

#
# POD for Haiku::InterfaceKit::get_pixel_size_for
#

bootstrap Haiku::InterfaceKit $VERSION;

1;
