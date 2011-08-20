#
# Automatically generated file
#

package Haiku::Font;
use strict;
use warnings;
require Exporter;

our $VERSION = 0.01;
our @ISA = qw(Exporter);

my @exported_functions = qw(count_font_families get_font_family count_font_styles get_font_style get_font_style_and_face update_font_families);

my @encodings_group = qw(B_UNICODE_UTF8 B_ISO_8859_1 B_ISO_8859_2 B_ISO_8859_3 B_ISO_8859_4 B_ISO_8859_5 B_ISO_8859_6 B_ISO_8859_7 B_ISO_8859_8 B_ISO_8859_9 B_ISO_8859_10 B_MACINTOSH_ROMAN);
my @faces_group = qw(B_ITALIC_FACE B_UNDERSCORE_FACE B_NEGATIVE_FACE B_OUTLINED_FACE B_STRIKEOUT_FACE B_BOLD_FACE B_REGULAR_FACE B_CONDENSED_FACE B_LIGHT_FACE B_HEAVY_FACE);
my @flags_group = qw(B_DISABLE_ANTIALIASING B_FORCE_ANTIALIASING B_HAS_TUNED_FONT B_IS_FIXED);
my @font_direction_group = qw(B_FONT_LEFT_TO_RIGHT B_FONT_RIGHT_TO_LEFT);
my @font_file_format_group = qw(B_TRUETYPE_WINDOWS B_POSTSCRIPT_TYPE1_WINDOWS);
my @font_metric_mode_group = qw(B_SCREEN_METRIC B_PRINTING_METRIC);
my @font_spacing_group = qw(B_CHAR_SPACING B_STRING_SPACING B_BITMAP_SPACING B_FIXED_SPACING);
my @lengths_group = qw(B_FONT_FAMILY_LENGTH B_FONT_STYLE_LENGTH);
my @truncation_group = qw(B_TRUNCATE_END B_TRUNCATE_BEGINNING B_TRUNCATE_MIDDLE B_TRUNCATE_SMART);
my @unicode_blocks_group = qw(B_BASIC_LATIN_BLOCK B_LATIN1_SUPPLEMENT_BLOCK B_LATIN_EXTENDED_A_BLOCK B_LATIN_EXTENDED_B_BLOCK B_IPA_EXTENSIONS_BLOCK B_SPACING_MODIFIER_LETTERS_BLOCK B_COMBINING_DIACRITICAL_MARKS_BLOCK B_BASIC_GREEK_BLOCK B_GREEK_SYMBOLS_AND_COPTIC_BLOCK B_CYRILLIC_BLOCK B_ARMENIAN_BLOCK B_BASIC_HEBREW_BLOCK B_HEBREW_EXTENDED_BLOCK B_BASIC_ARABIC_BLOCK B_ARABIC_EXTENDED_BLOCK B_DEVANAGARI_BLOCK B_BENGALI_BLOCK B_GURMUKHI_BLOCK B_GUJARATI_BLOCK B_ORIYA_BLOCK B_TAMIL_BLOCK B_TELUGU_BLOCK B_KANNADA_BLOCK B_MALAYALAM_BLOCK B_THAI_BLOCK B_LAO_BLOCK B_BASIC_GEORGIAN_BLOCK B_GEORGIAN_EXTENDED_BLOCK B_HANGUL_JAMO_BLOCK B_LATIN_EXTENDED_ADDITIONAL_BLOCK B_GREEK_EXTENDED_BLOCK B_GENERAL_PUNCTUATION_BLOCK B_SUPERSCRIPTS_AND_SUBSCRIPTS_BLOCK B_CURRENCY_SYMBOLS_BLOCK B_COMBINING_MARKS_FOR_SYMBOLS_BLOCK B_LETTERLIKE_SYMBOLS_BLOCK B_NUMBER_FORMS_BLOCK B_ARROWS_BLOCK B_MATHEMATICAL_OPERATORS_BLOCK B_MISCELLANEOUS_TECHNICAL_BLOCK B_CONTROL_PICTURES_BLOCK B_OPTICAL_CHARACTER_RECOGNITION_BLOCK B_ENCLOSED_ALPHANUMERICS_BLOCK B_BOX_DRAWING_BLOCK B_BLOCK_ELEMENTS_BLOCK B_GEOMETRIC_SHAPES_BLOCK B_MISCELLANEOUS_SYMBOLS_BLOCK B_DINGBATS_BLOCK B_CJK_SYMBOLS_AND_PUNCTUATION_BLOCK B_HIRAGANA_BLOCK B_KATAKANA_BLOCK B_BOPOMOFO_BLOCK B_HANGUL_COMPATIBILITY_JAMO_BLOCK B_CJK_MISCELLANEOUS_BLOCK B_ENCLOSED_CJK_LETTERS_AND_MONTHS_BLOCK B_CJK_COMPATIBILITY_BLOCK B_HANGUL_BLOCK B_HIGH_SURROGATES_BLOCK B_LOW_SURROGATES_BLOCK B_CJK_UNIFIED_IDEOGRAPHS_BLOCK B_PRIVATE_USE_AREA_BLOCK B_CJK_COMPATIBILITY_IDEOGRAPHS_BLOCK B_ALPHABETIC_PRESENTATION_FORMS_BLOCK B_ARABIC_PRESENTATION_FORMS_A_BLOCK B_COMBINING_HALF_MARKS_BLOCK B_CJK_COMPATIBILITY_FORMS_BLOCK B_SMALL_FORM_VARIANTS_BLOCK B_ARABIC_PRESENTATION_FORMS_B_BLOCK B_HALFWIDTH_AND_FULLWIDTH_FORMS_BLOCK B_SPECIALS_BLOCK B_TIBETAN_BLOCK);

