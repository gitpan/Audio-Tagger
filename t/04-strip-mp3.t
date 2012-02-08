#!perl -T

use Test::More;

use lib 't';

use File::Copy;
use Audio::Tagger qw(MP3);
use Test::Audio::Tagger::Data;

foreach my $file (@$Test::Audio::Tagger::Data::mp3_files) {
	my $temp   = 't/data/temp.mp3';

	copy($file -> {filename}, $temp)
		or die "Copy failed: $!";

	my $tagger = MP3($temp);

	is($tagger -> strip, 1);

	my $tagger2 = MP3($temp);

	is($tagger2 -> title, '');
	is($tagger2 -> artist, '');
	is($tagger2 -> album, '');
	is($tagger2 -> comment, '');
	is($tagger2 -> year, 0);
	is($tagger2 -> track, 0);

	unlink($temp);
}

done_testing;
