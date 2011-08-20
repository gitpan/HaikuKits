#
# Automatically generated file
#

package Haiku::Unarchiver;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter);

my @exported_functions = qw(instantiate_object instantiate_object_with_id validate_instantiation);

my @ownership_policy_group = qw(B_ASSUME_OWNERSHIP B_DONT_ASSUME_OWNERSHIP);

our %EXPORT_TAGS = (
	ownership_policy => [@ownership_policy_group]
);
our @EXPORT_OK = (@exported_functions, @ownership_policy_group);

#
# POD for Haiku::Unarchiver::new
#

#
# POD for Haiku::Unarchiver::DESTROY
#

#
# POD for Haiku::Unarchiver::EnsureUnarchived
#

#
# POD for Haiku::Unarchiver::EnsureUnarchivedByToken
#

#
# POD for Haiku::Unarchiver::IsInstantiated
#

#
# POD for Haiku::Unarchiver::IsInstantiatedByToken
#

#
# POD for Haiku::Unarchiver::Finish
#

#
# POD for Haiku::Unarchiver::ArchiveMessage
#

#
# POD for Haiku::Unarchiver::AssumeOwnership
#

#
# POD for Haiku::Unarchiver::RelinquishOwnership
#

#
# POD for Haiku::Unarchiver::IsArchiveManaged
#

#
# POD for Haiku::Unarchiver::PrepareArchive
#

#
# POD for Haiku::Unarchiver::instantiate_object
#

#
# POD for Haiku::Unarchiver::instantiate_object_with_id
#

#
# POD for Haiku::Unarchiver::validate_instantiation
#

1;
