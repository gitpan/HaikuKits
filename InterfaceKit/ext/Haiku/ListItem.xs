#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::ListItem

PROTOTYPES: DISABLE

float
BListItem::Height()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Height();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

float
BListItem::Width()
	INIT:
		float retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Width();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

bool
BListItem::IsSelected()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSelected();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BListItem::Select()
	CODE:
		// item 0: THIS
		
		THIS->Select();

void
BListItem::Deselect()
	CODE:
		// item 0: THIS
		
		THIS->Deselect();

void
BListItem::SetEnabled(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->SetEnabled(enabled);

bool
BListItem::IsEnabled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEnabled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BListItem::SetHeight(height)
	INPUT:
		float height;
	CODE:
		// item 0: THIS
		// item 1: height
		
		THIS->SetHeight(height);

void
BListItem::SetWidth(width)
	INPUT:
		float width;
	CODE:
		// item 0: THIS
		// item 1: width
		
		THIS->SetWidth(width);

bool
BListItem::IsExpanded()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsExpanded();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BListItem::SetExpanded(expanded)
	INPUT:
		bool expanded;
	CODE:
		// item 0: THIS
		// item 1: expanded
		
		THIS->SetExpanded(expanded);

uint32
BListItem::OutlineLevel()
	INIT:
		uint32 retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->OutlineLevel();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BListItem::SetOutlineLevel(level)
	INPUT:
		uint32 level;
	CODE:
		// item 0: THIS
		// item 1: level
		
		THIS->SetOutlineLevel(level);

# xsubpp only enables overloaded operators for the initial module; additional
# modules are out of luck unless they roll their own, so that's what we do
# (XS_Haiku__InterfaceKit_nil defined automatically by xsubpp)
BOOT:
	sv_setsv(
		get_sv("Haiku::ListItem::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::ListItem::()", XS_Haiku__InterfaceKit_nil, file);

