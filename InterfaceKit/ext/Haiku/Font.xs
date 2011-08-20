#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Font

PROTOTYPES: DISABLE

SV*
BFont::new()
	INIT:
		BFont* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		
		retval = new BFont();
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

# Note that this method is not prefixed by the class name.
#
# This is because for prefixed methods, xsubpp will turn the first perl
# argument into the CLASS variable (a char*) if the method name is 'new',
# and into the THIS variable (the object pointer) otherwise. So we need to
# trick xsubbpp by leaving off the prefix and defining CLASS ourselves
SV*
newFromFont(CLASS, font)
	INPUT:
		char* CLASS;
		BFont* font;
	INIT:
		BFont* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: font
		
		retval = new BFont(font);
		
		retval_sv = create_perl_object((void*)retval, CLASS, false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

# Note that this method is not prefixed by the class name.
#
# This is because if we prefix the class name the first argument is
# automatically converted into the THIS pointer, and we no longer have
# access to the Perl object. But we need that access in order to determine
# whether we're allowed to delete the C++ object, and to clean up the Perl
# object.
void
DESTROY(perl_obj)
	INPUT:
		SV* perl_obj;
	INIT:
		BFont* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BFont");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BFont*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

bool
BFont::SetFamilyAndStyle(...)
	INIT:
		const font_family family = "";
		STRLEN ST_1_sv_length = SvCUR(ST(1));
		const font_style style = "";
		STRLEN ST_2_sv_length = SvCUR(ST(2));
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: family
		if (items > 1) {
			
			if (ST_1_sv_length > B_FONT_FAMILY_LENGTH + 1) {
				char* last_char;
				ST_1_sv_length = B_FONT_FAMILY_LENGTH + 1;
				SvCUR_set(ST(1), ST_1_sv_length);
				last_char = SvEND(ST(1));	// pointer to last character
				*last_char = '\0';
			}
			
			memcpy((void*)&family, (void*)SvPV(ST(1), ST_1_sv_length), ST_1_sv_length);
		}
		// item 2: style
		if (items > 2) {
			
			if (ST_2_sv_length > B_FONT_STYLE_LENGTH + 1) {
				char* last_char;
				ST_2_sv_length = B_FONT_STYLE_LENGTH + 1;
				SvCUR_set(ST(2), ST_2_sv_length);
				last_char = SvEND(ST(2));	// pointer to last character
				*last_char = '\0';
			}
			
			memcpy((void*)&style, (void*)SvPV(ST(2), ST_2_sv_length), ST_2_sv_length);
		}
		
		retval = THIS->SetFamilyAndStyle(family, style);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

void
BFont::SetFamilyAndStyleFromCode(code)
	INPUT:
		uint32 code;
	CODE:
		// item 0: THIS
		// item 1: code
		
		THIS->SetFamilyAndStyle(code);

bool
BFont::SetFamilyAndFace(..., face)
	INPUT:
		uint16 face;
	INIT:
		const font_family family = "";
		STRLEN ST_1_sv_length = SvCUR(ST(1));
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: family
		if (items > 1) {
			
			if (ST_1_sv_length > B_FONT_FAMILY_LENGTH + 1) {
				char* last_char;
				ST_1_sv_length = B_FONT_FAMILY_LENGTH + 1;
				SvCUR_set(ST(1), ST_1_sv_length);
				last_char = SvEND(ST(1));	// pointer to last character
				*last_char = '\0';
			}
			
			memcpy((void*)&family, (void*)SvPV(ST(1), ST_1_sv_length), ST_1_sv_length);
		}
		// item 2: face
		
		retval = THIS->SetFamilyAndFace(family, face);
		RETVAL = true;
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
	OUTPUT:
		RETVAL

void
BFont::SetSize(size)
	INPUT:
		float size;
	CODE:
		// item 0: THIS
		// item 1: size
		
		THIS->SetSize(size);

void
BFont::SetShear(shear)
	INPUT:
		float shear;
	CODE:
		// item 0: THIS
		// item 1: shear
		
		THIS->SetShear(shear);

void
BFont::SetRotation(rotation)
	INPUT:
		float rotation;
	CODE:
		// item 0: THIS
		// item 1: rotation
		
		THIS->SetRotation(rotation);

void
BFont::SetFalseBoldWidth(width)
	INPUT:
		float width;
	CODE:
		// item 0: THIS
		// item 1: width
		
		THIS->SetFalseBoldWidth(width);

void
BFont::SetSpacing(spacing)
	INPUT:
		uint8 spacing;
	CODE:
		// item 0: THIS
		// item 1: spacing
		
		THIS->SetSpacing(spacing);

void
BFont::SetEncoding(encoding)
	INPUT:
		uint8 encoding;
	CODE:
		// item 0: THIS
		// item 1: encoding
		
		THIS->SetEncoding(encoding);

void
BFont::SetFace(face)
	INPUT:
		uint16 face;
	CODE:
		// item 0: THIS
		// item 1: face
		
		THIS->SetFace(face);

void
BFont::SetFlags(flags)
	INPUT:
		uint32 flags;
	CODE:
		// item 0: THIS
		// item 1: flags
		
		THIS->SetFlags(flags);

void
BFont::GetFamilyAndStyle()
	INIT:
		font_family* family;
		font_style* style;
		STRLEN family_sv_length;
		STRLEN style_sv_length;
		SV* family_sv = newSV(0);	// retcount > 1
		SV* style_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		family = (font_family*)malloc(B_FONT_FAMILY_LENGTH + 1);
		style = (font_style*)malloc(B_FONT_STYLE_LENGTH + 1);
		
		THIS->GetFamilyAndStyle(family, style);
		
		family_sv = newSVpv((char*)family, 0);	// 0 lets Perl calculate length
		
		family_sv_length = SvCUR(family_sv);
		if (family_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			family_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(family_sv, family_sv_length);
		}
		
		if (is_utf8_string((const U8*)family, (STRLEN)family_sv_length)) {
			SvUTF8_on(family_sv);
		}
		free((void*)family);
		style_sv = newSVpv((char*)style, 0);	// 0 lets Perl calculate length
		
		style_sv_length = SvCUR(style_sv);
		if (style_sv_length > B_FONT_STYLE_LENGTH + 1) {
			style_sv_length = B_FONT_STYLE_LENGTH + 1;
			SvCUR_set(style_sv, style_sv_length);
		}
		
		if (is_utf8_string((const U8*)style, (STRLEN)style_sv_length)) {
			SvUTF8_on(style_sv);
		}
		free((void*)style);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(family_sv));
		PUSHs(sv_2mortal(style_sv));

