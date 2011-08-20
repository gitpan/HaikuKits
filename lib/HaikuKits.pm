=head1 NAME

HaikuKits - access to the Haiku API

=head1 SYNOPSIS

    use Haiku::SupportKit;
    use Haiku::ApplicationKit;
    use Haiku::InterfaceKit;
    
    package MyApp;
    our @ISA = qw(Haiku::Application);
    
    # add windows and define events
    
    package MyWin;
    our @ISA = qw(Haiku::Window);
    
    # add views and define events
    
    package main;
    $app = new MyApp;
    $app->Run;

=head1 DESCRIPTION

Provides access to the Haiku API. The documentation for the individual classes and functions has not been written yet. For documentation on the underlying C++ classes and functions see the Haiku Book (L<http://api.haiku-os.org/>), the Be Book (L<http://www.haiku-os.org/legacy-docs/bebook/index.html>), or the system headers (F</boot/develop/headers/be>).

The C++ inputs and outputs have been converted to a more Perlish interface. Consider the following:

=over

=item String and array lengths

Since Perl strings and arrays now their lengths, you do not need to pass them in explicitly. So

    ssize_t BNode::WriteAttr(const char *name, type_code type, off_t offset,
                      const void *buffer, size_t len);

becomes

    $size = $node->WriteAttr($name, $type, $offset, $data);

The wrappers automatically get the length of $data and pass it in to the C++ method.

=item Inputs and outputs

Things that should be outputs are outputs. For example, consider the following method:

    char MenuItem::Shortcut(uint32* _modifiers = NULL) const;

Both the shortcut itself and the modifiers should be return values. But C++ can't do multiple return values, so the C++ programmer is forced to pass in a pointer to get the modifiers. In Perl this becomes

   ($shortcut, $modifiers) = $item->Shortcut;

=item Errors

When the return value or one of the inputs is a variable of type C<status_t>, if that variable is anything other than C<B_OK>, the function returns C<undef> and variable C<Haiku::E<lt>kitE<gt>::Error is set the error code. If there is no error (that is, if the error variable is equal to C<B_OK>), the function returns whatever it normally would, or C<1> if there are no other returned values. So

    BApplication::BApplication(const char* signature, status_t* error);

becomes

    my $app = new Haiku::Application($signature);

and returns the new Application object on success and undef on failure, while

    status_t BClipboard::Clear();

becomes

    my $success = $clipboard->Clear;

and returns 1 on success and undef on failure.

= item All together now

Putting all of this conversion together, a function like

    status_t get_named_icon(const char* name, uint8** _data, size_t* _size,
                            type_code* _type);

becomes

    ($icon, $type) = get_named_icon($name);

which returns the icon and its type on success and undef on failure.

=back

1;
