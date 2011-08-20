#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::TextView

PROTOTYPES: DISABLE

SV*
BTextView::new(frame, name, textRect, resizingMode, flags)
	INPUT:
		BRect frame;
		const char* name;
		BRect textRect;
		uint32 resizingMode;
		uint32 flags;
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: textRect
		// item 4: resizingMode
		// item 5: flags
		
		retval = new BTextView(frame, name, textRect, resizingMode, flags);
		
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
newWithFontAndColor(CLASS, frame, name, textRect, font, color, resizingMode, flags)
	INPUT:
		char* CLASS;
		BRect frame;
		const char* name;
		BRect textRect;
		BFont* font;
		rgb_color* color;
		uint32 resizingMode;
		uint32 flags;
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: frame
		// item 2: name
		// item 3: textRect
		// item 4: font
		// item 5: color
		// item 6: resizingMode
		// item 7: flags
		
		retval = new BTextView(frame, name, textRect, font, color, resizingMode, flags);
		
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
newWithoutFrame(CLASS, name, flags)
	INPUT:
		char* CLASS;
		const char* name;
		uint32 flags;
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: flags
		
		retval = new BTextView(name, flags);
		
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
newWithFontAndColorAndNoFrame(CLASS, name, font, color, flags)
	INPUT:
		char* CLASS;
		const char* name;
		BFont* font;
		rgb_color* color;
		uint32 flags;
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: name
		// item 2: font
		// item 3: color
		// item 4: flags
		
		retval = new BTextView(name, font, color, flags);
		
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
newFromArchive(CLASS, archive)
	INPUT:
		char* CLASS;
		BMessage* archive;
	INIT:
		BTextView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BTextView(archive);
		
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
		BTextView* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BTextView");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BTextView*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BTextView::Instantiate(data)
	INPUT:
		BMessage* data;
	INIT:
		BArchivable* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->Instantiate(data);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Archivable", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

SV*
BTextView::Archive(...)
	INIT:
		BMessage* data;
		bool deep = true;
		status_t retval;
		SV* error_sv;
		SV* data_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 2: deep
		if (items > 2) {
			deep = SvTRUE(ST(2));
		}
		
		retval = THIS->Archive(data, deep);
		
		if (retval != B_OK) {
			// this doesn't seem to be working...
			error_sv = get_sv("!", 1);
			sv_setiv(error_sv, (IV)retval);
			// ...so use this for now
			error_sv = get_sv("Haiku::InterfaceKit::Error", 1);
			sv_setiv(error_sv, (IV)retval);
			XSRETURN_UNDEF;
		}
		data_sv = create_perl_object((void*)data, "Haiku::Message", false);
		DUMPME(1,data_sv);
		RETVAL = newSVsv(data_sv);
		SvREFCNT_dec(data_sv);
	OUTPUT:
		RETVAL

void
BTextView::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

SV*
BTextView::ResolveSpecifier(message, index, specifier, form, property)
	INPUT:
		BMessage* message;
		int32 index;
		BMessage* specifier;
		int32 form;
		const char* property;
	INIT:
		BHandler* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: message
		// item 2: index
		// item 3: specifier
		// item 4: form
		// item 5: property
		
		retval = THIS->ResolveSpecifier(message, index, specifier, form, property);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::Handler", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BTextView::GetSupportedSuites(data)
	INPUT:
		BMessage* data;
	INIT:
		status_t retval;
		SV* error_sv;
	CODE:
		// item 0: THIS
		// item 1: data
		
		retval = THIS->GetSupportedSuites(data);
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
BTextView::SetText(inText, ...)
	INPUT:
		const char* inText;
	INIT:
		text_run_array* inRuns = NULL;
	CODE:
		// item 0: THIS
		// item 1: inText
		// item 2: inRuns
		if (items > 2) {
			inRuns = (text_run_array*)get_cpp_object(ST(2));
		}
		
		THIS->SetText(inText, inRuns);

void
BTextView::SetTextWithLength(inText, inLength, ...)
	INPUT:
		const char* inText;
		int32 inLength;
	INIT:
		text_run_array* inRuns = NULL;
	CODE:
		// item 0: THIS
		// item 1: inText
		// item 2: inLength
		// item 3: inRuns
		if (items > 3) {
			inRuns = (text_run_array*)get_cpp_object(ST(3));
		}
		
		THIS->SetText(inText, inLength, inRuns);

