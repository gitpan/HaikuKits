#
# Automatically generated file
#

package Haiku::View;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter Haiku::Handler);

my @event_mask_group = qw(B_POINTER_EVENTS B_KEYBOARD_EVENTS);
my @event_mask_options_group = qw(B_LOCK_WINDOW_FOCUS B_SUSPEND_VIEW_FOCUS B_NO_POINTER_HISTORY B_FULL_POINTER_HISTORY);
my @flags_group = qw(B_FULL_UPDATE_ON_RESIZE B_WILL_DRAW B_PULSE_NEEDED B_NAVIGABLE_JUMP B_FRAME_EVENTS B_NAVIGABLE B_SUBPIXEL_PRECISE B_DRAW_ON_CHILDREN B_INPUT_METHOD_AWARE B_SUPPORTS_LAYOUT B_INVALIDATE_AFTER_LAYOUT);
my @font_mask_group = qw(B_FONT_FAMILY_AND_STYLE B_FONT_SIZE B_FONT_SHEAR B_FONT_ROTATION B_FONT_SPACING B_FONT_ENCODING B_FONT_FACE B_FONT_FLAGS B_FONT_FALSE_BOLD_WIDTH B_FONT_ALL);
my @mouse_buttons_group = qw(B_PRIMARY_MOUSE_BUTTON B_SECONDARY_MOUSE_BUTTON B_TERTIARY_MOUSE_BUTTON);
my @mouse_transit_group = qw(B_ENTERED_VIEW B_INSIDE_VIEW B_EXITED_VIEW B_OUTSIDE_VIEW);
my @resizing_group = qw(B_FOLLOW_NONE B_FOLLOW_ALL_SIDES B_FOLLOW_ALL B_FOLLOW_LEFT B_FOLLOW_RIGHT B_FOLLOW_LEFT_RIGHT B_FOLLOW_H_CENTER B_FOLLOW_TOP B_FOLLOW_BOTTOM B_FOLLOW_TOP_BOTTOM B_FOLLOW_V_CENTER);
my @tracking_group = qw(B_TRACK_WHOLE_RECT B_TRACK_RECT_CORNER);

our %EXPORT_TAGS = (
	event_mask => [@event_mask_group],
	event_mask_options => [@event_mask_options_group],
	flags => [@flags_group],
	font_mask => [@font_mask_group],
	mouse_buttons => [@mouse_buttons_group],
	mouse_transit => [@mouse_transit_group],
	resizing => [@resizing_group],
	tracking => [@tracking_group]
);
our @EXPORT_OK = (@event_mask_group, @event_mask_options_group, @flags_group, @font_mask_group, @mouse_buttons_group, @mouse_transit_group, @resizing_group, @tracking_group);

#
# POD for Haiku::View::new
#

#
# POD for Haiku::View::newFromArchive
#

#
# POD for Haiku::View::DESTROY
#

#
# POD for Haiku::View::Instantiate
#

#
# POD for Haiku::View::Archive
#

#
# POD for Haiku::View::AllUnarchived
#

#
# POD for Haiku::View::AllArchived
#

#
# POD for Haiku::View::AddChild
#

#
# POD for Haiku::View::RemoveChild
#

#
# POD for Haiku::View::CountChildren
#

#
# POD for Haiku::View::ChildAt
#

#
# POD for Haiku::View::NextSibling
#

#
# POD for Haiku::View::PreviousSibling
#

#
# POD for Haiku::View::RemoveSelf
#

#
# POD for Haiku::View::Window
#

#
# POD for Haiku::View::BeginRectTracking
#

#
# POD for Haiku::View::EndRectTracking
#

#
# POD for Haiku::View::GetMouse
#

#
# POD for Haiku::View::WithRect
#

#
# POD for Haiku::View::FindView
#

#
# POD for Haiku::View::Parent
#

#
# POD for Haiku::View::Bounds
#

#
# POD for Haiku::View::Frame
#

#
# POD for Haiku::View::ConvertPointToScreen
#

#
# POD for Haiku::View::ConvertPointFromScreen
#

#
# POD for Haiku::View::ConvertRectToScreen
#