uint32
BFont::FamilyAndStyleAsCode()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FamilyAndStyle();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BFont::Size()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Size();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BFont::Shear()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Shear();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BFont::Rotation()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Rotation();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BFont::FalseBoldWidth()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FalseBoldWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint8
BFont::Spacing()
	INIT:
		uint8 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Spacing();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint8
BFont::Encoding()
	INIT:
		uint8 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Encoding();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint16
BFont::Face()
	INIT:
		uint16 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Face();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

uint32
BFont::Flags()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Flags();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

font_direction
BFont::Direction()
	INIT:
		font_direction retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Direction();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BFont::IsFixed()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFixed();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BFont::IsFullAndHalfFixed()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFullAndHalfFixed();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BFont::BoundingBox()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->BoundingBox();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BFont::Blocks()
	INIT:
		unicode_block retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->Blocks();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::unicode_block", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

font_file_format
BFont::FileFormat()
	INIT:
		font_file_format retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->FileFormat();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BFont::CountTuned()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountTuned();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BFont::GetTunedInfo(index)
	INPUT:
		int32 index;
	INIT:
		tuned_font_info* info;
		SV* info_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: index
		
		THIS->GetTunedInfo(index, info);
		
		info_sv = create_perl_object((void*)info, "Haiku::tuned_font_info", false);
		DUMPME(1,info_sv);
		RETVAL = newSVsv(info_sv);
		SvREFCNT_dec(info_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetTruncatedStrings(stringArray_sv, mode, width)
	INPUT:
		SV* stringArray_sv;
		uint32 mode;
		float width;
	INIT:
		const char** stringArray;
		AV* stringArray_sv_av;
		int32 numStrings;
		char** resultArray;
		AV* resultArray_sv_av;
		SV* resultArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: stringArray
		stringArray = (const char**)malloc(numStrings * sizeof(char*));
		//Converting Perl arg 'stringArray_sv' to C array 'stringArray'
		stringArray_sv_av = (AV*)SvRV(stringArray_sv);
		numStrings = av_len(stringArray_sv_av) + 1;
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(stringArray_sv_av, i, 0);
			if (element_sv == NULL) {
				stringArray[i] = NULL;
				continue;
			}
			stringArray[i] = (const char*)SvPV_nolen(*element_sv);
		}
		// not an XS input: numStrings
		// item 2: mode
		// item 3: width
		
		THIS->GetTruncatedStrings(stringArray, numStrings, mode, width, resultArray);
		
		free((void*)stringArray);
		//Converting C array 'resultArray' to Perl arg 'resultArray_sv'
		resultArray_sv_av = newAV();
		for (int i = 0; i < numStrings; i++) {
			SV* element_sv = newSV(0);
			sv_setpv((SV*)element_sv, resultArray[i]);
			av_push(resultArray_sv_av, element_sv);
		}
		resultArray_sv = newRV_noinc((SV*) resultArray_sv_av);
		RETVAL = resultArray_sv;
	OUTPUT:
		RETVAL

float
BFont::StringWidth(string)
	INPUT:
		const char* string;
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		// item 1: string
		
		retval = THIS->StringWidth(string);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BFont::StringWidthWithLength(string_sv)
	INPUT:
		SV* string_sv;
	INIT:
		const char* string;
		STRLEN string_sv_length;
		int32 length;
		float retval;
	CODE:
		// item 0: THIS
		// item 1: string
		string = (const char*)SvPV(string_sv, string_sv_length);
		length = string_sv_length;
		// not an XS input: length
		
		retval = THIS->StringWidth(string, length);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

