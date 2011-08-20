#
# Automatically generated file
#

MODULE = Haiku::InterfaceKit	PACKAGE = Haiku::Tab

PROTOTYPES: DISABLE

SV*
BTab::new(...)
	INIT:
		BView* tabView = NULL;
		BTab* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: tabView
		if (items > 1) {
			tabView = (BView*)get_cpp_object(ST(1));
		}
		
		retval = new BTab(tabView);
		
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
		BTab* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: CLASS
		// item 1: archive
		
		retval = new BTab(archive);
		
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
		BTab* cpp_obj;
		object_link_data* link;
	CODE:
		DEBUGME(2,"Deleting perl wrapper for BTab");
		DUMPME(1,perl_obj);
		link = get_link_data(perl_obj);
		if (link != NULL && ! PL_dirty && link->can_delete_cpp_object) {
			DEBUGME(2,"-->Deleting the wrapped c++ object");
			cpp_obj = (BTab*)link->cpp_object;
			delete cpp_obj;
			link->cpp_object = NULL;
		}
		unlink_perl_object(perl_obj);

SV*
BTab::Instantiate(data)
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
BTab::Archive(...)
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

const char*
BTab::Label()
	INIT:
		const char* retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->Label();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTab::SetLabel(label)
	INPUT:
		const char* label;
	CODE:
		// item 0: THIS
		// item 1: label
		
		THIS->SetLabel(label);

bool
BTab::IsSelected()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsSelected();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTab::Select(owner)
	INPUT:
		BView* owner;
	CODE:
		// item 0: THIS
		// item 1: owner
		
		THIS->Select(owner);

void
BTab::Deselect()
	CODE:
		// item 0: THIS
		
		THIS->Deselect();

void
BTab::SetEnabled(enabled)
	INPUT:
		bool enabled;
	CODE:
		// item 0: THIS
		// item 1: enabled
		
		THIS->SetEnabled(enabled);

bool
BTab::IsEnabled()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsEnabled();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTab::MakeFocus(...)
	INIT:
		bool focused = true;
	CODE:
		// item 0: THIS
		// item 1: focused
		if (items > 1) {
			focused = SvTRUE(ST(1));
		}
		
		THIS->MakeFocus(focused);

bool
BTab::IsFocus()
	INIT:
		bool retval;
	CODE:
		// item 0: THIS
		
		retval = THIS->IsFocus();
		
		RETVAL = retval;
	OUTPUT:
		RETVAL

void
BTab::SetView(view)
	INPUT:
		BView* view;
	CODE:
		// item 0: THIS
		// item 1: view
		
		THIS->SetView(view);

SV*
BTab::View()
	INIT:
		BView* retval;
		SV* retval_sv = newSV(0);	// retcount == 1
	CODE:
		// item 0: THIS
		
		retval = THIS->View();
		
		retval_sv = create_perl_object((void*)retval, "Haiku::View", false);
		DUMPME(1,retval_sv);
		RETVAL = newSVsv(retval_sv);
		SvREFCNT_dec(retval_sv);
	OUTPUT:
		RETVAL

bool
BTab::operator_eq(object, swap)
	INPUT:
		BTab* object;
		IV swap;
	OVERLOAD: ==
	CODE:
		RETVAL = THIS == object;
	OUTPUT:
		RETVAL

bool
BTab::operator_ne(object, swap)
	INPUT:
		BTab* object;
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
		get_sv("Haiku::Tab::()", TRUE),
		&PL_sv_yes	// so we don't get fallback errors
	);
    newXS("Haiku::Tab::()", XS_Haiku__InterfaceKit_nil, file);

