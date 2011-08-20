#
# Automatically generated file
#

package Haiku::SupportKit;
use strict;
use warnings;
require Exporter;
require DynaLoader;

use Haiku::Beep;
use Haiku::Archivable;
use Haiku::Archiver;
use Haiku::Unarchiver;
use Haiku::Errors;
use Haiku::TypeConstants;

our $VERSION = 0.01;
our @ISA = qw(DynaLoader Exporter);

my @support_group = qw(B_PRId8 B_PRIi8 B_PRId16 B_PRIi16 B_PRId32 B_PRIi32 B_PRId64 B_PRIi64 B_PRIu8 B_PRIo8 B_PRIx8 B_PRIX8 B_PRIu16 B_PRIo16 B_PRIx16 B_PRIX16 B_PRIu32 B_PRIo32 B_PRIx32 B_PRIX32 B_PRIu64 B_PRIo64 B_PRIx64 B_PRIX64 B_SCNd8 B_SCNi8 B_SCNd16 B_SCNi16 B_SCNd32 B_SCNi32 B_SCNd64 B_SCNi64 B_SCNu8 B_SCNo8 B_SCNx8 B_SCNu16 B_SCNo16 B_SCNx16 B_SCNu32 B_SCNo32 B_SCNx32 B_SCNu64 B_SCNo64 B_SCNx64 B_PRIuSIZE B_PRIoSIZE B_PRIxSIZE B_PRIXSIZE B_PRIdSSIZE B_PRIiSSIZE B_PRIuADDR B_PRIoADDR B_PRIxADDR B_PRIXADDR B_PRIuPHYSADDR B_PRIoPHYSADDR B_PRIxPHYSADDR B_PRIXPHYSADDR B_PRIuGENADDR B_PRIoGENADDR B_PRIxGENADDR B_PRIXGENADDR B_PRIdOFF B_PRIiOFF B_PRIdDEV B_PRIiDEV B_PRIdINO B_PRIiINO B_PRIdTIME B_PRIiTIME);

our %EXPORT_TAGS = (
	support => [@support_group]
);
our @EXPORT_OK = (@support_group);

bootstrap Haiku::SupportKit $VERSION;

1;