SV*
BFont::GetStringWidths(stringArray_sv, lengthArray_sv)
	INPUT:
		SV* stringArray_sv;
		SV* lengthArray_sv;
	INIT:
		const char** stringArray;
		AV* stringArray_sv_av;
		int32* lengthArray;
		AV* lengthArray_sv_av;
		int32 numStrings;
		float* widthArray;
		AV* widthArray_sv_av;
		SV* widthArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: stringArray
		stringArray = (const char**)malloc(numStrings * sizeof(char*));
		//Converting Perl arg 'stringArray_sv' to C array 'stringArray'
		stringArray_sv_av = (AV*)SvRV(stringArray_sv);
		numStrings = av_len(stringArray_sv_av) + 1;
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(stringArray_sv_av, i, 0);
			if (element_sv == NULL) {
				stringArray[i] = NULL;
				continue;
			}
			stringArray[i] = (const char*)SvPV_nolen(*element_sv);
		}
		// item 2: lengthArray
		lengthArray = (int32*)malloc(numStrings * sizeof(int32));
		//Converting Perl arg 'lengthArray_sv' to C array 'lengthArray'
		lengthArray_sv_av = (AV*)SvRV(lengthArray_sv);
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(lengthArray_sv_av, i, 0);
			if (element_sv == NULL) {
				lengthArray[i] = 0;
				continue;
			}
			lengthArray[i] = (int32)SvIV(*element_sv);
		}
		// not an XS input: numStrings
		
		THIS->GetStringWidths(stringArray, lengthArray, numStrings, widthArray);
		
		free((void*)stringArray);
		free((void*)lengthArray);
		//Converting C array 'widthArray' to Perl arg 'widthArray_sv'
		widthArray_sv_av = newAV();
		for (int i = 0; i < numStrings; i++) {
			SV* element_sv = newSV(0);
			sv_setnv(element_sv, (double)widthArray[i]);
			av_push(widthArray_sv_av, element_sv);
		}
		widthArray_sv = newRV_noinc((SV*) widthArray_sv_av);
		RETVAL = widthArray_sv;
	OUTPUT:
		RETVAL

SV*
BFont::GetEscapements(charArray_sv)
	INPUT:
		SV* charArray_sv;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		float* ecapementArray;
		AV* ecapementArray_sv_av;
		SV* ecapementArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		
		THIS->GetEscapements(charArray, numChars, ecapementArray);
		
		//Converting C array 'ecapementArray' to Perl arg 'ecapementArray_sv'
		ecapementArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setnv(element_sv, (double)ecapementArray[i]);
			av_push(ecapementArray_sv_av, element_sv);
		}
		ecapementArray_sv = newRV_noinc((SV*) ecapementArray_sv_av);
		RETVAL = ecapementArray_sv;
	OUTPUT:
		RETVAL

SV*
BFont::GetEscapementsWithDelta(charArray_sv, delta)
	INPUT:
		SV* charArray_sv;
		escapement_delta* delta;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		float* ecapementArray;
		AV* ecapementArray_sv_av;
		SV* ecapementArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		// item 2: delta
		
		THIS->GetEscapements(charArray, numChars, delta, ecapementArray);
		
		//Converting C array 'ecapementArray' to Perl arg 'ecapementArray_sv'
		ecapementArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setnv(element_sv, (double)ecapementArray[i]);
			av_push(ecapementArray_sv_av, element_sv);
		}
		ecapementArray_sv = newRV_noinc((SV*) ecapementArray_sv_av);
		RETVAL = ecapementArray_sv;
	OUTPUT:
		RETVAL

SV*
BFont::GetEscapementsAsPoints(charArray_sv, delta)
	INPUT:
		SV* charArray_sv;
		escapement_delta* delta;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		BPoint* ecapementArray;
		AV* ecapementArray_sv_av;
		SV* ecapementArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		// item 2: delta
		
		THIS->GetEscapements(charArray, numChars, delta, ecapementArray);
		
		//Converting C array 'ecapementArray' to Perl arg 'ecapementArray_sv'
		ecapementArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&ecapementArray[i], "Haiku::Point"));
			av_push(ecapementArray_sv_av, element_sv);
		}
		ecapementArray_sv = newRV_noinc((SV*) ecapementArray_sv_av);
		RETVAL = newSVsv(ecapementArray_sv);
		SvREFCNT_dec(ecapementArray_sv);
	OUTPUT:
		RETVAL

void
BFont::GetEscapementsAsPointsWithOffsets(charArray_sv, delta)
	INPUT:
		SV* charArray_sv;
		escapement_delta* delta;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		BPoint* ecapementArray;
		BPoint* offsetArray;
		AV* ecapementArray_sv_av;
		AV* offsetArray_sv_av;
		SV* ecapementArray_sv = newSV(0);	// retcount > 1
		SV* offsetArray_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		// item 2: delta
		
		THIS->GetEscapements(charArray, numChars, delta, ecapementArray, offsetArray);
		
		//Converting C array 'ecapementArray' to Perl arg 'ecapementArray_sv'
		ecapementArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&ecapementArray[i], "Haiku::Point"));
			av_push(ecapementArray_sv_av, element_sv);
		}
		ecapementArray_sv = newRV_noinc((SV*) ecapementArray_sv_av);
		//Converting C array 'offsetArray' to Perl arg 'offsetArray_sv'
		offsetArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&offsetArray[i], "Haiku::Point"));
			av_push(offsetArray_sv_av, element_sv);
		}
		offsetArray_sv = newRV_noinc((SV*) offsetArray_sv_av);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(ecapementArray_sv));
		PUSHs(sv_2mortal(offsetArray_sv));

