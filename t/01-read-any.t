#!perl -T

use Test::More;

use lib 't';

use Audio::Tagger qw(Any);
use Test::Audio::Tagger::Data;

my @all_files = (
	@$Test::Audio::Tagger::Data::flac_files,
	@$Test::Audio::Tagger::Data::mp3_files,
	@$Test::Audio::Tagger::Data::ogg_files
);

foreach my $file (@all_files) {
	my $tagger = Any($file -> {filename});

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
