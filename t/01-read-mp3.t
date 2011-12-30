#!perl -T

use Test::More;

use Audio::Tagger qw(File MP3);

my $files = [{
	filename => 't/data/brown.mp3', title => 'Brown Noise',
	artist => 'A random guy', album => 'Some noise',
	comment => 'I am a comment', year => 2011, track => 1
}, {
	filename => 't/data/pink.mp3', title => 'Pink Noise',
	artist   => 'A random guy', album  => 'Some noise',
	comment  => 'I am a comment', year => 2011, track => 2
}, {
	filename => 't/data/white.mp3', title => 'White Noise',
	artist   => 'A random guy', album => 'Some noise',
	comment  => 'I am a comment', year => 2011, track => 3
}];

foreach my $file (@$files) {
	my $tagger = File($file -> {filename});

	is($tagger -> title, $file -> {title});
	is($tagger -> artist, $file -> {artist});
	is($tagger -> album, $file -> {album});
	is($tagger -> comment, $file -> {comment});
	is($tagger -> year, $file -> {year});
	is($tagger -> track, $file -> {track});

	$tagger = MP3($file -> {filename});

	is($tagger -> title, $file -> {title});
	is($tagger -> artist, $file -> {artist});
	is($tagger -> album, $file -> {album});
	is($tagger -> comment, $file -> {comment});
	is($tagger -> year, $file -> {year});
	is($tagger -> track, $file -> {track});
}

done_testing;
