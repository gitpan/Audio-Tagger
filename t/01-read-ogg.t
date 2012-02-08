#!perl -T

use Test::More;

use lib 't';

use Audio::Tagger qw(Ogg);
use Test::Audio::Tagger::Data;

foreach my $file (@$Test::Audio::Tagger::Data::ogg_files) {
	my $tagger = Ogg($file -> {filename});

	is($tagger -> title, $file -> {title});
	is($tagger -> artist, $file -> {artist});
	is($tagger -> album, $file -> {album});
	is($tagger -> comment, $file -> {comment});
	is($tagger -> year, $file -> {year});
	is($tagger -> track, $file -> {track});

	is($tagger -> bitrate, $file -> {bitrate});
	is($tagger -> samplerate, $file -> {samplerate});
	is($tagger -> channels, $file -> {channels});
}

done_testing;