#
# POD for Haiku::View::ConvertRectFromScreen
#

#
# POD for Haiku::View::ConvertPointToParent
#

#
# POD for Haiku::View::ConvertPointFromParent
#

#
# POD for Haiku::View::ConvertRectToParent
#

#
# POD for Haiku::View::ConvertRectFromParent
#

#
# POD for Haiku::View::LeftTop
#

#
# POD for Haiku::View::ClipToPicture
#

#
# POD for Haiku::View::ClipToInversePicture
#

#
# POD for Haiku::View::SetDrawingMode
#

#
# POD for Haiku::View::DrawingMode
#

#
# POD for Haiku::View::SetBlendingMode
#

#
# POD for Haiku::View::GetBlendingMode
#

#
# POD for Haiku::View::SetPenSize
#

#
# POD for Haiku::View::PenSize
#

#
# POD for Haiku::View::SetViewCursor
#

#
# POD for Haiku::View::SetViewColor
#

#
# POD for Haiku::View::SetViewColorWithRGBA
#

#
# POD for Haiku::View::ViewColor
#

#
# POD for Haiku::View::ClearViewOverlay
#

#
# POD for Haiku::View::SetHighColor
#

#
# POD for Haiku::View::SetHighColorWithRGBA
#

#
# POD for Haiku::View::HighColor
#

#
# POD for Haiku::View::SetLowColor
#

#
# POD for Haiku::View::SetLowColorWithRGBA
#

#
# POD for Haiku::View::LowColor
#

#
# POD for Haiku::View::SetLineMode
#

#
# POD for Haiku::View::LineJoinMode
#

#
# POD for Haiku::View::LineCapMode
#

#
# POD for Haiku::View::LineMiterLimit
#

#
# POD for Haiku::View::SetOrigin
#

#
# POD for Haiku::View::SetOriginWithXY
#

#
# POD for Haiku::View::Origin
#

#
# POD for Haiku::View::PushState
#

#
# POD for Haiku::View::PopState
#

#
# POD for Haiku::View::MovePenTo
#

#
# POD for Haiku::View::MovePenToXY
#

#
# POD for Haiku::View::MovePenBy
#

#
# POD for Haiku::View::PenLocation
#

#
# POD for Haiku::View::StrokeLineFromPenLocation
#

#
# POD for Haiku::View::StrokeLine
#

#
# POD for Haiku::View::BeginLineArray
#

#
# POD for Haiku::View::AddLine
#

#
# POD for Haiku::View::EndLineArray
#

#
# POD for Haiku::View::StrokePolygon
#

#
# POD for Haiku::View::StrokePolygonFromPointArray
#

#
# POD for Haiku::View::StrokePolygonFromPointArrayWithinBounds
#

#
# POD for Haiku::View::FillPolygon
#

#
# POD for Haiku::View::FillPolygonFromPointArray
#

#
# POD for Haiku::View::FillPolygonFromPointArrayWithinBounds
#

#
# POD for Haiku::View::StrokeTriangle
#

#
# POD for Haiku::View::StrokeTriangleWithinBounds
#

#
# POD for Haiku::View::FillTriangle
#

#
# POD for Haiku::View::FillTriangleWithinBounds
#

#
# POD for Haiku::View::StrokeRect
#

#
# POD for Haiku::View::FillRect
#

#
# POD for Haiku::View::InvertRect
#

#
# POD for Haiku::View::StrokeRoundRect
#

#
# POD for Haiku::View::FillRoundRect
#

#
# POD for Haiku::View::StrokeEllipse
#

#
# POD for Haiku::View::StrokeEllipseFromRect
#

#
# POD for Haiku::View::FillEllipse
#

#
# POD for Haiku::View::FillEllipseFromRect
#

#
# POD for Haiku::View::StrokeArc
#

#
# POD for Haiku::View::StrokeArcFromRect
#

#
# POD for Haiku::View::FillArc
#

#
# POD for Haiku::View::FillArcFromRect
#

#
# POD for Haiku::View::StrokeBezier
#

#
# POD for Haiku::View::FillBezier
#

#
# POD for Haiku::View::StrokeShape
#

