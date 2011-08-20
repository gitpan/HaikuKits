#
# Automatically generated file
#

package Haiku::Message;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter);

my @specifier_group = qw(B_NO_SPECIFIER B_DIRECT_SPECIFIER B_INDEX_SPECIFIER B_REVERSE_INDEX_SPECIFIER B_RANGE_SPECIFIER B_REVERSE_RANGE_SPECIFIER B_NAME_SPECIFIER B_ID_SPECIFIER B_SPECIFIERS_END);

our %EXPORT_TAGS = (
	specifier => [@specifier_group]
);
our @EXPORT_OK = (@specifier_group);

#
# POD for Haiku::Message::new
#

#
# POD for Haiku::Message::newCopy
#

#
# POD for Haiku::Message::newEmpty
#

#
# POD for Haiku::Message::DESTROY
#

#
# POD for Haiku::Message::GetInfo
#

#
# POD for Haiku::Message::GetInfoByName
#

#
# POD for Haiku::Message::CountNames
#

#
# POD for Haiku::Message::IsEmpty
#

#
# POD for Haiku::Message::IsSystem
#

#
# POD for Haiku::Message::IsReply
#

#
# POD for Haiku::Message::PrintToStream
#

#
# POD for Haiku::Message::Rename
#

#
# POD for Haiku::Message::WasDelivered
#

#
# POD for Haiku::Message::IsSourceRemote
#

#
# POD for Haiku::Message::IsSourceWaiting
#

#
# POD for Haiku::Message::ReturnAddress
#

#
# POD for Haiku::Message::Previous
#

#
# POD for Haiku::Message::WasDropped
#

#
# POD for Haiku::Message::DropPoint
#

#
# POD for Haiku::Message::SendReply
#

#
# POD for Haiku::Message::SendReplyCommand
#

#
# POD for Haiku::Message::SendReplyToMessenger
#

#
# POD for Haiku::Message::SendReplyWithReplyMessage
#

#
# POD for Haiku::Message::SendReplyCommandWithReplyMessage
#

#
# POD for Haiku::Message::FlattenedSize
#

#
# POD for Haiku::Message::Flatten
#

#
# POD for Haiku::Message::Unflatten
#

#
# POD for Haiku::Message::AddSpecifier
#

#
# POD for Haiku::Message::AddDirectSpecifier
#

#
# POD for Haiku::Message::AddIndexSpecifier
#

#
# POD for Haiku::Message::AddRangeSpecifier
#

#
# POD for Haiku::Message::AddNameSpecifier
#

#
# POD for Haiku::Message::SetCurrentSpecifier
#

#
# POD for Haiku::Message::GetCurrentSpecifier
#

#
# POD for Haiku::Message::HasSpecifiers
#

#
# POD for Haiku::Message::PopSpecifier
#

#
# POD for Haiku::Message::AddRect
#

#
# POD for Haiku::Message::AddPoint
#

#
# POD for Haiku::Message::AddString
#

#
# POD for Haiku::Message::AddInt8
#

#
# POD for Haiku::Message::AddUInt8
#

#
# POD for Haiku::Message::AddInt16
#

#
# POD for Haiku::Message::AddUInt16
#

#
# POD for Haiku::Message::AddInt32
#

#
# POD for Haiku::Message::AddUInt32
#

#
# POD for Haiku::Message::AddInt64
#

#
# POD for Haiku::Message::AddUInt64
#

#
# POD for Haiku::Message::AddBool
#

#
# POD for Haiku::Message::AddFloat
#

#
# POD for Haiku::Message::AddDouble
#

#
# POD for Haiku::Message::AddPointer
#

#
# POD for Haiku::Message::AddMessenger
#

#
# POD for Haiku::Message::AddRef
#

#
# POD for Haiku::Message::AddMessage
#

#
# POD for Haiku::Message::AddData
#

#
# POD for Haiku::Message::RemoveData
#

#
# POD for Haiku::Message::RemoveName
#

#
# POD for Haiku::Message::MakeEmpty
#

#
# POD for Haiku::Message::FindRect
#

#
# POD for Haiku::Message::FindRectByIndex
#

#
# POD for Haiku::Message::FindPoint
#

#
# POD for Haiku::Message::FindPointByIndex
#

#
# POD for Haiku::Message::FindString
#

#
# POD for Haiku::Message::FindStringByIndex
#

#
# POD for Haiku::Message::FindInt8
#

#
# POD for Haiku::Message::FindInt8ByIndex
#

