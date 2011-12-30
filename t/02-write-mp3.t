#!perl -T

use Test::More;

use File::Copy;
use Audio::Tagger;

{
	copy('t/data/brown.mp3', 't/data/brown_write.mp3')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/brown_write.mp3');

	$tagger -> title("Another title");
	is($tagger -> title, "Another title");

	$tagger -> artist("Another artist");
	is($tagger -> artist, "Another artist");

	$tagger -> album("Another album");
	is($tagger -> album, "Another album");

	$tagger -> comment("Another comment");
	is($tagger -> comment, "Another comment");

	$tagger -> year(2000);
	is($tagger -> year, 2000);

	$tagger -> track(5);
	is($tagger -> track, 5);

	unlink('t/data/brown_write.mp3');
}

{
	copy('t/data/pink.mp3', 't/data/pink_write.mp3')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/pink_write.mp3');

	$tagger -> title("Another title");
	is($tagger -> title, "Another title");

	$tagger -> artist("Another artist");
	is($tagger -> artist, "Another artist");

	$tagger -> album("Another album");
	is($tagger -> album, "Another album");

	$tagger -> comment("Another comment");
	is($tagger -> comment, "Another comment");

	$tagger -> year(2000);
	is($tagger -> year, 2000);

	$tagger -> track(5);
	is($tagger -> track, 5);

	unlink('t/data/pink_write.mp3');
}

{
	copy('t/data/white.mp3', 't/data/white_write.mp3')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/white_write.mp3');

	$tagger -> title("Another title");
	is($tagger -> title, "Another title");

	$tagger -> artist("Another artist");
	is($tagger -> artist, "Another artist");

	$tagger -> album("Another album");
	is($tagger -> album, "Another album");

	$tagger -> comment("Another comment");
	is($tagger -> comment, "Another comment");

	$tagger -> year(2000);
	is($tagger -> year, 2000);

	$tagger -> track(5);
	is($tagger -> track, 5);

	unlink('t/data/white_write.mp3');
}

done_testing;
