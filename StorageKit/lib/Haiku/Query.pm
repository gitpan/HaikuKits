#
# Automatically generated file
#

package Haiku::Query;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter Haiku::EntryList);

my @query_op_group = qw(B_INVALID_OP B_EQ B_GT B_GE B_LT B_LE B_NE B_CONTAINS B_BEGINS_WITH B_ENDS_WITH B_AND B_OR B_NOT);

our %EXPORT_TAGS = (
	query_op => [@query_op_group]
);
our @EXPORT_OK = (@query_op_group);

#
# POD for Haiku::Query::new
#

#
# POD for Haiku::Query::DESTROY
#

#
# POD for Haiku::Query::Clear
#

#
# POD for Haiku::Query::PushAttr
#

#
# POD for Haiku::Query::PushOp
#

#
# POD for Haiku::Query::PushUInt32
#

#
# POD for Haiku::Query::PushInt32
#

#
# POD for Haiku::Query::PushUInt64
#

#
# POD for Haiku::Query::PushInt64
#

#
# POD for Haiku::Query::PushFloat
#

#
# POD for Haiku::Query::PushDouble
#

#
# POD for Haiku::Query::PushString
#

#
# POD for Haiku::Query::PushDate
#

#
# POD for Haiku::Query::SetVolume
#

#
# POD for Haiku::Query::SetPredicate
#

#
# POD for Haiku::Query::SetTarget
#

#
# POD for Haiku::Query::IsLive
#

#
# POD for Haiku::Query::GetPredicate
#

#
# POD for Haiku::Query::PredicateLength
#

#
# POD for Haiku::Query::TargetDevice
#

#
# POD for Haiku::Query::Fetch
#

#
# POD for Haiku::Query::GetNextEntry
#

#
# POD for Haiku::Query::GetNextRef
#

#
# POD for Haiku::Query::GetNextDirents
#

#
# POD for Haiku::Query::Rewind
#

#
# POD for Haiku::Query::CountEntries
#

1;
