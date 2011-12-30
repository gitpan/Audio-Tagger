#!perl -T

use Test::More;

use Audio::Tagger;

{
	my $tagger = Audio::Tagger::FileRef -> new('t/data/brown.ogg');

	is($tagger -> title, "Brown Noise");
	is($tagger -> artist, "A random guy");
	is($tagger -> album, "Some noise");
	is($tagger -> comment, "I am a comment");
	is($tagger -> year, 2011);
	is($tagger -> track, 1);
}

{
	my $tagger = Audio::Tagger::FileRef -> new('t/data/pink.ogg');

	is($tagger -> title, "Pink Noise");
	is($tagger -> artist, "A random guy");
	is($tagger -> album, "Some noise");
	is($tagger -> comment, "I am a comment");
	is($tagger -> year, 2011);
	is($tagger -> track, 2);
}

{
	my $tagger = Audio::Tagger::FileRef -> new('t/data/white.ogg');

	is($tagger -> title, "White Noise");
	is($tagger -> artist, "A random guy");
	is($tagger -> album, "Some noise");
	is($tagger -> comment, "I am a comment");
	is($tagger -> year, 2011);
	is($tagger -> track, 3);
}

done_testing;
