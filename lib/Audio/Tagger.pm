package Audio::Tagger;
{
  $Audio::Tagger::VERSION = '0.02';
}

use strict;
use warnings;

require XSLoader;
XSLoader::load('Audio::Tagger', $Audio::Tagger::VERSION);

use Audio::Tagger::File;
use Audio::Tagger::MP3;

require Exporter;
our @ISA = qw(Exporter);

our @EXPORT_OK = qw(File MP3);

=head1 NAME

Audio::Tagger - Perl module to handle audio metadata

=head1 VERSION

version 0.02

=head1 SYNOPSIS

Synopsis section

    use feature 'say';

    use Audio::Tagger qw(File MP3);

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

    # strip all the tags from an mp3
    my $stripper = MP3("/path/to/file.mp3");

    $stripper -> strip or
        die("Cannot strip tags");
    $stripper -> save or
        die("Cannot write to disk");

=head1 DESCRIPTION

B<Audio::Tagger> is a module to read and write metadata from various types of
different audio formats. It tries to be easy to use, but also quite flexible.

Despite Audio::Tagger is based on the L<taglib|http://developer.kde.org/~wheeler/taglib.html>
library, it isn't and won't be a full Perl interface to taglib.

Why another module for audio tags? There are some other modules that handle
audio tags, but they are either incomplete or completely broken. For instance,
L<Audio::Scan> and L<Audio::File> can read but cannot write, L<Audio::Metadata>,
L<Audio::APE>, L<Mp3::Info>, and others support only a single audio or tag
format, L<Audio::TagLib> does not even build, etc...

=head1 SUBROUTINES

=head2 File( $filename )

Create an L<Audio::Tagger::File> object given a file name.

=cut

sub File {
	my $filename = shift;

	return Audio::Tagger::File -> new($filename);
}

=head2 MP3( $filename )

Create an L<Audio::Tagger::MP3> object given a file name.

=cut

sub MP3 {
	my $filename = shift;

	return Audio::Tagger::MP3 -> new($filename);
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
