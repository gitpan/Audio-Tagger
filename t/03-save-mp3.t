#!perl -T

use Test::More;

use File::Copy;
use Audio::Tagger;

{
	copy('t/data/brown.mp3', 't/data/brown_save.mp3')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/brown_save.mp3');

	$tagger -> title("Another title");
	$tagger -> artist("Another artist");
	$tagger -> album("Another album");
	$tagger -> comment("Another comment");
	$tagger -> year(2000);
	$tagger -> track(5);

	is($tagger -> save, 1);

	my $tagger2 = Audio::Tagger::FileRef -> new('t/data/brown_save.mp3');

	is($tagger2 -> title, "Another title");
	is($tagger2 -> artist, "Another artist");
	is($tagger2 -> album, "Another album");
	is($tagger2 -> comment, "Another comment");
	is($tagger2 -> year, 2000);
	is($tagger2 -> track, 5);

	unlink('t/data/brown_save.mp3');
}

{
	copy('t/data/pink.mp3', 't/data/pink_save.mp3')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/pink_save.mp3');

	$tagger -> title("Another title");
	$tagger -> artist("Another artist");
	$tagger -> album("Another album");
	$tagger -> comment("Another comment");
	$tagger -> year(2000);
	$tagger -> track(5);

	is($tagger -> save, 1);

	my $tagger2 = Audio::Tagger::FileRef -> new('t/data/pink_save.mp3');

	is($tagger2 -> title, "Another title");
	is($tagger2 -> artist, "Another artist");
	is($tagger2 -> album, "Another album");
	is($tagger2 -> comment, "Another comment");
	is($tagger2 -> year, 2000);
	is($tagger2 -> track, 5);

	unlink('t/data/pink_save.mp3');
}

{
	copy('t/data/white.mp3', 't/data/white_save.mp3')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/white_save.mp3');

	$tagger -> title("Another title");
	$tagger -> artist("Another artist");
	$tagger -> album("Another album");
	$tagger -> comment("Another comment");
	$tagger -> year(2000);
	$tagger -> track(5);

	is($tagger -> save, 1);

	my $tagger2 = Audio::Tagger::FileRef -> new('t/data/white_save.mp3');

	is($tagger2 -> title, "Another title");
	is($tagger2 -> artist, "Another artist");
	is($tagger2 -> album, "Another album");
	is($tagger2 -> comment, "Another comment");
	is($tagger2 -> year, 2000);
	is($tagger2 -> track, 5);

	unlink('t/data/white_save.mp3');
}

done_testing;