void
BTextView::Insert(inText, ...)
	INPUT:
		const char* inText;
	INIT:
		text_run_array* inRuns = NULL;
	CODE:
		// item 0: THIS
		// item 1: inText
		// item 2: inRuns
		if (items > 2) {
			inRuns = (text_run_array*)get_cpp_object(ST(2));
		}
		
		THIS->Insert(inText, inRuns);

void
BTextView::InsertWithLength(inText, inLength, ...)
	INPUT:
		const char* inText;
		int32 inLength;
	INIT:
		text_run_array* inRuns = NULL;
	CODE:
		// item 0: THIS
		// item 1: inText
		// item 2: inLength
		// item 3: inRuns
		if (items > 3) {
			inRuns = (text_run_array*)get_cpp_object(ST(3));
		}
		
		THIS->Insert(inText, inLength, inRuns);

void
BTextView::InsertWithOffset(startOffset, inText, inLength, ...)
	INPUT:
		int32 startOffset;
		const char* inText;
		int32 inLength;
	INIT:
		text_run_array* inRuns = NULL;
	CODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: inText
		// item 3: inLength
		// item 4: inRuns
		if (items > 4) {
			inRuns = (text_run_array*)get_cpp_object(ST(4));
		}
		
		THIS->Insert(startOffset, inText, inLength, inRuns);

void
BTextView::Delete()
	CODE:
		// item 0: THIS
		
		THIS->Delete();

void
BTextView::DeleteWithOffset(startOffset, endOffset)
	INPUT:
		int32 startOffset;
		int32 endOffset;
	CODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: endOffset
		
		THIS->Delete(startOffset, endOffset);

const char*
BTextView::Text()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Text();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BTextView::TextLength()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TextLength();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

char*
BTextView::GetText(offset, length)
	INPUT:
		int32 offset;
		int32 length;
	INIT:
		char* buffer;
	CODE:
		// item 0: THIS
		// item 1: offset
		// item 2: length
		
		THIS->GetText(offset, length, buffer);
		
		RETVAL = buffer;
	OUTPUT:
		RETVAL

uint8
BTextView::ByteAt(offset)
	INPUT:
		int32 offset;
	INIT:
		uint8 retval;
	CODE:
		// item 0: THIS
		// item 1: offset
		
		retval = THIS->ByteAt(offset);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BTextView::CountLines()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CountLines();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BTextView::CurrentLine()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->CurrentLine();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::GoToLine(lineIndex)
	INPUT:
		int32 lineIndex;
	CODE:
		// item 0: THIS
		// item 1: lineIndex
		
		THIS->GoToLine(lineIndex);

void
BTextView::Cut(clipboard)
	INPUT:
		BClipboard* clipboard;
	CODE:
		// item 0: THIS
		// item 1: clipboard
		
		THIS->Cut(clipboard);

void
BTextView::Copy(clipboard)
	INPUT:
		BClipboard* clipboard;
	CODE:
		// item 0: THIS
		// item 1: clipboard
		
		THIS->Copy(clipboard);

void
BTextView::Paste(clipboard)
	INPUT:
		BClipboard* clipboard;
	CODE:
		// item 0: THIS
		// item 1: clipboard
		
		THIS->Paste(clipboard);

void
BTextView::Clear()
	CODE:
		// item 0: THIS
		
		THIS->Clear();

bool
BTextView::AcceptsPaste(clipboard)
	INPUT:
		BClipboard* clipboard;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: clipboard
		
		retval = THIS->AcceptsPaste(clipboard);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BTextView::AcceptsDrop(archive)
	INPUT:
		BMessage* archive;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: archive
		
		retval = THIS->AcceptsDrop(archive);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::Select(startOffset, endOffset)
	INPUT:
		int32 startOffset;
		int32 endOffset;
	CODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: endOffset
		
		THIS->Select(startOffset, endOffset);

void
BTextView::SelectAll()
	CODE:
		// item 0: THIS
		
		THIS->SelectAll();