SV*
BFont::GetEdges(charArray_sv)
	INPUT:
		SV* charArray_sv;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		edge_info* edgeArray;
		AV* edgeArray_sv_av;
		SV* edgeArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		
		THIS->GetEdges(charArray, numChars, edgeArray);
		
		//Converting C array 'edgeArray' to Perl arg 'edgeArray_sv'
		edgeArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&edgeArray[i], "Haiku::edge_info"));
			av_push(edgeArray_sv_av, element_sv);
		}
		edgeArray_sv = newRV_noinc((SV*) edgeArray_sv_av);
		RETVAL = newSVsv(edgeArray_sv);
		SvREFCNT_dec(edgeArray_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetHeight()
	INIT:
		font_height* height;
		SV* height_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		THIS->GetHeight(height);
		
		height_sv = create_perl_object((void*)height, "Haiku::font_height", false);
		DUMPME(1,height_sv);
		RETVAL = newSVsv(height_sv);
		SvREFCNT_dec(height_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetBoundingBoxesAsGlyphs(charArray_sv, mode)
	INPUT:
		SV* charArray_sv;
		font_metric_mode mode;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		BRect* boundingBoxArray;
		AV* boundingBoxArray_sv_av;
		SV* boundingBoxArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		// item 2: mode
		
		THIS->GetBoundingBoxesAsGlyphs(charArray, numChars, mode, boundingBoxArray);
		
		//Converting C array 'boundingBoxArray' to Perl arg 'boundingBoxArray_sv'
		boundingBoxArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&boundingBoxArray[i], "Haiku::Rect"));
			av_push(boundingBoxArray_sv_av, element_sv);
		}
		boundingBoxArray_sv = newRV_noinc((SV*) boundingBoxArray_sv_av);
		RETVAL = newSVsv(boundingBoxArray_sv);
		SvREFCNT_dec(boundingBoxArray_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetBoundingBoxesAsString(charArray_sv, mode, delta)
	INPUT:
		SV* charArray_sv;
		font_metric_mode mode;
		escapement_delta* delta;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		BRect* boundingBoxArray;
		AV* boundingBoxArray_sv_av;
		SV* boundingBoxArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		// item 2: mode
		// item 3: delta
		
		THIS->GetBoundingBoxesAsString(charArray, numChars, mode, delta, boundingBoxArray);
		
		//Converting C array 'boundingBoxArray' to Perl arg 'boundingBoxArray_sv'
		boundingBoxArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&boundingBoxArray[i], "Haiku::Rect"));
			av_push(boundingBoxArray_sv_av, element_sv);
		}
		boundingBoxArray_sv = newRV_noinc((SV*) boundingBoxArray_sv_av);
		RETVAL = newSVsv(boundingBoxArray_sv);
		SvREFCNT_dec(boundingBoxArray_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetBoundingBoxesForStrings(stringArray_sv, mode, deltas_sv)
	INPUT:
		SV* stringArray_sv;
		font_metric_mode mode;
		SV* deltas_sv;
	INIT:
		const char** stringArray;
		AV* stringArray_sv_av;
		int32 numStrings;
		escapement_delta* deltas;
		AV* deltas_sv_av;
		BRect* boundingBoxArray;
		AV* boundingBoxArray_sv_av;
		SV* boundingBoxArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: stringArray
		stringArray = (const char**)malloc(numStrings * sizeof(char*));
		//Converting Perl arg 'stringArray_sv' to C array 'stringArray'
		stringArray_sv_av = (AV*)SvRV(stringArray_sv);
		numStrings = av_len(stringArray_sv_av) + 1;
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(stringArray_sv_av, i, 0);
			if (element_sv == NULL) {
				stringArray[i] = NULL;
				continue;
			}
			stringArray[i] = (const char*)SvPV_nolen(*element_sv);
		}
		// not an XS input: numStrings
		// item 2: mode
		// item 3: deltas
		deltas = (escapement_delta*)malloc(numStrings * sizeof(escapement_delta));
		//Converting Perl arg 'deltas_sv' to C array 'deltas'
		deltas_sv_av = (AV*)SvRV(deltas_sv);
		for (int i = 0; i < numStrings; i++) {
			SV** element_sv = av_fetch(deltas_sv_av, i, 0);
			if (element_sv == NULL) {
				// should be setting this to some default
				// but neither 0 nor NULL is right
				continue;
			}
			deltas[i] = *(escapement_delta*)get_cpp_object(*element_sv);
		}
		
		THIS->GetBoundingBoxesForStrings(stringArray, numStrings, mode, deltas, boundingBoxArray);
		
		free((void*)stringArray);
		free((void*)deltas);
		//Converting C array 'boundingBoxArray' to Perl arg 'boundingBoxArray_sv'
		boundingBoxArray_sv_av = newAV();
		for (int i = 0; i < numStrings; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)&boundingBoxArray[i], "Haiku::Rect"));
			av_push(boundingBoxArray_sv_av, element_sv);
		}
		boundingBoxArray_sv = newRV_noinc((SV*) boundingBoxArray_sv_av);
		RETVAL = newSVsv(boundingBoxArray_sv);
		SvREFCNT_dec(boundingBoxArray_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetGlyphShapes(charArray_sv)
	INPUT:
		SV* charArray_sv;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		BShape** glyphShapeArray;
		AV* glyphShapeArray_sv_av;
		SV* glyphShapeArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		
		THIS->GetGlyphShapes(charArray, numChars, glyphShapeArray);
		
		//Converting C array 'glyphShapeArray' to Perl arg 'glyphShapeArray_sv'
		glyphShapeArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			sv_setsv(element_sv, create_perl_object((void*)glyphShapeArray[i], "Haiku::Shape"));
			av_push(glyphShapeArray_sv_av, element_sv);
		}
		glyphShapeArray_sv = newRV_noinc((SV*) glyphShapeArray_sv_av);
		RETVAL = newSVsv(glyphShapeArray_sv);
		SvREFCNT_dec(glyphShapeArray_sv);
	OUTPUT:
		RETVAL

