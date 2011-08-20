#
# Automatically generated file
#

package Haiku::Mime;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter);

my @exported_functions = qw(update_mime_info create_app_meta_mime get_device_icon_as_data get_device_icon_with_type get_named_icon_with_type);

my @force_group = qw(B_UPDATE_MIME_INFO_NO_FORCE B_UPDATE_MIME_INFO_FORCE_KEEP_TYPE B_UPDATE_MIME_INFO_FORCE_UPDATE_ALL);
my @icon_size_group = qw(B_LARGE_ICON B_MINI_ICON);

our %EXPORT_TAGS = (
	force => [@force_group],
	icon_size => [@icon_size_group]
);
our @EXPORT_OK = (@exported_functions, @force_group, @icon_size_group);

#
# POD for Haiku::Mime::update_mime_info
#

#
# POD for Haiku::Mime::create_app_meta_mime
#

#
# POD for Haiku::Mime::get_device_icon_as_data
#

#
# POD for Haiku::Mime::get_device_icon_with_type
#

#
# POD for Haiku::Mime::get_named_icon_with_type
#

1;
