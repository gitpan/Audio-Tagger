#!perl -T

use Test::More;

use File::Copy;
use Audio::Tagger qw(MP3);

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