SV*
BFont::GetHasGlyphs(charArray_sv)
	INPUT:
		SV* charArray_sv;
	INIT:
		const char* charArray;
		STRLEN charArray_sv_length;
		int32 numChars;
		bool* hasArray;
		AV* hasArray_sv_av;
		SV* hasArray_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: charArray
		charArray = (const char*)SvPV(charArray_sv, charArray_sv_length);
		numChars = charArray_sv_length;
		// not an XS input: numChars
		
		THIS->GetHasGlyphs(charArray, numChars, hasArray);
		
		//Converting C array 'hasArray' to Perl arg 'hasArray_sv'
		hasArray_sv_av = newAV();
		for (int i = 0; i < numChars; i++) {
			SV* element_sv = newSV(0);
			element_sv = boolSV(hasArray[i]);
			av_push(hasArray_sv_av, element_sv);
		}
		hasArray_sv = newRV_noinc((SV*) hasArray_sv_av);
		RETVAL = hasArray_sv;
	OUTPUT:
		RETVAL

void
BFont::PrintToStream()
	CODE:
		// item 0: THIS
		
		THIS->PrintToStream();

int32
count_font_families()
	INIT:
		int32 retval;
	CODE:
		retval = count_font_families();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
get_font_family(index)
	INPUT:
		int32 index;
	INIT:
		font_family* name;
		uint32 flags;
		status_t retval;
		SV* error_sv;
		STRLEN name_sv_length;
		SV* name_sv = newSV(0);	// retcount > 1
		SV* flags_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: index
		name = (font_family*)malloc(B_FONT_FAMILY_LENGTH + 1);
		
		retval = get_font_family(index, name, &flags);
		sv_setuv(flags_sv, (UV)flags);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		name_sv = newSVpv((char*)name, 0);	// 0 lets Perl calculate length
		
		name_sv_length = SvCUR(name_sv);
		if (name_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			name_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(name_sv, name_sv_length);
		}
		
		if (is_utf8_string((const U8*)name, (STRLEN)name_sv_length)) {
			SvUTF8_on(name_sv);
		}
		free((void*)name);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(name_sv));
		PUSHs(sv_2mortal(flags_sv));

int32
count_font_styles(name_sv)
	INPUT:
		SV* name_sv;
	INIT:
		font_family name;
		STRLEN name_sv_length = SvCUR(name_sv);
		int32 retval;
	CODE:
		// item 0: name
		
		if (name_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			char* last_char;
			name_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(name_sv, name_sv_length);
			last_char = SvEND(name_sv);	// pointer to last character
			*last_char = '\0';
		}
		
		memcpy((void*)&name, (void*)SvPV(name_sv, name_sv_length), name_sv_length);
		
		retval = count_font_styles(name);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
get_font_style(family_sv, index)
	INPUT:
		SV* family_sv;
		int32 index;
	INIT:
		font_family family;
		STRLEN family_sv_length = SvCUR(family_sv);
		font_style* name;
		uint32 flags;
		status_t retval;
		SV* error_sv;
		STRLEN name_sv_length;
		SV* name_sv = newSV(0);	// retcount > 1
		SV* flags_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: family
		
		if (family_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			char* last_char;
			family_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(family_sv, family_sv_length);
			last_char = SvEND(family_sv);	// pointer to last character
			*last_char = '\0';
		}
		
		memcpy((void*)&family, (void*)SvPV(family_sv, family_sv_length), family_sv_length);
		// item 1: index
		name = (font_style*)malloc(B_FONT_STYLE_LENGTH + 1);
		
		retval = get_font_style(family, index, name, &flags);
		sv_setuv(flags_sv, (UV)flags);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		name_sv = newSVpv((char*)name, 0);	// 0 lets Perl calculate length
		
		name_sv_length = SvCUR(name_sv);
		if (name_sv_length > B_FONT_STYLE_LENGTH + 1) {
			name_sv_length = B_FONT_STYLE_LENGTH + 1;
			SvCUR_set(name_sv, name_sv_length);
		}
		
		if (is_utf8_string((const U8*)name, (STRLEN)name_sv_length)) {
			SvUTF8_on(name_sv);
		}
		free((void*)name);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(name_sv));
		PUSHs(sv_2mortal(flags_sv));

void
get_font_style_and_face(family_sv, index)
	INPUT:
		SV* family_sv;
		int32 index;
	INIT:
		font_family family;
		STRLEN family_sv_length = SvCUR(family_sv);
		font_style* name;
		uint16 face;
		uint32 flags;
		status_t retval;
		SV* error_sv;
		STRLEN name_sv_length;
		SV* name_sv = newSV(0);	// retcount > 1
		SV* face_sv = newSV(0);	// retcount > 1
		SV* flags_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: family
		
		if (family_sv_length > B_FONT_FAMILY_LENGTH + 1) {
			char* last_char;
			family_sv_length = B_FONT_FAMILY_LENGTH + 1;
			SvCUR_set(family_sv, family_sv_length);
			last_char = SvEND(family_sv);	// pointer to last character
			*last_char = '\0';
		}
		
		memcpy((void*)&family, (void*)SvPV(family_sv, family_sv_length), family_sv_length);
		// item 1: index
		name = (font_style*)malloc(B_FONT_STYLE_LENGTH + 1);
		
		retval = get_font_style(family, index, name, &face, &flags);
		sv_setuv(face_sv, (UV)face);
		sv_setuv(flags_sv, (UV)flags);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		name_sv = newSVpv((char*)name, 0);	// 0 lets Perl calculate length
		
		name_sv_length = SvCUR(name_sv);
		if (name_sv_length > B_FONT_STYLE_LENGTH + 1) {
			name_sv_length = B_FONT_STYLE_LENGTH + 1;
			SvCUR_set(name_sv, name_sv_length);
		}
		
		if (is_utf8_string((const U8*)name, (STRLEN)name_sv_length)) {
			SvUTF8_on(name_sv);
		}
		free((void*)name);
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(name_sv));
		PUSHs(sv_2mortal(face_sv));
		PUSHs(sv_2mortal(flags_sv));