our %EXPORT_TAGS = (
	encodings => [@encodings_group],
	faces => [@faces_group],
	flags => [@flags_group],
	font_direction => [@font_direction_group],
	font_file_format => [@font_file_format_group],
	font_metric_mode => [@font_metric_mode_group],
	font_spacing => [@font_spacing_group],
	lengths => [@lengths_group],
	truncation => [@truncation_group],
	unicode_blocks => [@unicode_blocks_group]
);
our @EXPORT_OK = (@exported_functions, @encodings_group, @faces_group, @flags_group, @font_direction_group, @font_file_format_group, @font_metric_mode_group, @font_spacing_group, @lengths_group, @truncation_group, @unicode_blocks_group);

#
# POD for Haiku::Font::new
#

#
# POD for Haiku::Font::newFromFont
#

#
# POD for Haiku::Font::DESTROY
#

#
# POD for Haiku::Font::SetFamilyAndStyle
#

#
# POD for Haiku::Font::SetFamilyAndStyleFromCode
#

#
# POD for Haiku::Font::SetFamilyAndFace
#

#
# POD for Haiku::Font::SetSize
#

#
# POD for Haiku::Font::SetShear
#

#
# POD for Haiku::Font::SetRotation
#

#
# POD for Haiku::Font::SetFalseBoldWidth
#

#
# POD for Haiku::Font::SetSpacing
#

#
# POD for Haiku::Font::SetEncoding
#

#
# POD for Haiku::Font::SetFace
#

#
# POD for Haiku::Font::SetFlags
#

#
# POD for Haiku::Font::GetFamilyAndStyle
#

#
# POD for Haiku::Font::FamilyAndStyleAsCode
#

#
# POD for Haiku::Font::Size
#

#
# POD for Haiku::Font::Shear
#

#
# POD for Haiku::Font::Rotation
#

#
# POD for Haiku::Font::FalseBoldWidth
#

#
# POD for Haiku::Font::Spacing
#

#
# POD for Haiku::Font::Encoding
#

#
# POD for Haiku::Font::Face
#

#
# POD for Haiku::Font::Flags
#

#
# POD for Haiku::Font::Direction
#

#
# POD for Haiku::Font::IsFixed
#

#
# POD for Haiku::Font::IsFullAndHalfFixed
#

#
# POD for Haiku::Font::BoundingBox
#

#
# POD for Haiku::Font::Blocks
#

#
# POD for Haiku::Font::FileFormat
#

#
# POD for Haiku::Font::CountTuned
#

#
# POD for Haiku::Font::GetTunedInfo
#

#
# POD for Haiku::Font::GetTruncatedStrings
#

#
# POD for Haiku::Font::StringWidth
#

#
# POD for Haiku::Font::StringWidthWithLength
#

#
# POD for Haiku::Font::GetStringWidths
#

#
# POD for Haiku::Font::GetEscapements
#

#
# POD for Haiku::Font::GetEscapementsWithDelta
#

#
# POD for Haiku::Font::GetEscapementsAsPoints
#

#
# POD for Haiku::Font::GetEscapementsAsPointsWithOffsets
#

#
# POD for Haiku::Font::GetEdges
#

#
# POD for Haiku::Font::GetHeight
#

#
# POD for Haiku::Font::GetBoundingBoxesAsGlyphs
#

#
# POD for Haiku::Font::GetBoundingBoxesAsString
#

#
# POD for Haiku::Font::GetBoundingBoxesForStrings
#

#
# POD for Haiku::Font::GetGlyphShapes
#

#
# POD for Haiku::Font::GetHasGlyphs
#

#
# POD for Haiku::Font::PrintToStream
#

#
# POD for Haiku::Font::count_font_families
#

#
# POD for Haiku::Font::get_font_family
#

#
# POD for Haiku::Font::count_font_styles
#

#
# POD for Haiku::Font::get_font_style
#

#
# POD for Haiku::Font::get_font_style_and_face
#

#
# POD for Haiku::Font::update_font_families
#

1;
