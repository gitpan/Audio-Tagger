package Audio::Tagger::Ogg;
{
  $Audio::Tagger::Ogg::VERSION = '0.08';
}

use strict;
use warnings;

=head1 NAME

Audio::Tagger::Ogg - Perl module to handle audio metadata (ogg files)

=head1 VERSION

version 0.08

=head1 SYNOPSIS

Synopsis section

    use feature 'say';

    use Audio::Tagger::Ogg;

    my $tagger = Audio::Tagger::Ogg -> new("/path/to/file.ogg");

    # print the song title
    say $tagger -> title;

    # print the song artist
    say $tagger -> artist;

    # change and print the song album
    say $tagger -> album("Awesome Album");

    # save the modifications to disk
    $tagger -> save or
        die("Cannot write to disk");

=head1 METHODS

=head2 new( $filename )

Create an C<Audio::Tagger::Ogg> object given a file name.

=cut

sub new {
	my ($class, $filename) = @_;

	return Audio::Tagger::Ogg::_tagger_ogg_file_new($filename);
}

=head2 save( )

Save the file to disk. Returns C<true> on success.

=cut

sub save {
	my $self = shift;

	return $self -> _tagger_ogg_file_save();
}

=for Pod::Coverage DESTROY

=cut

sub DESTROY {
	my $self = shift;

	$self -> _tagger_ogg_file_destroy();
}

=head2 title( [ $title ] )

Return the title tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the title tag to C<$title>.

=cut

sub title {
	my ($self, $title)  = @_;

	(defined $title)						?
		$self -> _tagger_ogg_tag_set_str(0, $title)		:
		$self -> _tagger_ogg_tag_get_str(0);
}

=head2 artist( [ $artist ] )

Return the artist tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the artist tag to C<$artist>.

=cut

sub artist {
	my ($self, $artist)  = @_;

	(defined $artist)						?
		$self -> _tagger_ogg_tag_set_str(1, $artist)	:
		$self -> _tagger_ogg_tag_get_str(1);
}

=head2 album( [ $album ] )

Return the album tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the album tag to C<$album>.

=cut

sub album {
	my ($self, $album)  = @_;

	(defined $album)						?
		$self -> _tagger_ogg_tag_set_str(2, $album)		:
		$self -> _tagger_ogg_tag_get_str(2);
}

=head2 comment( [ $comment ] )

Return the comment tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the comment tag to C<$comment>.

=cut

sub comment {
	my ($self, $comment)  = @_;

	(defined $comment)						?
		$self -> _tagger_ogg_tag_set_str(3, $comment)	:
		$self -> _tagger_ogg_tag_get_str(3);
}

=head2 genre( [ $genre ] )

Return the genre tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the genre tag to C<$genre>.

=cut

sub genre {
	my ($self, $genre)  = @_;

	(defined $genre)						?
		$self -> _tagger_ogg_tag_set_str(4, $genre)		:
		$self -> _tagger_ogg_tag_get_str(4);
}

=head2 year( [ $year ] )

Return the year tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the year tag to C<$year>.

=cut

sub year {
	my ($self, $year)  = @_;

	(defined $year)							?
		$self -> _tagger_ogg_tag_set_num(0, $year)		:
		$self -> _tagger_ogg_tag_get_num(0);
}

=head2 track( [ $track ] )

Return the track tag of the given C<Audio::Tagger::Ogg> object, if called with no
arguments, otherwise set the track tag to C<$track>.

=cut

sub track {
	my ($self, $track)  = @_;

	(defined $track)						?
		$self -> _tagger_ogg_tag_set_num(1, $track)		:
		$self -> _tagger_ogg_tag_get_num(1);
}

=head2 bitrate( )

Return the bitrate of the given C<Audio::Tagger::Ogg> object.

=cut

sub bitrate {
	my $self = shift;

	$self -> _tagger_ogg_prop_get_num(0);
}

=head2 samplerate( )

Return the sample rate of the given C<Audio::Tagger::Ogg> object.

=cut

sub samplerate {
	my $self = shift;

	$self -> _tagger_ogg_prop_get_num(1);
}

=head2 channels( )

Return the number of channels of the given C<Audio::Tagger::Ogg> object.

=cut

sub channels {
	my $self = shift;

	$self -> _tagger_ogg_prop_get_num(2);
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

1; # End of Audio::Tagger::Ogg