bool
update_font_families(checkOnly)
	INPUT:
		bool checkOnly;
	INIT:
		bool retval;
	CODE:
		// item 0: checkOnly
		
		retval = update_font_families(checkOnly);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BFont::operator_eq(object, swap)
	INPUT:
		BFont object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = *THIS == object;
	OUTPUT:
		RETVAL

bool
BFont::operator_ne(object, swap)
	INPUT:
		BFont object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = *THIS != object;
	OUTPUT:
		RETVAL

SV*
B_FONT_FAMILY_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_FAMILY_LENGTH);
		dualize(RETVAL, "B_FONT_FAMILY_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_FONT_STYLE_LENGTH()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_STYLE_LENGTH);
		dualize(RETVAL, "B_FONT_STYLE_LENGTH");
	OUTPUT:
		RETVAL

SV*
B_CHAR_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CHAR_SPACING);
		dualize(RETVAL, "B_CHAR_SPACING");
	OUTPUT:
		RETVAL

SV*
B_STRING_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STRING_SPACING);
		dualize(RETVAL, "B_STRING_SPACING");
	OUTPUT:
		RETVAL

SV*
B_BITMAP_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BITMAP_SPACING);
		dualize(RETVAL, "B_BITMAP_SPACING");
	OUTPUT:
		RETVAL

SV*
B_FIXED_SPACING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FIXED_SPACING);
		dualize(RETVAL, "B_FIXED_SPACING");
	OUTPUT:
		RETVAL

SV*
B_FONT_LEFT_TO_RIGHT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_LEFT_TO_RIGHT);
		dualize(RETVAL, "B_FONT_LEFT_TO_RIGHT");
	OUTPUT:
		RETVAL

SV*
B_FONT_RIGHT_TO_LEFT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FONT_RIGHT_TO_LEFT);
		dualize(RETVAL, "B_FONT_RIGHT_TO_LEFT");
	OUTPUT:
		RETVAL

SV*
B_DISABLE_ANTIALIASING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_DISABLE_ANTIALIASING);
		dualize(RETVAL, "B_DISABLE_ANTIALIASING");
	OUTPUT:
		RETVAL

SV*
B_FORCE_ANTIALIASING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_FORCE_ANTIALIASING);
		dualize(RETVAL, "B_FORCE_ANTIALIASING");
	OUTPUT:
		RETVAL

SV*
B_TRUNCATE_END()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRUNCATE_END);
		dualize(RETVAL, "B_TRUNCATE_END");
	OUTPUT:
		RETVAL

SV*
B_TRUNCATE_BEGINNING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRUNCATE_BEGINNING);
		dualize(RETVAL, "B_TRUNCATE_BEGINNING");
	OUTPUT:
		RETVAL

SV*
B_TRUNCATE_MIDDLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRUNCATE_MIDDLE);
		dualize(RETVAL, "B_TRUNCATE_MIDDLE");
	OUTPUT:
		RETVAL

SV*
B_TRUNCATE_SMART()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRUNCATE_SMART);
		dualize(RETVAL, "B_TRUNCATE_SMART");
	OUTPUT:
		RETVAL

SV*
B_UNICODE_UTF8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNICODE_UTF8);
		dualize(RETVAL, "B_UNICODE_UTF8");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_1()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_1);
		dualize(RETVAL, "B_ISO_8859_1");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_2()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_2);
		dualize(RETVAL, "B_ISO_8859_2");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_3()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_3);
		dualize(RETVAL, "B_ISO_8859_3");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_4()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_4);
		dualize(RETVAL, "B_ISO_8859_4");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_5()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_5);
		dualize(RETVAL, "B_ISO_8859_5");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_6()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_6);
		dualize(RETVAL, "B_ISO_8859_6");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_7()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_7);
		dualize(RETVAL, "B_ISO_8859_7");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_8);
		dualize(RETVAL, "B_ISO_8859_8");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_9()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_9);
		dualize(RETVAL, "B_ISO_8859_9");
	OUTPUT:
		RETVAL

SV*
B_ISO_8859_10()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ISO_8859_10);
		dualize(RETVAL, "B_ISO_8859_10");
	OUTPUT:
		RETVAL

SV*
B_MACINTOSH_ROMAN()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_MACINTOSH_ROMAN);
		dualize(RETVAL, "B_MACINTOSH_ROMAN");
	OUTPUT:
		RETVAL

SV*
B_HAS_TUNED_FONT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HAS_TUNED_FONT);
		dualize(RETVAL, "B_HAS_TUNED_FONT");
	OUTPUT:
		RETVAL

SV*
B_IS_FIXED()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_IS_FIXED);
		dualize(RETVAL, "B_IS_FIXED");
	OUTPUT:
		RETVAL

SV*
B_ITALIC_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_ITALIC_FACE);
		dualize(RETVAL, "B_ITALIC_FACE");
	OUTPUT:
		RETVAL

SV*
B_UNDERSCORE_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDERSCORE_FACE);
		dualize(RETVAL, "B_UNDERSCORE_FACE");
	OUTPUT:
		RETVAL

