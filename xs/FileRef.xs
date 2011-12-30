#include <taglib/fileref.h>

MODULE = Audio::Tagger		PACKAGE = Audio::Tagger::FileRef

FileRef *
_tagger_fileref_file_new(path)
	SV *path

	INIT:
		Tag *tag;
		FileRef *file;

		STRLEN len;
		const char *filename;
	CODE:
		SvGETMAGIC(path);
		filename = SvPV(path, len);

		file = new FileRef(filename);

		RETVAL = file;
	OUTPUT:
		RETVAL

SV *
_tagger_fileref_file_save(self)
	FileRef *self

	INIT:
		bool success;

	CODE:
		success = self -> save();

		if (success)
			RETVAL = newSVuv(1);
		else
			RETVAL = newSVuv(0);
	OUTPUT:
		RETVAL

void
_tagger_fileref_file_destroy(self)
	FileRef *self

	CODE:
		delete self;

SV *
_tagger_fileref_tag_get_str(self, tagn)
	unsigned int tagn;
	FileRef *self

	INIT:
		Tag *tag;
		String str;
	CODE:
		tag = self -> tag();

		switch (tagn) {
			case 0: { str = tag -> title();   break; }
			case 1: { str = tag -> artist();  break; }
			case 2: { str = tag -> album();   break; }
			case 3: { str = tag -> comment(); break; }
			case 4: { str = tag -> genre();   break; }
		}

		RETVAL = newSVpv(str.toCString(), 0);
	OUTPUT:
		RETVAL

SV *
_tagger_fileref_tag_set_str(self, tagn, string)
	SV *string
	unsigned int tagn
	FileRef *self

	INIT:
		Tag *tag;

		STRLEN len;
		const char *new_string;
	CODE:
		SvGETMAGIC(string);
		new_string = SvPV(string, len);

		tag = self -> tag();

		switch (tagn) {
			case 0: { tag -> setTitle(new_string);   break; }
			case 1: { tag -> setArtist(new_string);  break; }
			case 2: { tag -> setAlbum(new_string);   break; }
			case 3: { tag -> setComment(new_string); break; }
			case 4: { tag -> setGenre(new_string);   break; }
		}

		RETVAL = newSVpv(new_string, 0);
	OUTPUT:
		RETVAL

SV *
_tagger_fileref_tag_get_num(self, tagn)
	unsigned int tagn;
	FileRef *self

	INIT:
		Tag *tag;
		unsigned int num;
	CODE:
		tag = self -> tag();

		switch (tagn) {
			case 0: { num = tag -> year();   break; }
			case 1: { num = tag -> track();  break; }
		}

		RETVAL = newSVuv(num);
	OUTPUT:
		RETVAL

SV *
_tagger_fileref_tag_set_num(self, tagn, number)
	unsigned int tagn
	unsigned int number
	FileRef *self

	INIT:
		Tag *tag;
	CODE:
		tag = self -> tag();

		switch (tagn) {
			case 0: { tag -> setYear(number);  break; }
			case 1: { tag -> setTrack(number); break; }
		}

		RETVAL = newSVuv(number);
	OUTPUT:
		RETVAL
