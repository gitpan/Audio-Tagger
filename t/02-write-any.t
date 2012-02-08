#!perl -T

use Test::More;

use lib 't';

use File::Copy;
use File::Basename;
use Audio::Tagger qw(Any);
use Test::Audio::Tagger::Data;

my @all_files = (
	@$Test::Audio::Tagger::Data::flac_files,
	@$Test::Audio::Tagger::Data::mp3_files,
	@$Test::Audio::Tagger::Data::ogg_files
);

foreach my $file (@all_files) {
	my (undef, undef, $ext) = fileparse($file -> {filename},'\..*');
	my $temp   = "t/data/temp$ext";

	copy($file -> {filename}, $temp)
		or die "Copy failed: $!";

	my $tagger = Any($temp);

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
