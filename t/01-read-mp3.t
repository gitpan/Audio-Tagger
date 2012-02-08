#!perl -T

use Test::More;

use lib 't/lib';

use Audio::Tagger qw(MP3);
use Test::Audio::Tagger::Data;

foreach my $file (@$Test::Audio::Tagger::Data::mp3_files) {
	my $tagger = MP3($file -> {filename});

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