void
BTextView::GetSelection()
	INIT:
		int32 outStart;
		int32 outEnd;
		SV* outStart_sv = newSV(0);	// retcount > 1
		SV* outEnd_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetSelection(&outStart, &outEnd);
		sv_setiv(outStart_sv, (IV)outStart);
		sv_setiv(outEnd_sv, (IV)outEnd);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(outStart_sv));
		PUSHs(sv_2mortal(outEnd_sv));

void
BTextView::SetFontAndColor(inFont, ...)
	INPUT:
		BFont* inFont;
	INIT:
		uint32 inMode = B_FONT_ALL;
		rgb_color* inColor = NULL;
	CODE:
		// item 0: THIS
		// item 1: inFont
		// item 2: inMode
		if (items > 2) {
			inMode = (uint32)SvUV(ST(2));
		}
		// item 3: inColor
		if (items > 3) {
			inColor = (rgb_color*)get_cpp_object(ST(3));
		}
		
		THIS->SetFontAndColor(inFont, inMode, inColor);

void
BTextView::SetFontAndColorBetweenOffsets(startOffset, endOffset, inFont, ...)
	INPUT:
		int32 startOffset;
		int32 endOffset;
		BFont* inFont;
	INIT:
		uint32 inMode = B_FONT_ALL;
		rgb_color* inColor = NULL;
	CODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: endOffset
		// item 3: inFont
		// item 4: inMode
		if (items > 4) {
			inMode = (uint32)SvUV(ST(4));
		}
		// item 5: inColor
		if (items > 5) {
			inColor = (rgb_color*)get_cpp_object(ST(5));
		}
		
		THIS->SetFontAndColor(startOffset, endOffset, inFont, inMode, inColor);

SV*
BTextView::GetFontAndColor(inOffset, ...)
	INPUT:
		int32 inOffset;
	INIT:
		BFont* outFont;
		rgb_color* outColor = NULL;
		SV* outFont_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: inOffset
		// item 3: outColor
		if (items > 3) {
			outColor = (rgb_color*)get_cpp_object(ST(3));
		}
		
		THIS->GetFontAndColor(inOffset, outFont, outColor);
		
		outFont_sv = create_perl_object((void*)outFont, "Haiku::Font", false);
		DUMPME(1,outFont_sv);
		RETVAL = newSVsv(outFont_sv);
		SvREFCNT_dec(outFont_sv);
	OUTPUT:
		RETVAL

void
BTextView::GetFontAndColorAtSelection()
	INIT:
		BFont* outFont;
		uint32 sameProperties;
		rgb_color* outColor = NULL;
		bool sameColor;
		SV* outFont_sv = newSV(0);	// retcount > 1
		SV* sameProperties_sv = newSV(0);	// retcount > 1
		SV* outColor_sv = newSV(0);	// retcount > 1
		SV* sameColor_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetFontAndColor(outFont, &sameProperties, outColor, &sameColor);
		sv_setuv(sameProperties_sv, (UV)sameProperties);
		sameColor_sv = boolSV(sameColor);
		
		outFont_sv = create_perl_object((void*)outFont, "Haiku::Font", false);
		DUMPME(1,outFont_sv);
		outColor_sv = create_perl_object((void*)outColor, "Haiku::rgb_color", false);
		DUMPME(1,outColor_sv);
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(outFont_sv));
		PUSHs(sv_2mortal(sameProperties_sv));
		PUSHs(sv_2mortal(outColor_sv));
		PUSHs(sv_2mortal(sameColor_sv));

void
BTextView::SetRunArray(startOffset, endOffset, ...)
	INPUT:
		int32 startOffset;
		int32 endOffset;
	INIT:
		text_run_array* inRuns = NULL;
	CODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: endOffset
		// item 3: inRuns
		if (items > 3) {
			inRuns = (text_run_array*)get_cpp_object(ST(3));
		}
		
		THIS->SetRunArray(startOffset, endOffset, inRuns);

void
BTextView::RunArray(startOffset, endOffset)
	INPUT:
		int32 startOffset;
		int32 endOffset;
	INIT:
		int32 outSize;
		text_run_array* retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* outSize_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: endOffset
		
		retval = THIS->RunArray(startOffset, endOffset, &outSize);
		sv_setiv(outSize_sv, (IV)outSize);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::text_run_array", false);
		DUMPME(1,retval_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(outSize_sv));

