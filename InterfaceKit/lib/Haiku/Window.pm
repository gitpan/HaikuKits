#
# Automatically generated file
#

package Haiku::Window;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter Haiku::Looper);

my @window_alignment_group = qw(B_BYTE_ALIGNMENT B_PIXEL_ALIGNMENT);
my @window_feel_group = qw(B_NORMAL_WINDOW_FEEL B_MODAL_SUBSET_WINDOW_FEEL B_MODAL_APP_WINDOW_FEEL B_MODAL_ALL_WINDOW_FEEL B_FLOATING_SUBSET_WINDOW_FEEL B_FLOATING_APP_WINDOW_FEEL B_FLOATING_ALL_WINDOW_FEEL);
my @window_flags_group = qw(B_NOT_MOVABLE B_NOT_CLOSABLE B_NOT_ZOOMABLE B_NOT_MINIMIZABLE B_NOT_RESIZABLE B_NOT_H_RESIZABLE B_NOT_V_RESIZABLE B_AVOID_FRONT B_AVOID_FOCUS B_WILL_ACCEPT_FIRST_CLICK B_OUTLINE_RESIZE B_NO_WORKSPACE_ACTIVATION B_NOT_ANCHORED_ON_ACTIVATE B_ASYNCHRONOUS_CONTROLS B_QUIT_ON_WINDOW_CLOSE B_SAME_POSITION_IN_ALL_WORKSPACES B_AUTO_UPDATE_SIZE_LIMITS B_CLOSE_ON_ESCAPE B_NO_SERVER_SIDE_WINDOW_MODIFIERS);
my @window_look_group = qw(B_BORDERED_WINDOW_LOOK B_NO_BORDER_WINDOW_LOOK B_TITLED_WINDOW_LOOK B_DOCUMENT_WINDOW_LOOK B_MODAL_WINDOW_LOOK B_FLOATING_WINDOW_LOOK);
my @window_type_group = qw(B_UNTYPED_WINDOW B_TITLED_WINDOW B_MODAL_WINDOW B_DOCUMENT_WINDOW B_BORDERED_WINDOW B_FLOATING_WINDOW);
my @workspaces_group = qw(B_CURRENT_WORKSPACE B_ALL_WORKSPACES);

our %EXPORT_TAGS = (
	window_alignment => [@window_alignment_group],
	window_feel => [@window_feel_group],
	window_flags => [@window_flags_group],
	window_look => [@window_look_group],
	window_type => [@window_type_group],
	workspaces => [@workspaces_group]
);
our @EXPORT_OK = (@window_alignment_group, @window_feel_group, @window_flags_group, @window_look_group, @window_type_group, @workspaces_group);

#
# POD for Haiku::Window::new
#

#
# POD for Haiku::Window::newFromLookAndFeel
#

#
# POD for Haiku::Window::newFromArchive
#

#
# POD for Haiku::Window::DESTROY
#

#
# POD for Haiku::Window::Instantiate
#

#
# POD for Haiku::Window::Archive
#

#
# POD for Haiku::Window::Quit
#

#
# POD for Haiku::Window::Close
#

#
# POD for Haiku::Window::AddChild
#

#
# POD for Haiku::Window::RemoveChild
#

#
# POD for Haiku::Window::CountChildren
#

#
# POD for Haiku::Window::ChildAt
#

#
# POD for Haiku::Window::DispatchMessage
#

#
# POD for Haiku::Window::Minimize
#

#
# POD for Haiku::Window::DoZoom
#

#
# POD for Haiku::Window::SetZoomLimits
#

#
# POD for Haiku::Window::SetPulseRate
#

#
# POD for Haiku::Window::PulseRate
#

#
# POD for Haiku::Window::AddShortcut
#

#
# POD for Haiku::Window::AddShortcutWithTarget
#

#
# POD for Haiku::Window::RemoveShortcut
#

#
# POD for Haiku::Window::SetDefaultButton
#

#
# POD for Haiku::Window::DefaultButton
#

#
# POD for Haiku::Window::NeedsUpdate
#

#
# POD for Haiku::Window::UpdateIfNeeded
#

#
# POD for Haiku::Window::FindView
#

#
# POD for Haiku::Window::FindViewAtPoint
#

#
# POD for Haiku::Window::CurrentFocus
#

#
# POD for Haiku::Window::Activate
#

#
# POD for Haiku::Window::ConvertPointToScreen
#

#
# POD for Haiku::Window::ConvertPointFromScreen
#

#
# POD for Haiku::Window::ConvertRectToScreen
#

#
# POD for Haiku::Window::ConvertRectFromScreen
#

#
# POD for Haiku::Window::MoveBy
#

#
# POD for Haiku::Window::MoveTo
#

#
# POD for Haiku::Window::MoveToPoint
#

#
# POD for Haiku::Window::ResizeBy
#

#
# POD for Haiku::Window::ResizeTo
#

#
# POD for Haiku::Window::CenterIn
#

#
# POD for Haiku::Window::CenterOnScreen
#

#
# POD for Haiku::Window::Show
#

#
# POD for Haiku::Window::Hide
#

#
# POD for Haiku::Window::IsHidden
#

#
# POD for Haiku::Window::IsMinimized
#

#
# POD for Haiku::Window::Flush
#

#
# POD for Haiku::Window::Sync
#

#
# POD for Haiku::Window::SendBehind
#

#
# POD for Haiku::Window::DisableUpdates
#

#
# POD for Haiku::Window::EnableUpdates
#

#
# POD for Haiku::Window::BeginViewTransaction
#

#
# POD for Haiku::Window::EndViewTransaction
#

#
# POD for Haiku::Window::InViewTransaction
#

#
# POD for Haiku::Window::Bounds
#

#
# POD for Haiku::Window::Frame
#

#
# POD for Haiku::Window::DecoratorFrame
#

#
# POD for Haiku::Window::Title
#

#
# POD for Haiku::Window::SetTitle
#

#
# POD for Haiku::Window::IsFront
#

#
# POD for Haiku::Window::IsActive
#

#
# POD for Haiku::Window::SetKeyMenuBar
#

#
# POD for Haiku::Window::KeyMenuBar
#

#
# POD for Haiku::Window::SetSizeLimits
#

#
# POD for Haiku::Window::GetSizeLimits
#

#
# POD for Haiku::Window::UpdateSizeLimits
#

#
# POD for Haiku::Window::SetDecoratorSettings
#

#
# POD for Haiku::Window::GetDecoratorSettings
#

#
# POD for Haiku::Window::SetWorkspaces
#

#
# POD for Haiku::Window::Workspaces
#

#
# POD for Haiku::Window::LastMouseMovedView
#

#
# POD for Haiku::Window::ResolveSpecifier
#

#
# POD for Haiku::Window::GetSupportedSuites
#

#
# POD for Haiku::Window::AddToSubset
#

#
# POD for Haiku::Window::RemoveFromSubset
#

#
# POD for Haiku::Window::SetType
#

#
# POD for Haiku::Window::Type
#

#
# POD for Haiku::Window::SetLook
#

#
# POD for Haiku::Window::Look
#

#
# POD for Haiku::Window::SetFeel
#

#
# POD for Haiku::Window::Feel
#

#
# POD for Haiku::Window::SetFlags
#

#
# POD for Haiku::Window::Flags
#

#
# POD for Haiku::Window::IsFloating
#

#
# POD for Haiku::Window::IsModal
#

#
# POD for Haiku::Window::SetWindowAlignment
#

#
# POD for Haiku::Window::GetWindowAlignment
#

#
# POD for Haiku::Window::Run
#

#
# POD for Haiku::Window::InvalidateLayout
#

1;
