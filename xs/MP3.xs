#include <taglib/mpegfile.h>

MODULE = Audio::Tagger		PACKAGE = Audio::Tagger::MP3

SV *
_tagger_mp3_file_new(path)
	SV *path

	INIT:
		Tag *tag;
		MPEG::File *file;
		SV *self = newSV(1);

		STRLEN len;
		const char *filename;
	CODE:
		SvGETMAGIC(path);
		filename = SvPV(path, len);

		file = new MPEG::File(filename);

		RETVAL = sv_setref_pv(self, "Audio::Tagger::MP3", (void *) file);
	OUTPUT:
		RETVAL

SV *
_tagger_mp3_file_strip(self)
	SV *self

	INIT:
		MPEG::File *file;
		int flags = MPEG::File::NoTags;

	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		if (file -> strip(MPEG::File::AllTags))
			RETVAL = newSVuv(1);
		else
			RETVAL = newSVuv(0);
	OUTPUT:
		RETVAL

SV *
_tagger_mp3_file_save(self)
	SV *self

	INIT:
		MPEG::File *file;

	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		if (file -> save())
			RETVAL = newSVuv(1);
		else
			RETVAL = newSVuv(0);
	OUTPUT:
		RETVAL

void
_tagger_mp3_file_destroy(self)
	SV *self

	INIT:
		MPEG::File *file;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		delete file;

SV *
_tagger_mp3_tag_get_str(self, tagn)
	SV *self
	unsigned int tagn;

	INIT:
		Tag *tag;
		String str;
		MPEG::File *file;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		tag = file -> tag();

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
_tagger_mp3_tag_set_str(self, tagn, string)
	SV *self
	SV *string
	unsigned int tagn

	INIT:
		Tag *tag;
		MPEG::File *file;

		STRLEN len;
		const char *new_string;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		SvGETMAGIC(string);
		new_string = SvPV(string, len);

		tag = file -> tag();

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
_tagger_mp3_tag_get_num(self, tagn)
	SV *self
	unsigned int tagn;

	INIT:
		Tag *tag;
		MPEG::File *file;
		unsigned int num;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		tag = file -> tag();

		switch (tagn) {
			case 0: { num = tag -> year();   break; }
			case 1: { num = tag -> track();  break; }
		}

		RETVAL = newSVuv(num);
	OUTPUT:
		RETVAL

SV *
_tagger_mp3_tag_set_num(self, tagn, number)
	SV *self
	unsigned int tagn
	unsigned int number

	INIT:
		Tag *tag;
		MPEG::File *file;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		tag = file -> tag();

		switch (tagn) {
			case 0: { tag -> setYear(number);  break; }
			case 1: { tag -> setTrack(number); break; }
		}

		RETVAL = newSVuv(number);
	OUTPUT:
		RETVAL

SV *
_tagger_mp3_prop_get_num(self, propn)
	SV *self
	unsigned int propn;

	INIT:
		MPEG::File *file;
		unsigned int num;
		AudioProperties *prop;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::MP3"))
			file = INT2PTR(MPEG::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::MP3");

		prop = file -> audioProperties();

		switch (propn) {
			case 0: { num = prop -> bitrate();    break; }
			case 1: { num = prop -> sampleRate(); break; }
			case 2: { num = prop -> channels();   break; }
		}

		RETVAL = newSVuv(num);
	OUTPUT:
		RETVAL
