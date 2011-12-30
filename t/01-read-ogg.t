#!perl -T

use Test::More;

use Audio::Tagger qw(File);

my $files = [{
	filename => 't/data/brown.ogg', title => 'Brown Noise',
	artist => 'A random guy', album => 'Some noise',
	comment => 'I am a comment', year => 2011, track => 1
}, {
	filename => 't/data/pink.ogg', title => 'Pink Noise',
	artist   => 'A random guy', album  => 'Some noise',
	comment  => 'I am a comment', year => 2011, track => 2
}, {
	filename => 't/data/white.ogg', title => 'White Noise',
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
}

done_testing;