int32
BTextView::LineAt(offset)
	INPUT:
		int32 offset;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: offset
		
		retval = THIS->LineAt(offset);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BTextView::LineAtPoint(point)
	INPUT:
		BPoint point;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->LineAt(point);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::PointAt(offset)
	INPUT:
		int32 offset;
	INIT:
		float outHeight;
		BPoint retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* outHeight_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: offset
		
		retval = THIS->PointAt(offset, &outHeight);
		sv_setnv(outHeight_sv, (double)outHeight);
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Point", false);
		DUMPME(1,retval_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(outHeight_sv));

int32
BTextView::OffsetAt(line)
	INPUT:
		int32 line;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: line
		
		retval = THIS->OffsetAt(line);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

int32
BTextView::OffsetAtPoint(point)
	INPUT:
		BPoint point;
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		// item 1: point
		
		retval = THIS->OffsetAt(point);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::FindWord(inOffset)
	INPUT:
		int32 inOffset;
	INIT:
		int32 outFromOffset;
		int32 outToOffset;
		SV* outFromOffset_sv = newSV(0);	// retcount > 1
		SV* outToOffset_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: inOffset
		
		THIS->FindWord(inOffset, &outFromOffset, &outToOffset);
		sv_setiv(outFromOffset_sv, (IV)outFromOffset);
		sv_setiv(outToOffset_sv, (IV)outToOffset);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(outFromOffset_sv));
		PUSHs(sv_2mortal(outToOffset_sv));

bool
BTextView::CanEndLine(offset)
	INPUT:
		int32 offset;
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		// item 1: offset
		
		retval = THIS->CanEndLine(offset);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BTextView::LineWidth(...)
	INIT:
		int32 lineIndex = 0;
		float retval;
	CODE:
		// item 0: THIS
		// item 1: lineIndex
		if (items > 1) {
			lineIndex = (int32)SvIV(ST(1));
		}
		
		retval = THIS->LineWidth(lineIndex);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BTextView::LineHeight(...)
	INIT:
		int32 lineIndex = 0;
		float retval;
	CODE:
		// item 0: THIS
		// item 1: lineIndex
		if (items > 1) {
			lineIndex = (int32)SvIV(ST(1));
		}
		
		retval = THIS->LineHeight(lineIndex);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BTextView::TextHeight(...)
	INIT:
		int32 startLine = 0;
		int32 endLine = 0;
		float retval;
	CODE:
		// item 0: THIS
		// item 1: startLine
		if (items > 1) {
			startLine = (int32)SvIV(ST(1));
		}
		// item 2: endLine
		if (items > 2) {
			endLine = (int32)SvIV(ST(2));
		}
		
		retval = THIS->TextHeight(startLine, endLine);
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::ScrollToOffset(offset)
	INPUT:
		int32 offset;
	CODE:
		// item 0: THIS
		// item 1: offset
		
		THIS->ScrollToOffset(offset);

void
BTextView::ScrollToSelection()
	CODE:
		// item 0: THIS
		
		THIS->ScrollToSelection();

void
BTextView::Highlight(startOffset, endOffset)
	INPUT:
		int32 startOffset;
		int32 endOffset;
	CODE:
		// item 0: THIS
		// item 1: startOffset
		// item 2: endOffset
		
		THIS->Highlight(startOffset, endOffset);

void
BTextView::SetTextRect(rect)
	INPUT:
		BRect rect;
	CODE:
		// item 0: THIS
		// item 1: rect
		
		THIS->SetTextRect(rect);

