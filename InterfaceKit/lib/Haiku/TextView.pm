#
# Automatically generated file
#

package Haiku::TextView;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter Haiku::View);

my @undo_state_group = qw(B_UNDO_UNAVAILABLE B_UNDO_TYPING B_UNDO_CUT B_UNDO_PASTE B_UNDO_CLEAR B_UNDO_DROP);

our %EXPORT_TAGS = (
	undo_state => [@undo_state_group]
);
our @EXPORT_OK = (@undo_state_group);

#
# POD for Haiku::TextView::new
#

#
# POD for Haiku::TextView::newWithFontAndColor
#

#
# POD for Haiku::TextView::newWithoutFrame
#

#
# POD for Haiku::TextView::newWithFontAndColorAndNoFrame
#

#
# POD for Haiku::TextView::newFromArchive
#

#
# POD for Haiku::TextView::DESTROY
#

#
# POD for Haiku::TextView::Instantiate
#

#
# POD for Haiku::TextView::Archive
#

#
# POD for Haiku::TextView::MakeFocus
#

#
# POD for Haiku::TextView::ResolveSpecifier
#

#
# POD for Haiku::TextView::GetSupportedSuites
#

#
# POD for Haiku::TextView::SetText
#

#
# POD for Haiku::TextView::SetTextWithLength
#

#
# POD for Haiku::TextView::Insert
#

#
# POD for Haiku::TextView::InsertWithLength
#

#
# POD for Haiku::TextView::InsertWithOffset
#

#
# POD for Haiku::TextView::Delete
#

#
# POD for Haiku::TextView::DeleteWithOffset
#

#
# POD for Haiku::TextView::Text
#

#
# POD for Haiku::TextView::TextLength
#

#
# POD for Haiku::TextView::GetText
#

#
# POD for Haiku::TextView::ByteAt
#

#
# POD for Haiku::TextView::CountLines
#

#
# POD for Haiku::TextView::CurrentLine
#

#
# POD for Haiku::TextView::GoToLine
#

#
# POD for Haiku::TextView::Cut
#

#
# POD for Haiku::TextView::Copy
#

#
# POD for Haiku::TextView::Paste
#

#
# POD for Haiku::TextView::Clear
#

#
# POD for Haiku::TextView::AcceptsPaste
#

#
# POD for Haiku::TextView::AcceptsDrop
#

#
# POD for Haiku::TextView::Select
#

#
# POD for Haiku::TextView::SelectAll
#

#
# POD for Haiku::TextView::GetSelection
#

#
# POD for Haiku::TextView::SetFontAndColor
#

#
# POD for Haiku::TextView::SetFontAndColorBetweenOffsets
#

#
# POD for Haiku::TextView::GetFontAndColor
#

#
# POD for Haiku::TextView::GetFontAndColorAtSelection
#

#
# POD for Haiku::TextView::SetRunArray
#

#
# POD for Haiku::TextView::RunArray
#

#
# POD for Haiku::TextView::LineAt
#

#
# POD for Haiku::TextView::LineAtPoint
#

#
# POD for Haiku::TextView::PointAt
#

#
# POD for Haiku::TextView::OffsetAt
#

#
# POD for Haiku::TextView::OffsetAtPoint
#

#
# POD for Haiku::TextView::FindWord
#

#
# POD for Haiku::TextView::CanEndLine
#

#
# POD for Haiku::TextView::LineWidth
#

#
# POD for Haiku::TextView::LineHeight
#

#
# POD for Haiku::TextView::TextHeight
#

#
# POD for Haiku::TextView::ScrollToOffset
#

#
# POD for Haiku::TextView::ScrollToSelection
#

#
# POD for Haiku::TextView::Highlight
#

#
# POD for Haiku::TextView::SetTextRect
#

#
# POD for Haiku::TextView::TextRect
#

#
# POD for Haiku::TextView::SetInsets
#

#
# POD for Haiku::TextView::GetInsets
#

#
# POD for Haiku::TextView::SetStylable
#

#
# POD for Haiku::TextView::IsStylable
#

#
# POD for Haiku::TextView::SetTabWidth
#

#
# POD for Haiku::TextView::TabWidth
#

#
# POD for Haiku::TextView::MakeSelectable
#

#
# POD for Haiku::TextView::IsSelectable
#

#
# POD for Haiku::TextView::MakeEditable
#

#
# POD for Haiku::TextView::IsEditable
#

#
# POD for Haiku::TextView::SetWordWrap
#

#
# POD for Haiku::TextView::DoesWordWrap
#

#
# POD for Haiku::TextView::SetMaxBytes
#

#
# POD for Haiku::TextView::MaxBytes
#

#
# POD for Haiku::TextView::DisallowChar
#

#
# POD for Haiku::TextView::AllowChar
#

#
# POD for Haiku::TextView::SetAlignment
#

#
# POD for Haiku::TextView::Alignment
#

#
# POD for Haiku::TextView::SetAutoindent
#

#
# POD for Haiku::TextView::DoesAutoindent
#

#
# POD for Haiku::TextView::SetColorSpace
#

#
# POD for Haiku::TextView::ColorSpace
#

#
# POD for Haiku::TextView::MakeResizable
#

#
# POD for Haiku::TextView::IsResizable
#

#
# POD for Haiku::TextView::SetDoesUndo
#

#
# POD for Haiku::TextView::DoesUndo
#

#
# POD for Haiku::TextView::HideTyping
#

#
# POD for Haiku::TextView::IsTypingHidden
#

#
# POD for Haiku::TextView::ResizeToPreferred
#

#
# POD for Haiku::TextView::GetPreferredSize
#

#
# POD for Haiku::TextView::HasHeightForWidth
#

#
# POD for Haiku::TextView::GetHeightForWidth
#

#
# POD for Haiku::TextView::InvalidateLayout
#

#
# POD for Haiku::TextView::AllocRunArray
#

#
# POD for Haiku::TextView::CopyRunArray
#

#
# POD for Haiku::TextView::FreeRunArray
#

#
# POD for Haiku::TextView::FlattenRunArray
#

#
# POD for Haiku::TextView::UnflattenRunArray
#

#
# POD for Haiku::TextView::Undo
#

#
# POD for Haiku::TextView::UndoState
#

1;
