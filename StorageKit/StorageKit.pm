#
# Automatically generated file
#

package Haiku::StorageKit;
use strict;
use warnings;
require Exporter;
require DynaLoader;

use Haiku::EntryList;
use Haiku::Query;
use Haiku::FindDirectory;
use Haiku::Mime;
use Haiku::MimeType;
use Haiku::NodeInfo;
use Haiku::NodeMonitor;
use Haiku::Path;
use Haiku::Statable;
use Haiku::Entry;
use Haiku::entry_ref;
use Haiku::Node;
use Haiku::node_ref;
use Haiku::Volume;
use Haiku::VolumeRoster;
use Haiku::dirent;
use Haiku::stat_beos;
use Haiku::stat_beos_time;
use Haiku::stat;
use Haiku::timespec;
use Haiku::attr_info;

our $VERSION = 0.01;
our @ISA = qw(DynaLoader Exporter);

my @limits_group = qw(B_DEV_NAME_LENGTH B_FILE_NAME_LENGTH B_PATH_NAME_LENGTH B_ATTR_NAME_LENGTH B_MIME_TYPE_LENGTH B_MAX_SYMLINKS);
my @node_flavor_group = qw(B_FILE_NODE B_SYMLINK_NODE B_DIRECTORY_NODE B_ANY_NODE);
my @open_modes_group = qw(B_READ_ONLY B_WRITE_ONLY B_READ_WRITE B_FAIL_IF_EXISTS B_CREATE_FILE B_ERASE_FILE B_OPEN_AT_END);

our %EXPORT_TAGS = (
	limits => [@limits_group],
	node_flavor => [@node_flavor_group],
	open_modes => [@open_modes_group]
);
our @EXPORT_OK = (@limits_group, @node_flavor_group, @open_modes_group);

bootstrap Haiku::StorageKit $VERSION;

1;