SV*
B_NEGATIVE_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_NEGATIVE_FACE);
		dualize(RETVAL, "B_NEGATIVE_FACE");
	OUTPUT:
		RETVAL

SV*
B_OUTLINED_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_OUTLINED_FACE);
		dualize(RETVAL, "B_OUTLINED_FACE");
	OUTPUT:
		RETVAL

SV*
B_STRIKEOUT_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_STRIKEOUT_FACE);
		dualize(RETVAL, "B_STRIKEOUT_FACE");
	OUTPUT:
		RETVAL

SV*
B_BOLD_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_BOLD_FACE);
		dualize(RETVAL, "B_BOLD_FACE");
	OUTPUT:
		RETVAL

SV*
B_REGULAR_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_REGULAR_FACE);
		dualize(RETVAL, "B_REGULAR_FACE");
	OUTPUT:
		RETVAL

SV*
B_CONDENSED_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_CONDENSED_FACE);
		dualize(RETVAL, "B_CONDENSED_FACE");
	OUTPUT:
		RETVAL

SV*
B_LIGHT_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_LIGHT_FACE);
		dualize(RETVAL, "B_LIGHT_FACE");
	OUTPUT:
		RETVAL

SV*
B_HEAVY_FACE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_HEAVY_FACE);
		dualize(RETVAL, "B_HEAVY_FACE");
	OUTPUT:
		RETVAL

SV*
B_SCREEN_METRIC()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCREEN_METRIC);
		dualize(RETVAL, "B_SCREEN_METRIC");
	OUTPUT:
		RETVAL

SV*
B_PRINTING_METRIC()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRINTING_METRIC);
		dualize(RETVAL, "B_PRINTING_METRIC");
	OUTPUT:
		RETVAL

SV*
B_TRUETYPE_WINDOWS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_TRUETYPE_WINDOWS);
		dualize(RETVAL, "B_TRUETYPE_WINDOWS");
	OUTPUT:
		RETVAL

SV*
B_POSTSCRIPT_TYPE1_WINDOWS()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_POSTSCRIPT_TYPE1_WINDOWS);
		dualize(RETVAL, "B_POSTSCRIPT_TYPE1_WINDOWS");
	OUTPUT:
		RETVAL