SV*
BTextView::TextRect()
	INIT:
		BRect retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->TextRect();
		
		retval_sv = create_perl_object((void*)&retval, "Haiku::Rect", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTextView::SetInsets(left, top, right, bottom)
	INPUT:
		float left;
		float top;
		float right;
		float bottom;
	CODE:
		// item 0: THIS
		// item 1: left
		// item 2: top
		// item 3: right
		// item 4: bottom
		
		THIS->SetInsets(left, top, right, bottom);

void
BTextView::GetInsets()
	INIT:
		float left;
		float top;
		float right;
		float bottom;
		SV* left_sv = newSV(0);	// retcount > 1
		SV* top_sv = newSV(0);	// retcount > 1
		SV* right_sv = newSV(0);	// retcount > 1
		SV* bottom_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetInsets(&left, &top, &right, &bottom);
		sv_setnv(left_sv, (double)left);
		sv_setnv(top_sv, (double)top);
		sv_setnv(right_sv, (double)right);
		sv_setnv(bottom_sv, (double)bottom);
		
		EXTEND(SP, 4);
		PUSHs(sv_2mortal(left_sv));
		PUSHs(sv_2mortal(top_sv));
		PUSHs(sv_2mortal(right_sv));
		PUSHs(sv_2mortal(bottom_sv));

void
BTextView::SetStylable(stylable)
	INPUT:
		bool stylable;
	CODE:
		// item 0: THIS
		// item 1: stylable
		
		THIS->SetStylable(stylable);

bool
BTextView::IsStylable()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsStylable();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::SetTabWidth(width)
	INPUT:
		float width;
	CODE:
		// item 0: THIS
		// item 1: width
		
		THIS->SetTabWidth(width);

float
BTextView::TabWidth()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->TabWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::MakeSelectable(selectable)
	INPUT:
		bool selectable;
	CODE:
		// item 0: THIS
		// item 1: selectable
		
		THIS->MakeSelectable(selectable);

bool
BTextView::IsSelectable()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSelectable();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::MakeEditable(editable)
	INPUT:
		bool editable;
	CODE:
		// item 0: THIS
		// item 1: editable
		
		THIS->MakeEditable(editable);

bool
BTextView::IsEditable()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEditable();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::SetWordWrap(wrap)
	INPUT:
		bool wrap;
	CODE:
		// item 0: THIS
		// item 1: wrap
		
		THIS->SetWordWrap(wrap);

bool
BTextView::DoesWordWrap()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->DoesWordWrap();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::SetMaxBytes(max)
	INPUT:
		int32 max;
	CODE:
		// item 0: THIS
		// item 1: max
		
		THIS->SetMaxBytes(max);

int32
BTextView::MaxBytes()
	INIT:
		int32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->MaxBytes();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::DisallowChar(aChar)
	INPUT:
		uint32 aChar;
	CODE:
		// item 0: THIS
		// item 1: aChar
		
		THIS->DisallowChar(aChar);

void
BTextView::AllowChar(aChar)
	INPUT:
		uint32 aChar;
	CODE:
		// item 0: THIS
		// item 1: aChar
		
		THIS->AllowChar(aChar);

void
BTextView::SetAlignment(flag)
	INPUT:
		alignment flag;
	CODE:
		// item 0: THIS
		// item 1: flag
		
		THIS->SetAlignment(flag);

alignment
BTextView::Alignment()
	INIT:
		alignment retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Alignment();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::SetAutoindent(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->SetAutoindent(state);

bool
BTextView::DoesAutoindent()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->DoesAutoindent();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::SetColorSpace(colors)
	INPUT:
		color_space colors;
	CODE:
		// item 0: THIS
		// item 1: colors
		
		THIS->SetColorSpace(colors);

color_space
BTextView::ColorSpace()
	INIT:
		color_space retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->ColorSpace();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::MakeResizable(resize, ...)
	INPUT:
		bool resize;
	INIT:
		BView* resizeView = NULL;
	CODE:
		// item 0: THIS
		// item 1: resize
		// item 2: resizeView
		if (items > 2) {
			resizeView = (BView*)get_cpp_object(ST(2));
		}
		
		THIS->MakeResizable(resize, resizeView);

bool
BTextView::IsResizable()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsResizable();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::SetDoesUndo(undo)
	INPUT:
		bool undo;
	CODE:
		// item 0: THIS
		// item 1: undo
		
		THIS->SetDoesUndo(undo);

bool
BTextView::DoesUndo()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->DoesUndo();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::HideTyping(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->HideTyping(enabled);

bool
BTextView::IsTypingHidden()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsTypingHidden();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::ResizeToPreferred()
	CODE:
		// item 0: THIS
		
		THIS->ResizeToPreferred();

void
BTextView::GetPreferredSize()
	INIT:
		float width;
		float height;
		SV* width_sv = newSV(0);	// retcount > 1
		SV* height_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		THIS->GetPreferredSize(&width, &height);
		sv_setnv(width_sv, (double)width);
		sv_setnv(height_sv, (double)height);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(width_sv));
		PUSHs(sv_2mortal(height_sv));

bool
BTextView::HasHeightForWidth()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->HasHeightForWidth();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTextView::GetHeightForWidth(width)
	INPUT:
		float width;
	INIT:
		float min;
		float max;
		float preferred;
		SV* min_sv = newSV(0);	// retcount > 1
		SV* max_sv = newSV(0);	// retcount > 1
		SV* preferred_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: width
		
		THIS->GetHeightForWidth(width, &min, &max, &preferred);
		sv_setnv(min_sv, (double)min);
		sv_setnv(max_sv, (double)max);
		sv_setnv(preferred_sv, (double)preferred);
		
		EXTEND(SP, 3);
		PUSHs(sv_2mortal(min_sv));
		PUSHs(sv_2mortal(max_sv));
		PUSHs(sv_2mortal(preferred_sv));

void
BTextView::InvalidateLayout(...)
	INIT:
		bool descendants = false;
	CODE:
		// item 0: THIS
		// item 1: descendants
		if (items > 1) {
			descendants = SvTRUE(ST(1));
		}
		
		THIS->InvalidateLayout(descendants);

void
BTextView::AllocRunArray(entryCount)
	INPUT:
		int32 entryCount;
	INIT:
		int32 outSize;
		text_run_array* retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* outSize_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		// item 1: entryCount
		
		retval = THIS->AllocRunArray(entryCount, &outSize);
		sv_setiv(outSize_sv, (IV)outSize);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::text_run_array", false);
		DUMPME(1,retval_sv);
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(outSize_sv));

SV*
BTextView::CopyRunArray(orig, countDelta)
	INPUT:
		text_run_array* orig;
		int32 countDelta;
	INIT:
		text_run_array* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: orig
		// item 2: countDelta
		
		retval = THIS->CopyRunArray(orig, countDelta);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::text_run_array", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTextView::FreeRunArray(array)
	INPUT:
		text_run_array* array;
	CODE:
		// item 0: THIS
		// item 1: array
		
		THIS->FreeRunArray(array);

SV*
BTextView::FlattenRunArray(inArray)
	INPUT:
		const text_run_array* inArray;
	INIT:
		int32 outSize;
		void* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: inArray
		// not an XS input: outSize
		
		retval = THIS->FlattenRunArray(inArray, &outSize);
		
		retval_sv = newSVpvn((char*)retval, (STRLEN)outSize);
		if (is_utf8_string((const U8*)retval, (STRLEN)outSize)) {
			SvUTF8_on(retval_sv);
		}
		RETVAL = retval_sv;
	OUTPUT:
		RETVAL

SV*
BTextView::UnflattenRunArray(data_sv)
	INPUT:
		SV* data_sv;
	INIT:
		void* data;
		STRLEN data_sv_length;
		int32 outSize;
		text_run_array* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		// item 1: data
		data = (void*)SvPV(data_sv, data_sv_length);
		outSize = data_sv_length;
		// not an XS input: outSize
		
		retval = THIS->UnflattenRunArray(data, &outSize);
		
		retval_sv = create_perl_object((void*)retval, "Haiku::text_run_array", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

void
BTextView::Undo(clipoard)
	INPUT:
		BClipboard* clipoard;
	CODE:
		// item 0: THIS
		// item 1: clipoard
		
		THIS->Undo(clipoard);

void
BTextView::UndoState()
	INIT:
		bool isRedo;
		undo_state retval;
		SV* retval_sv = newSV(0);	// retcount > 1
		SV* isRedo_sv = newSV(0);	// retcount > 1
	PPCODE:
		// item 0: THIS
		
		retval = THIS->UndoState(&isRedo);
		sv_setiv(retval_sv, (IV)retval);
		isRedo_sv = boolSV(isRedo);
		
		EXTEND(SP, 2);
		PUSHs(sv_2mortal(retval_sv));
		PUSHs(sv_2mortal(isRedo_sv));

void
BTextView::AttachedToWindow()
	CODE:
		// item 0: THIS
		
		THIS->BTextView::AttachedToWindow();

void
BTextView::DetachedFromWindow()
	CODE:
		// item 0: THIS
		
		THIS->BTextView::DetachedFromWindow();

void
BTextView::Draw(updateRect)
	INPUT:
		BRect updateRect;
	CODE:
		// item 0: THIS
		// item 1: updateRect
		
		THIS->BTextView::Draw(updateRect);

void
BTextView::MouseDown(point)
	INPUT:
		BPoint point;
	CODE:
		// item 0: THIS
		// item 1: point
		
		THIS->BTextView::MouseDown(point);

void
BTextView::MouseUp(point)
	INPUT:
		BPoint point;
	CODE:
		// item 0: THIS
		// item 1: point
		
		THIS->BTextView::MouseUp(point);

void
BTextView::MouseMoved(point, transit, message)
	INPUT:
		BPoint point;
		uint32 transit;
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: point
		// item 2: transit
		// item 3: message
		
		THIS->BTextView::MouseMoved(point, transit, message);

void
BTextView::WindowActivated(state)
	INPUT:
		bool state;
	CODE:
		// item 0: THIS
		// item 1: state
		
		THIS->BTextView::WindowActivated(state);

void
BTextView::KeyDown(bytes_sv)
	INPUT:
		SV* bytes_sv;
	INIT:
		const char* bytes;
		STRLEN bytes_sv_length;
		int32 numBytes;
	CODE:
		// item 0: THIS
		// item 1: bytes
		bytes = (const char*)SvPV(bytes_sv, bytes_sv_length);
		numBytes = bytes_sv_length;
		// not an XS input: numBytes
		
		THIS->BTextView::KeyDown(bytes, numBytes);

void
BTextView::Pulse()
	CODE:
		// item 0: THIS
		
		THIS->BTextView::Pulse();

void
BTextView::FrameResized(newWidth, newHeight)
	INPUT:
		float newWidth;
		float newHeight;
	CODE:
		// item 0: THIS
		// item 1: newWidth
		// item 2: newHeight
		
		THIS->BTextView::FrameResized(newWidth, newHeight);

void
BTextView::MessageReceived(message)
	INPUT:
		BMessage* message;
	CODE:
		// item 0: THIS
		// item 1: message
		must_not_delete_cpp_object(ST(1), true);
		
		THIS->BTextView::MessageReceived(message);

void
BTextView::AllAttached()
	CODE:
		// item 0: THIS
		
		THIS->BTextView::AllAttached();

void
BTextView::AllDetached()
	CODE:
		// item 0: THIS
		
		THIS->BTextView::AllDetached();

SV*
B_UNDO_UNAVAILABLE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDO_UNAVAILABLE);
		dualize(RETVAL, "B_UNDO_UNAVAILABLE");
	OUTPUT:
		RETVAL

SV*
B_UNDO_TYPING()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDO_TYPING);
		dualize(RETVAL, "B_UNDO_TYPING");
	OUTPUT:
		RETVAL

SV*
B_UNDO_CUT()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDO_CUT);
		dualize(RETVAL, "B_UNDO_CUT");
	OUTPUT:
		RETVAL

SV*
B_UNDO_PASTE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDO_PASTE);
		dualize(RETVAL, "B_UNDO_PASTE");
	OUTPUT:
		RETVAL

SV*
B_UNDO_CLEAR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDO_CLEAR);
		dualize(RETVAL, "B_UNDO_CLEAR");
	OUTPUT:
		RETVAL

SV*
B_UNDO_DROP()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_UNDO_DROP);
		dualize(RETVAL, "B_UNDO_DROP");
	OUTPUT:
		RETVAL

bool
BTextView::operator_eq(object, swap)
	INPUT:
		BTextView* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BTextView::operator_ne(object, swap)
	INPUT:
		BTextView* object;
		IV swap;
	OVERLOAD: !=
	CODE:
		RETVAL = THIS != object;
	OUTPUT:
		RETVAL

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::TextView::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::TextView::()", XS_Haiku__InterfaceKit_nil, file);

