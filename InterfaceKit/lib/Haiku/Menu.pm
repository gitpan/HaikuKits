#
# Automatically generated file
#

package Haiku::Menu;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter Haiku::View);

my @exported_functions = qw(get_menu_info set_menu_info);

my @add_state_group = qw(B_INITIAL_ADD B_PROCESSING B_ABORT);
my @menu_layout_group = qw(B_ITEMS_IN_ROW B_ITEMS_IN_COLUMN B_ITEMS_IN_MATRIX);

our %EXPORT_TAGS = (
	add_state => [@add_state_group],
	menu_layout => [@menu_layout_group]
);
our @EXPORT_OK = (@exported_functions, @add_state_group, @menu_layout_group);

#
# POD for Haiku::Menu::new
#

#
# POD for Haiku::Menu::newMatrixMenu
#

#
# POD for Haiku::Menu::newFromArchive
#

#
# POD for Haiku::Menu::DESTROY
#

#
# POD for Haiku::Menu::Instantiate
#

#
# POD for Haiku::Menu::Archive
#

#
# POD for Haiku::Menu::GetPreferredSize
#

#
# POD for Haiku::Menu::ResizeToPreferred
#

#
# POD for Haiku::Menu::DoLayout
#

#
# POD for Haiku::Menu::InvalidateLayout
#

#
# POD for Haiku::Menu::MakeFocus
#

#
# POD for Haiku::Menu::AddItem
#

#
# POD for Haiku::Menu::AddItemAtIndex
#

#
# POD for Haiku::Menu::ToMatrix
#

#
# POD for Haiku::Menu::AddSubmenu
#

#
# POD for Haiku::Menu::AddSubmenuAtIndex
#

#
# POD for Haiku::Menu::AddSubmenuToMatrix
#

#
# POD for Haiku::Menu::AddSeparatorItem
#

#
# POD for Haiku::Menu::RemoveItem
#

#
# POD for Haiku::Menu::RemoveSubmenu
#

#
# POD for Haiku::Menu::RemoveItemAtIndex
#

#
# POD for Haiku::Menu::RemoveItems
#

#
# POD for Haiku::Menu::ItemAt
#

#
# POD for Haiku::Menu::SubmenuAt
#

#
# POD for Haiku::Menu::CountItems
#

#
# POD for Haiku::Menu::IndexOf
#

#
# POD for Haiku::Menu::IndexOfSubmenu
#

#
# POD for Haiku::Menu::FindItem
#

#
# POD for Haiku::Menu::FindItemByCommand
#

#
# POD for Haiku::Menu::SetTargetForItems
#

#
# POD for Haiku::Menu::SetMessengerTargetForItems
#

#
# POD for Haiku::Menu::SetEnabled
#

#
# POD for Haiku::Menu::SetRadioMode
#

#
# POD for Haiku::Menu::SetTriggersEnabled
#

#
# POD for Haiku::Menu::SetMaxContentWidth
#

#
# POD for Haiku::Menu::SetLabelFromMarked
#

#
# POD for Haiku::Menu::IsLabelFromMarked
#

#
# POD for Haiku::Menu::IsEnabled
#

#
# POD for Haiku::Menu::IsRadioMode
#

#
# POD for Haiku::Menu::AreTriggersEnabled
#

#
# POD for Haiku::Menu::IsRedrawAfterSticky
#

#
# POD for Haiku::Menu::MaxContentWidth
#

#
# POD for Haiku::Menu::FindMarked
#

#
# POD for Haiku::Menu::Supermenu
#

#
# POD for Haiku::Menu::Superitem
#

#
# POD for Haiku::Menu::ResolveSpecifier
#

#
# POD for Haiku::Menu::GetSupportedSuites
#

#
# POD for Haiku::Menu::AddDynamicItem
#

#
# POD for Haiku::Menu::DrawBackground
#

#
# POD for Haiku::Menu::get_menu_info
#

#
# POD for Haiku::Menu::set_menu_info
#

1;
