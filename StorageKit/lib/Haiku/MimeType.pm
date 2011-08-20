#
# Automatically generated file
#

package Haiku::MimeType;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter);

my @action_group = qw(B_META_MIME_MODIFIED B_META_MIME_DELETED);
my @app_verb_group = qw(B_OPEN);
my @types_group = qw(B_APP_MIME_TYPE B_PEF_APP_MIME_TYPE B_PE_APP_MIME_TYPE B_ELF_APP_MIME_TYPE B_RESOURCE_MIME_TYPE B_FILE_MIME_TYPE);
my @what_group = qw(B_META_MIME_CHANGED);
my @which_group = qw(B_ICON_CHANGED B_PREFERRED_APP_CHANGED B_ATTR_INFO_CHANGED B_FILE_EXTENSIONS_CHANGED B_SHORT_DESCRIPTION_CHANGED B_LONG_DESCRIPTION_CHANGED B_ICON_FOR_TYPE_CHANGED B_APP_HINT_CHANGED B_MIME_TYPE_CREATED B_MIME_TYPE_DELETED B_SNIFFER_RULE_CHANGED B_SUPPORTED_TYPES_CHANGED B_EVERYTHING_CHANGED);

our %EXPORT_TAGS = (
	action => [@action_group],
	app_verb => [@app_verb_group],
	types => [@types_group],
	what => [@what_group],
	which => [@which_group]
);
our @EXPORT_OK = (@action_group, @app_verb_group, @types_group, @what_group, @which_group);

#
# POD for Haiku::MimeType::newEmpty
#

#
# POD for Haiku::MimeType::new
#

#
# POD for Haiku::MimeType::DESTROY
#

#
# POD for Haiku::MimeType::SetTo
#

#
# POD for Haiku::MimeType::Unset
#

#
# POD for Haiku::MimeType::InitCheck
#

#
# POD for Haiku::MimeType::Type
#

#
# POD for Haiku::MimeType::IsValid
#

#
# POD for Haiku::MimeType::IsSupertypeOnly
#

#
# POD for Haiku::MimeType::GetSupertype
#

#
# POD for Haiku::MimeType::Install
#

#
# POD for Haiku::MimeType::Delete
#

#
# POD for Haiku::MimeType::IsInstalled
#

#
# POD for Haiku::MimeType::GetIconData
#

#
# POD for Haiku::MimeType::GetPreferredApp
#

#
# POD for Haiku::MimeType::GetAttrInfo
#

#
# POD for Haiku::MimeType::GetFileExtensions
#

#
# POD for Haiku::MimeType::GetShortDescription
#

#
# POD for Haiku::MimeType::GetLongDescription
#

#
# POD for Haiku::MimeType::GetSupportingApps
#

#
# POD for Haiku::MimeType::SetIconFromData
#

#
# POD for Haiku::MimeType::SetPreferredApp
#

#
# POD for Haiku::MimeType::SetAttrInfo
#

#
# POD for Haiku::MimeType::SetFileExtensions
#

#
# POD for Haiku::MimeType::SetShortDescription
#

#
# POD for Haiku::MimeType::SetLongDescription
#

#
# POD for Haiku::MimeType::SetAppHint
#

#
# POD for Haiku::MimeType::GetAppHint
#

#
# POD for Haiku::MimeType::GetIconDataForType
#

#
# POD for Haiku::MimeType::SetIconFromDataForType
#

#
# POD for Haiku::MimeType::GetInstalledSupertypes
#

#
# POD for Haiku::MimeType::GetInstalledTypes
#

#
# POD for Haiku::MimeType::GetInstalledTypeForSupertype
#

#
# POD for Haiku::MimeType::GetWildcardApps
#

#
# POD for Haiku::MimeType::IsMimeTypeValid
#

#
# POD for Haiku::MimeType::GuessMimeTypeForEntryRef
#

#
# POD for Haiku::MimeType::GuessMimeTypeForString
#

#
# POD for Haiku::MimeType::GuessMimeType
#

#
# POD for Haiku::MimeType::StartWatching
#

#
# POD for Haiku::MimeType::StopWatching
#

1;
