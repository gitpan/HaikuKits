#
# Automatically generated file
#

package Haiku::NodeMonitor;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter);

my @exported_functions = qw(watch_volume_with_messenger watch_volume watch_node_with_messenger watch_node stop_watching_with_messenger stop_watching);

my @cause_group = qw(B_ATTR_CHANGED B_ATTR_CREATED B_ATTR_REMOVED);
my @fields_group = qw(B_STAT_MODE B_STAT_UID B_STAT_GID B_STAT_SIZE B_STAT_ACCESS_TIME B_STAT_MODIFICATION_TIME B_STAT_CREATION_TIME B_STAT_CHANGE_TIME B_STAT_INTERIM_UPDATE);
my @flags_group = qw(B_STOP_WATCHING B_WATCH_NAME B_WATCH_STAT B_WATCH_ATTR B_WATCH_DIRECTORY B_WATCH_ALL B_WATCH_MOUNT B_WATCH_INTERIM_STAT);
my @opcodes_group = qw(B_ENTRY_CREATED B_ENTRY_REMOVED B_ENTRY_MOVED B_STAT_CHANGED B_ATTR_CHANGED B_DEVICE_MOUNTED B_DEVICE_UNMOUNTED);

our %EXPORT_TAGS = (
	cause => [@cause_group],
	fields => [@fields_group],
	flags => [@flags_group],
	opcodes => [@opcodes_group]
);
our @EXPORT_OK = (@exported_functions, @cause_group, @fields_group, @flags_group, @opcodes_group);

#
# POD for Haiku::NodeMonitor::watch_volume_with_messenger
#

#
# POD for Haiku::NodeMonitor::watch_volume
#

#
# POD for Haiku::NodeMonitor::watch_node_with_messenger
#

#
# POD for Haiku::NodeMonitor::watch_node
#

#
# POD for Haiku::NodeMonitor::stop_watching_with_messenger
#

#
# POD for Haiku::NodeMonitor::stop_watching
#

1;
