#!perl -T

use Test::More skip_all => "flac save does not work in taglib";

use File::Copy;
use Audio::Tagger;

{
	copy('t/data/brown.flac', 't/data/brown_save.flac')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/brown_save.flac');

	$tagger -> title("Another title");
	$tagger -> artist("Another artist");
	$tagger -> album("Another album");
	$tagger -> comment("Another comment");
	$tagger -> year(2000);
	$tagger -> track(5);

	is($tagger -> save, 1);

	my $tagger2 = Audio::Tagger::FileRef -> new('t/data/brown_save.flac');

	is($tagger2 -> title, "Another title");
	is($tagger2 -> artist, "Another artist");
	is($tagger2 -> album, "Another album");
	is($tagger2 -> comment, "Another comment");
	is($tagger2 -> year, 2000);
	is($tagger2 -> track, 5);

	unlink('t/data/brown_save.flac');
}

{
	copy('t/data/pink.flac', 't/data/pink_save.flac')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/pink_save.flac');

	$tagger -> title("Another title");
	$tagger -> artist("Another artist");
	$tagger -> album("Another album");
	$tagger -> comment("Another comment");
	$tagger -> year(2000);
	$tagger -> track(5);

	is($tagger -> save, 1);

	my $tagger2 = Audio::Tagger::FileRef -> new('t/data/pink_save.flac');

	is($tagger2 -> title, "Another title");
	is($tagger2 -> artist, "Another artist");
	is($tagger2 -> album, "Another album");
	is($tagger2 -> comment, "Another comment");
	is($tagger2 -> year, 2000);
	is($tagger2 -> track, 5);

	unlink('t/data/pink_save.flac');
}

{
	copy('t/data/white.flac', 't/data/white_save.flac')
		or die "Copy failed: $!";

	my $tagger = Audio::Tagger::FileRef -> new('t/data/white_save.flac');

	$tagger -> title("Another title");
	$tagger -> artist("Another artist");
	$tagger -> album("Another album");
	$tagger -> comment("Another comment");
	$tagger -> year(2000);
	$tagger -> track(5);

	is($tagger -> save, 1);

	my $tagger2 = Audio::Tagger::FileRef -> new('t/data/white_save.flac');

	is($tagger2 -> title, "Another title");
	is($tagger2 -> artist, "Another artist");
	is($tagger2 -> album, "Another album");
	is($tagger2 -> comment, "Another comment");
	is($tagger2 -> year, 2000);
	is($tagger2 -> track, 5);

	unlink('t/data/white_save.flac');
}

done_testing;
