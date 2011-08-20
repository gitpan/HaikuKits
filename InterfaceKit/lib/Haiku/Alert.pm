#
# Automatically generated file
#

package Haiku::Alert;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter Haiku::Window);

my @alert_type_group = qw(B_EMPTY_ALERT B_INFO_ALERT B_IDEA_ALERT B_WARNING_ALERT B_STOP_ALERT);
my @button_spacing_group = qw(B_EVEN_SPACING B_OFFSET_SPACING);

our %EXPORT_TAGS = (
	alert_type => [@alert_type_group],
	button_spacing => [@button_spacing_group]
);
our @EXPORT_OK = (@alert_type_group, @button_spacing_group);

#
# POD for Haiku::Alert::new
#

#
# POD for Haiku::Alert::newWithSpacing
#

#
# POD for Haiku::Alert::newFromArchive
#

#
# POD for Haiku::Alert::DESTROY
#

#
# POD for Haiku::Alert::Instantiate
#

#
# POD for Haiku::Alert::Archive
#

#
# POD for Haiku::Alert::SetShortcut
#

#
# POD for Haiku::Alert::Shortcut
#

#
# POD for Haiku::Alert::Go
#

#
# POD for Haiku::Alert::AsynchronousGo
#

#
# POD for Haiku::Alert::ButtonAt
#

#
# POD for Haiku::Alert::TextView
#

#
# POD for Haiku::Alert::ResolveSpecifier
#

#
# POD for Haiku::Alert::GetSupportedSuites
#

#
# POD for Haiku::Alert::DispatchMessage
#

#
# POD for Haiku::Alert::Quit
#

#
# POD for Haiku::Alert::AlertPosition
#

1;