#
# POD for Haiku::Message::FindUInt8
#

#
# POD for Haiku::Message::FindUInt8ByIndex
#

#
# POD for Haiku::Message::FindInt16
#

#
# POD for Haiku::Message::FindInt16ByIndex
#

#
# POD for Haiku::Message::FindUInt16
#

#
# POD for Haiku::Message::FindUInt16ByIndex
#

#
# POD for Haiku::Message::FindInt32
#

#
# POD for Haiku::Message::FindInt32ByIndex
#

#
# POD for Haiku::Message::FindUInt32
#

#
# POD for Haiku::Message::FindUInt32ByIndex
#

#
# POD for Haiku::Message::FindInt64
#

#
# POD for Haiku::Message::FindInt64ByIndex
#

#
# POD for Haiku::Message::FindUInt64
#

#
# POD for Haiku::Message::FindUInt64ByIndex
#

#
# POD for Haiku::Message::FindBool
#

#
# POD for Haiku::Message::FindBoolByIndex
#

#
# POD for Haiku::Message::FindFloat
#

#
# POD for Haiku::Message::FindFloatByIndex
#

#
# POD for Haiku::Message::FindDouble
#

#
# POD for Haiku::Message::FindDoubleByIndex
#

#
# POD for Haiku::Message::FindPointer
#

#
# POD for Haiku::Message::FindPointerByIndex
#

#
# POD for Haiku::Message::FindMessenger
#

#
# POD for Haiku::Message::FindMessengerByIndex
#

#
# POD for Haiku::Message::FindRef
#

#
# POD for Haiku::Message::FindRefByIndex
#

#
# POD for Haiku::Message::FindMessage
#

#
# POD for Haiku::Message::FindMessageByIndex
#

#
# POD for Haiku::Message::FindData
#

#
# POD for Haiku::Message::FindDataByIndex
#

#
# POD for Haiku::Message::ReplaceRect
#

#
# POD for Haiku::Message::ReplaceRectByIndex
#

#
# POD for Haiku::Message::ReplacePoint
#

#
# POD for Haiku::Message::ReplacePointByIndex
#

#
# POD for Haiku::Message::ReplaceString
#

#
# POD for Haiku::Message::ReplaceStringByIndex
#

#
# POD for Haiku::Message::ReplaceInt8
#

#
# POD for Haiku::Message::ReplaceInt8ByIndex
#

#
# POD for Haiku::Message::ReplaceUInt8
#

#
# POD for Haiku::Message::ReplaceUInt8ByIndex
#

#
# POD for Haiku::Message::ReplaceInt16
#

#
# POD for Haiku::Message::ReplaceInt16ByIndex
#

#
# POD for Haiku::Message::ReplaceUInt16
#

#
# POD for Haiku::Message::ReplaceUInt16ByIndex
#

#
# POD for Haiku::Message::ReplaceInt32
#

#
# POD for Haiku::Message::ReplaceInt32ByIndex
#

#
# POD for Haiku::Message::ReplaceUInt32
#

#
# POD for Haiku::Message::ReplaceUInt32ByIndex
#

#
# POD for Haiku::Message::ReplaceInt64
#

#
# POD for Haiku::Message::ReplaceInt64ByIndex
#

#
# POD for Haiku::Message::ReplaceUInt64
#

#
# POD for Haiku::Message::ReplaceUInt64ByIndex
#

#
# POD for Haiku::Message::ReplaceBool
#

#
# POD for Haiku::Message::ReplaceBoolByIndex
#

#
# POD for Haiku::Message::ReplaceFloat
#

#
# POD for Haiku::Message::ReplaceFloatByIndex
#

#
# POD for Haiku::Message::ReplaceDouble
#

#
# POD for Haiku::Message::ReplaceDoubleByIndex
#

#
# POD for Haiku::Message::ReplacePointer
#

#
# POD for Haiku::Message::ReplacePointerByIndex
#

#
# POD for Haiku::Message::ReplaceMessenger
#

#
# POD for Haiku::Message::ReplaceMessengerByIndex
#

#
# POD for Haiku::Message::ReplaceRef
#

#
# POD for Haiku::Message::ReplaceRefByIndex
#

#
# POD for Haiku::Message::ReplaceMessage
#

#
# POD for Haiku::Message::ReplaceMessageByIndex
#

#
# POD for Haiku::Message::ReplaceData
#

#
# POD for Haiku::Message::ReplaceDataByIndex
#

1;