SV*
B_BASIC_LATIN_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BASIC_LATIN_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BASIC_LATIN_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LATIN1_SUPPLEMENT_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LATIN1_SUPPLEMENT_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LATIN1_SUPPLEMENT_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LATIN_EXTENDED_A_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LATIN_EXTENDED_A_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LATIN_EXTENDED_A_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LATIN_EXTENDED_B_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LATIN_EXTENDED_B_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LATIN_EXTENDED_B_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_IPA_EXTENSIONS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_IPA_EXTENSIONS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_IPA_EXTENSIONS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_SPACING_MODIFIER_LETTERS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_SPACING_MODIFIER_LETTERS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_SPACING_MODIFIER_LETTERS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_COMBINING_DIACRITICAL_MARKS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_COMBINING_DIACRITICAL_MARKS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_COMBINING_DIACRITICAL_MARKS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BASIC_GREEK_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BASIC_GREEK_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BASIC_GREEK_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GREEK_SYMBOLS_AND_COPTIC_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GREEK_SYMBOLS_AND_COPTIC_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GREEK_SYMBOLS_AND_COPTIC_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CYRILLIC_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CYRILLIC_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CYRILLIC_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ARMENIAN_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ARMENIAN_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ARMENIAN_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BASIC_HEBREW_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BASIC_HEBREW_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BASIC_HEBREW_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HEBREW_EXTENDED_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HEBREW_EXTENDED_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HEBREW_EXTENDED_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BASIC_ARABIC_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BASIC_ARABIC_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BASIC_ARABIC_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ARABIC_EXTENDED_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ARABIC_EXTENDED_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ARABIC_EXTENDED_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_DEVANAGARI_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_DEVANAGARI_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_DEVANAGARI_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BENGALI_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BENGALI_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BENGALI_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GURMUKHI_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GURMUKHI_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GURMUKHI_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GUJARATI_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GUJARATI_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GUJARATI_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ORIYA_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ORIYA_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ORIYA_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_TAMIL_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_TAMIL_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_TAMIL_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_TELUGU_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_TELUGU_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_TELUGU_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_KANNADA_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_KANNADA_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_KANNADA_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_MALAYALAM_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_MALAYALAM_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_MALAYALAM_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_THAI_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_THAI_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_THAI_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LAO_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LAO_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LAO_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BASIC_GEORGIAN_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BASIC_GEORGIAN_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BASIC_GEORGIAN_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GEORGIAN_EXTENDED_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GEORGIAN_EXTENDED_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GEORGIAN_EXTENDED_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HANGUL_JAMO_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HANGUL_JAMO_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HANGUL_JAMO_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LATIN_EXTENDED_ADDITIONAL_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LATIN_EXTENDED_ADDITIONAL_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LATIN_EXTENDED_ADDITIONAL_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GREEK_EXTENDED_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GREEK_EXTENDED_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GREEK_EXTENDED_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GENERAL_PUNCTUATION_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GENERAL_PUNCTUATION_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GENERAL_PUNCTUATION_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_SUPERSCRIPTS_AND_SUBSCRIPTS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_SUPERSCRIPTS_AND_SUBSCRIPTS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_SUPERSCRIPTS_AND_SUBSCRIPTS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CURRENCY_SYMBOLS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CURRENCY_SYMBOLS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CURRENCY_SYMBOLS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_COMBINING_MARKS_FOR_SYMBOLS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_COMBINING_MARKS_FOR_SYMBOLS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_COMBINING_MARKS_FOR_SYMBOLS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LETTERLIKE_SYMBOLS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LETTERLIKE_SYMBOLS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LETTERLIKE_SYMBOLS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_NUMBER_FORMS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_NUMBER_FORMS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_NUMBER_FORMS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ARROWS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ARROWS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ARROWS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_MATHEMATICAL_OPERATORS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_MATHEMATICAL_OPERATORS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_MATHEMATICAL_OPERATORS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_MISCELLANEOUS_TECHNICAL_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_MISCELLANEOUS_TECHNICAL_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_MISCELLANEOUS_TECHNICAL_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CONTROL_PICTURES_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CONTROL_PICTURES_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CONTROL_PICTURES_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_OPTICAL_CHARACTER_RECOGNITION_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_OPTICAL_CHARACTER_RECOGNITION_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_OPTICAL_CHARACTER_RECOGNITION_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ENCLOSED_ALPHANUMERICS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ENCLOSED_ALPHANUMERICS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ENCLOSED_ALPHANUMERICS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BOX_DRAWING_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BOX_DRAWING_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BOX_DRAWING_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BLOCK_ELEMENTS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BLOCK_ELEMENTS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BLOCK_ELEMENTS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_GEOMETRIC_SHAPES_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_GEOMETRIC_SHAPES_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_GEOMETRIC_SHAPES_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_MISCELLANEOUS_SYMBOLS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_MISCELLANEOUS_SYMBOLS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_MISCELLANEOUS_SYMBOLS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_DINGBATS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_DINGBATS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_DINGBATS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CJK_SYMBOLS_AND_PUNCTUATION_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CJK_SYMBOLS_AND_PUNCTUATION_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CJK_SYMBOLS_AND_PUNCTUATION_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HIRAGANA_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HIRAGANA_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HIRAGANA_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_KATAKANA_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_KATAKANA_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_KATAKANA_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_BOPOMOFO_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_BOPOMOFO_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_BOPOMOFO_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HANGUL_COMPATIBILITY_JAMO_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HANGUL_COMPATIBILITY_JAMO_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HANGUL_COMPATIBILITY_JAMO_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CJK_MISCELLANEOUS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CJK_MISCELLANEOUS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CJK_MISCELLANEOUS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ENCLOSED_CJK_LETTERS_AND_MONTHS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ENCLOSED_CJK_LETTERS_AND_MONTHS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ENCLOSED_CJK_LETTERS_AND_MONTHS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CJK_COMPATIBILITY_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CJK_COMPATIBILITY_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CJK_COMPATIBILITY_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HANGUL_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HANGUL_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HANGUL_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HIGH_SURROGATES_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HIGH_SURROGATES_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HIGH_SURROGATES_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_LOW_SURROGATES_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_LOW_SURROGATES_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_LOW_SURROGATES_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CJK_UNIFIED_IDEOGRAPHS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CJK_UNIFIED_IDEOGRAPHS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CJK_UNIFIED_IDEOGRAPHS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_PRIVATE_USE_AREA_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_PRIVATE_USE_AREA_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_PRIVATE_USE_AREA_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CJK_COMPATIBILITY_IDEOGRAPHS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CJK_COMPATIBILITY_IDEOGRAPHS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CJK_COMPATIBILITY_IDEOGRAPHS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ALPHABETIC_PRESENTATION_FORMS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ALPHABETIC_PRESENTATION_FORMS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ALPHABETIC_PRESENTATION_FORMS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ARABIC_PRESENTATION_FORMS_A_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ARABIC_PRESENTATION_FORMS_A_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ARABIC_PRESENTATION_FORMS_A_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_COMBINING_HALF_MARKS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_COMBINING_HALF_MARKS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_COMBINING_HALF_MARKS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_CJK_COMPATIBILITY_FORMS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_CJK_COMPATIBILITY_FORMS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_CJK_COMPATIBILITY_FORMS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_SMALL_FORM_VARIANTS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_SMALL_FORM_VARIANTS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_SMALL_FORM_VARIANTS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_ARABIC_PRESENTATION_FORMS_B_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_ARABIC_PRESENTATION_FORMS_B_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_ARABIC_PRESENTATION_FORMS_B_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_HALFWIDTH_AND_FULLWIDTH_FORMS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_HALFWIDTH_AND_FULLWIDTH_FORMS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_HALFWIDTH_AND_FULLWIDTH_FORMS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_SPECIALS_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_SPECIALS_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_SPECIALS_BLOCK");
	OUTPUT:
		RETVAL

SV*
B_TIBETAN_BLOCK()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)&B_TIBETAN_BLOCK, "Haiku::unicode_block", true));
		dualize(RETVAL, "B_TIBETAN_BLOCK");
	OUTPUT:
		RETVAL

SV*
be_plain_font()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)be_plain_font, "Haiku::Font", true));
		dualize(RETVAL, "be_plain_font");
	OUTPUT:
		RETVAL

SV*
be_bold_font()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)be_bold_font, "Haiku::Font", true));
		dualize(RETVAL, "be_bold_font");
	OUTPUT:
		RETVAL

SV*
be_fixed_font()
	CODE:
		RETVAL = newSV(0);
		sv_setsv(RETVAL, create_perl_object((void*)be_fixed_font, "Haiku::Font", true));
		dualize(RETVAL, "be_fixed_font");
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::Font::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Font::()", XS_Haiku__InterfaceKit_nil, file);

