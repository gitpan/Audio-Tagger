#!perl -T

use Test::More;

use lib 't/lib';

use File::Copy;
use Audio::Tagger qw(Any MP3);
use Test::Audio::Tagger::Data;

foreach my $file (@$Test::Audio::Tagger::Data::mp3_files) {
	my $temp   = 't/data/temp.mp3';

	copy($file -> {filename}, $temp)
		or die "Copy failed: $!";

	my $tagger = MP3($temp);

	my $new_title = 'Another title';
	$tagger -> title($new_title);
	is($tagger -> title, $new_title);

	my $new_artist = 'Another artist';
	$tagger -> artist($new_artist);
	is($tagger -> artist, $new_artist);

	my $new_album = 'Another album';
	$tagger -> album($new_album);
	is($tagger -> album, $new_album);

	my $new_comment = 'Another comment';
	$tagger -> comment($new_comment);
	is($tagger -> comment, $new_comment);

	my $new_year = 2000;
	$tagger -> year($new_year);
	is($tagger -> year, $new_year);

	my $new_track = 5;
	$tagger -> track($new_track);
	is($tagger -> track, $new_track);

	unlink($temp);
}

done_testing;
