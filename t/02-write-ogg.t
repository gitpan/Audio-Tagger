#!perl -T

use Test::More;

use File::Copy;
use Audio::Tagger qw(File);

my $files = [{filename => 't/data/brown.ogg'}, {filename => 't/data/pink.ogg'}, {filename => 't/data/white.ogg'}];

foreach my $file (@$files) {
	my $temp   = 't/data/temp.ogg';
	copy($file -> {filename}, $temp)
		or die "Copy failed: $!";

	my $tagger = File($temp);

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
