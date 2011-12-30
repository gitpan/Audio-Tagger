#!perl -T

use Test::More;

use Audio::Tagger;

{
	my $tagger = Audio::Tagger::FileRef -> new('t/data/brown.mp3');

	is($tagger -> title, "Brown Noise");
	is($tagger -> artist, "A random guy");
	is($tagger -> album, "Some noise");
	is($tagger -> comment, "I am a comment");
	is($tagger -> year, 2011);
	is($tagger -> track, 1);
}

{
	my $tagger = Audio::Tagger::FileRef -> new('t/data/pink.mp3');

	is($tagger -> title, "Pink Noise");
	is($tagger -> artist, "A random guy");
	is($tagger -> album, "Some noise");
	is($tagger -> comment, "I am a comment");
	is($tagger -> year, 2011);
	is($tagger -> track, 2);
}

{
	my $tagger = Audio::Tagger::FileRef -> new('t/data/white.mp3');

	is($tagger -> title, "White Noise");
	is($tagger -> artist, "A random guy");
	is($tagger -> album, "Some noise");
	is($tagger -> comment, "I am a comment");
	is($tagger -> year, 2011);
	is($tagger -> track, 3);
}

done_testing;
