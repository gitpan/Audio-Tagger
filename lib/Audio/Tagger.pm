package Audio::Tagger;
{
  $Audio::Tagger::VERSION = '0.01';
}

use strict;
use warnings;

require Exporter;
require XSLoader;
XSLoader::load('Audio::Tagger', $Audio::Tagger::VERSION);

use Audio::Tagger::FileRef;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw(
        File
);


=head1 NAME

Audio::Tagger - Perl module to handle audio metadata

=head1 VERSION

version 0.01

=head1 SYNOPSIS

Synopsis section

    use feature 'say';

    use Audio::Tagger qw(File);

    my $tagger = File("/path/to/file.mp3");

    # print the song title
    say $tagger -> title;

    # print the song artist
    say $tagger -> artist;

    # change and print the song album
    say $tagger -> album("Awesome Album");

    # save the modifications to disk
    $tagger -> save or
        die("Cannot write to disk");

=head1 DESCRIPTION

B<Audio::Tagger> is a module to read and write metadata from various types of
different audio formats, based on L<taglib|http://developer.kde.org/~wheeler/taglib.html>.
It tries to be easy to use, but flexible enough to allow most of the usages of
this kind of software. It isn't (and won't be) a full Perl taglib interface.

Why another module for audio tags? There are some other modules that handle
audio tags, but they are either incomplete or completely broken. For instance,
L<Audio::Scan> and L<Audio::File> can only read tags, L<Audio::TagLib> does not
even build, L<Audio::Metadata>, L<Audio::APE>, L<Mp3::Info>, and others support
only a single audio or tag format, etc...

=head1 SUBROUTINES

=head2 File( $filename )

Create an L<Audio::Tagger::FileRef> object given a file name.

=cut

sub File {
	my $filename = shift;

	return Audio::Tagger::FileRef -> new($filename);
}

=head1 AUTHOR

Alessandro Ghedini <alexbio@cpan.org>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1; # End of Audio::Tagger