#
# POD for Haiku::View::FillShape
#

#
# POD for Haiku::View::CopyBits
#

#
# POD for Haiku::View::DrawChar
#

#
# POD for Haiku::View::DrawCharToPoint
#

#
# POD for Haiku::View::DrawString
#

#
# POD for Haiku::View::DrawStringToPoint
#

#
# POD for Haiku::View::DrawStringWithLength
#

#
# POD for Haiku::View::DrawStringWithLengthToPoint
#

#
# POD for Haiku::View::DrawStringToPointArray
#

#
# POD for Haiku::View::DrawStringWithLengthToPointArray
#

#
# POD for Haiku::View::SetFont
#

#
# POD for Haiku::View::GetFont
#

#
# POD for Haiku::View::StringWidth
#

#
# POD for Haiku::View::StringWidthWithLength
#

#
# POD for Haiku::View::GetStringWidths
#

#
# POD for Haiku::View::SetFontSize
#

#
# POD for Haiku::View::ForceFontAliasing
#

#
# POD for Haiku::View::GetFontHeight
#

#
# POD for Haiku::View::Invalidate
#

#
# POD for Haiku::View::InavlidateRect
#

#
# POD for Haiku::View::SetDiskMode
#

#
# POD for Haiku::View::BeginPicture
#

#
# POD for Haiku::View::AppendToPicture
#

#
# POD for Haiku::View::EndPicture
#

#
# POD for Haiku::View::DrawPicture
#

#
# POD for Haiku::View::DrawPictureToPoint
#

#
# POD for Haiku::View::DrawPictureFromFile
#

#
# POD for Haiku::View::DrawPictureAsync
#

#
# POD for Haiku::View::DrawPictureAsyncToPoint
#

#
# POD for Haiku::View::DrawPictureAsyncFromFile
#

#
# POD for Haiku::View::SetEventMask
#

#
# POD for Haiku::View::EventMask
#

#
# POD for Haiku::View::SetMouseEventMask
#

#
# POD for Haiku::View::SetFlags
#

#
# POD for Haiku::View::Flags
#

#
# POD for Haiku::View::SetResizingMode
#

#
# POD for Haiku::View::ResizingMode
#

#
# POD for Haiku::View::MoveBy
#

#
# POD for Haiku::View::MoveTo
#

#
# POD for Haiku::View::ResizeBy
#

#
# POD for Haiku::View::ResizeTo
#

#
# POD for Haiku::View::ScrollBy
#

#
# POD for Haiku::View::ScrollTo
#

#
# POD for Haiku::View::MakeFocus
#

#
# POD for Haiku::View::IsFocus
#

#
# POD for Haiku::View::Show
#

#
# POD for Haiku::View::Hide
#

#
# POD for Haiku::View::IsHidden
#

#
# POD for Haiku::View::Flush
#

#
# POD for Haiku::View::Sync
#

#
# POD for Haiku::View::GetPreferredSize
#

#
# POD for Haiku::View::ResizeToPreferred
#

#
# POD for Haiku::View::ScrollBar
#

#
# POD for Haiku::View::ResolveSpecifier
#

#
# POD for Haiku::View::GetSupportedSuites
#

#
# POD for Haiku::View::IsPrinting
#

#
# POD for Haiku::View::SetScale
#

#
# POD for Haiku::View::Scale
#

#
# POD for Haiku::View::DrawAfterChildren
#

#
# POD for Haiku::View::HasHeightForWidth
#

#
# POD for Haiku::View::GetHeightForWidth
#

#
# POD for Haiku::View::InvalidateLayout
#

#
# POD for Haiku::View::EnableLayoutInvalidation
#

#
# POD for Haiku::View::DisableLayoutInvalidation
#

#
# POD for Haiku::View::IsLayoutValid
#

#
# POD for Haiku::View::ResetLayoutInvalidation
#

#
# POD for Haiku::View::Layout
#

#
# POD for Haiku::View::Relayout
#

#
# POD for Haiku::View::SetTooltipWithText
#

#
# POD for Haiku::View::ShowToolTip
#

#
# POD for Haiku::View::HideToolTip
#

1;
