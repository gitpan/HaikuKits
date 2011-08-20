/*
 * Automatically generated file
 */
 
#include <Application.h>
#include <Alert.h>
#include <Bitmap.h>
#include <Box.h>
#include <Button.h>
#include <ChannelControl.h>
#include <ChannelSlider.h>
#include <CheckBox.h>
#include <ColorControl.h>
#include <Control.h>
#include <Font.h>
#include <Gradient.h>
#include <GradientConic.h>
#include <GradientDiamond.h>
#include <GradientLinear.h>
#include <GradientRadial.h>
#include <GradientRadialFocus.h>
#include <GraphicsDefs.h>
#include <IconUtils.h>
#include <InterfaceDefs.h>
#include <Menu.h>
#include <ListItem.h>
#include <ListView.h>
#include <MenuBar.h>
#include <MenuField.h>
#include <MenuItem.h>
#include <OptionControl.h>
#include <OptionPopUp.h>
#include <OutlineListView.h>
#include <Picture.h>
#include <PictureButton.h>
#include <Point.h>
#include <Polygon.h>
#include <PopUpMenu.h>
#include <RadioButton.h>
#include <Rect.h>
#include <Screen.h>
#include <ScrollBar.h>
#include <ScrollView.h>
#include <SeparatorItem.h>
#include <Shape.h>
#include <Slider.h>
#include <StatusBar.h>
#include <StringItem.h>
#include <StringView.h>
#include <TabView.h>
#include <TextControl.h>
#include <TextView.h>
#include <UnicodeBlockObjects.h>
#include <View.h>
#include <Window.h>

// xsubpp will mangle qualified types in INPUT, so we provide a workaround
typedef BMenu::add_state BMenu__add_state;

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

