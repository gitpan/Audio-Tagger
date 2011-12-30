#!perl -T

use Test::More;

use File::Copy;
use Audio::Tagger;

{
	copy('t/data/brown.flac', 't/data/brown_write.flac')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/brown_write.flac');

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

	unlink('t/data/brown_write.flac');
}

{
	copy('t/data/pink.flac', 't/data/pink_write.flac')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/pink_write.flac');

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

	unlink('t/data/pink_write.flac');
}

{
	copy('t/data/white.flac', 't/data/white_write.flac')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/white_write.flac');

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

	unlink('t/data/white_write.flac');
}

done_testing;
