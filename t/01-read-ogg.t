#!perl -T

use Test::More;

use Audio::Tagger qw(File Ogg);

my $files = [{
	filename => 't/data/brown.ogg', title => 'Brown Noise',
	artist => 'A random guy', album => 'Some noise',
	comment => 'I am a comment', year => 2011, track => 1,
	bitrate => 80, samplerate => 48000, channels => 1
}, {
	filename => 't/data/pink.ogg', title => 'Pink Noise',
	artist   => 'A random guy', album  => 'Some noise',
	comment  => 'I am a comment', year => 2011, track => 2,
	bitrate => 80, samplerate => 48000, channels => 1
}, {
	filename => 't/data/white.ogg', title => 'White Noise',
	artist   => 'A random guy', album => 'Some noise',
	comment  => 'I am a comment', year => 2011, track => 3,
	bitrate => 80, samplerate => 48000, channels => 1
}];

foreach my $file (@$files) {
	my $tagger = File($file -> {filename});

	is($tagger -> title, $file -> {title});
	is($tagger -> artist, $file -> {artist});
	is($tagger -> album, $file -> {album});
	is($tagger -> comment, $file -> {comment});
	is($tagger -> year, $file -> {year});
	is($tagger -> track, $file -> {track});

	is($tagger -> bitrate, $file -> {bitrate});
	is($tagger -> samplerate, $file -> {samplerate});
	is($tagger -> channels, $file -> {channels});

	$tagger = Ogg($file -> {filename});

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
