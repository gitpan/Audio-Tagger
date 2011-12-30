#!perl -T

use Test::More skip_all => "save for flac files does not work";

use File::Copy;
use Audio::Tagger qw(File);

my $files = [{filename => 't/data/brown.flac'}, {filename => 't/data/pink.flac'}, {filename => 't/data/white.flac'}];

foreach my $file (@$files) {
	my $temp   = 't/data/temp.flac';
	copy($file -> {filename}, $temp)
		or die "Copy failed: $!";

	my $tagger = File($temp);

	my $new_title = 'Another title';
	$tagger -> title($new_title);

	my $new_artist = 'Another artist';
	$tagger -> artist($new_artist);

	my $new_album = 'Another album';
	$tagger -> album($new_album);

	my $new_comment = 'Another comment';
	$tagger -> comment($new_comment);

	my $new_year = 2000;
	$tagger -> year($new_year);

	my $new_track = 5;
	$tagger -> track($new_track);

	is($tagger -> save, 1);

	my $tagger2 = File($temp);

	is($tagger2 -> title, $new_title);
	is($tagger2 -> artist, $new_artist);
	is($tagger2 -> album, $new_album);
	is($tagger2 -> comment, $new_comment);
	is($tagger2 -> year, $new_year);
	is($tagger2 -> track, $new_track);

	unlink($temp);
}

done_testing;
