package Audio::Tagger::FileRef;
{
  $Audio::Tagger::FileRef::VERSION = '0.01';
}

use strict;
use warnings;

=head1 NAME

Audio::Tagger::FileRef - Perl module to handle audio metadata (FileRef)

=head1 VERSION

version 0.01

=head1 SYNOPSIS

Synopsis section

    use feature 'say';

    use Audio::Tagger::FileRef;

    my $tagger = Audio::Tagger::FileRef -> new("/path/to/file.mp3");

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

=head1 METHODS

=head2 new( $filename )

Create an C<Audio::Tagger> object given a file name.

=cut

sub new {
	my ($class, $filename) = @_;

	return Audio::Tagger::FileRef::_tagger_fileref_file_new($filename);
}

=head2 save( )

Save the file to disk. Returns C<true> on success.

=cut

sub save {
	my $self = shift;

	return $self -> _tagger_fileref_file_save();
}

=for Pod::Coverage DESTROY

=cut

sub DESTROY {
	my $self = shift;

	$self -> _tagger_fileref_file_destroy();
}

=head2 title( [ $title ] )

Return the title tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the title tag to C<$title>.

=cut

sub title {
	my ($self, $title)  = @_;

	(defined $title)						?
		$self -> _tagger_fileref_tag_set_str(0, $title)		:
		$self -> _tagger_fileref_tag_get_str(0);
}

=head2 artist( [ $artist ] )

Return the artist tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the artist tag to C<$artist>.

=cut

sub artist {
	my ($self, $artist)  = @_;

	(defined $artist)						?
		$self -> _tagger_fileref_tag_set_str(1, $artist)	:
		$self -> _tagger_fileref_tag_get_str(1);
}

=head2 album( [ $album ] )

Return the album tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the album tag to C<$album>.

=cut

sub album {
	my ($self, $album)  = @_;

	(defined $album)						?
		$self -> _tagger_fileref_tag_set_str(2, $album)		:
		$self -> _tagger_fileref_tag_get_str(2);
}

=head2 comment( [ $comment ] )

Return the comment tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the comment tag to C<$comment>.

=cut

sub comment {
	my ($self, $comment)  = @_;

	(defined $comment)						?
		$self -> _tagger_fileref_tag_set_str(3, $comment)	:
		$self -> _tagger_fileref_tag_get_str(3);
}

=head2 genre( [ $genre ] )

Return the genre tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the genre tag to C<$genre>.

=cut

sub genre {
	my ($self, $genre)  = @_;

	(defined $genre)						?
		$self -> _tagger_fileref_tag_set_str(4, $genre)		:
		$self -> _tagger_fileref_tag_get_str(4);
}

=head2 year( [ $year ] )

Return the year tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the year tag to C<$year>.

=cut

sub year {
	my ($self, $year)  = @_;

	(defined $year)							?
		$self -> _tagger_fileref_tag_set_num(0, $year)		:
		$self -> _tagger_fileref_tag_get_num(0);
}

=head2 track( [ $track ] )

Return the track tag of the given C<Audio::Tagger> object, if called with no
arguments, otherwise set the track tag to C<$track>.

=cut

sub track {
	my ($self, $track)  = @_;

	(defined $track)						?
		$self -> _tagger_fileref_tag_set_num(1, $track)		:
		$self -> _tagger_fileref_tag_get_num(1);
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

1; # End of Audio::Tagger::FileRef
