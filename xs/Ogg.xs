#include <taglib/vorbisfile.h>

MODULE = Audio::Tagger		PACKAGE = Audio::Tagger::Ogg

SV *
_tagger_ogg_file_new(path)
	SV *path

	INIT:
		Tag *tag;
		Vorbis::File *file;
		SV *self = newSV(1);

		const char *filename;
	CODE:
		filename = SvPV_nolen(path);

		file = new Vorbis::File(filename);

		RETVAL = sv_setref_pv(self, "Audio::Tagger::Ogg", (void *) file);
	OUTPUT: RETVAL

SV *
_tagger_ogg_file_save(self)
	SV *self

	INIT:
		Vorbis::File *file;

	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		if (file -> save())
			RETVAL = newSVuv(1);
		else
			RETVAL = newSVuv(0);
	OUTPUT: RETVAL

void
_tagger_ogg_file_destroy(self)
	SV *self

	INIT:
		Vorbis::File *file;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		delete file;

SV *
_tagger_ogg_tag_get_str(self, tagn)
	SV *self
	unsigned int tagn;

	INIT:
		Tag *tag;
		String str;
		Vorbis::File *file;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		tag = file -> tag();

		switch (tagn) {
			case 0: { str = tag -> title();   break; }
			case 1: { str = tag -> artist();  break; }
			case 2: { str = tag -> album();   break; }
			case 3: { str = tag -> comment(); break; }
			case 4: { str = tag -> genre();   break; }
		}

		RETVAL = newSVpv(str.toCString(), 0);
	OUTPUT: RETVAL

SV *
_tagger_ogg_tag_set_str(self, tagn, string)
	SV *self
	SV *string
	unsigned int tagn

	INIT:
		Tag *tag;
		Vorbis::File *file;

		const char *new_string;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		new_string = SvPV_nolen(string);

		tag = file -> tag();

		switch (tagn) {
			case 0: { tag -> setTitle(new_string);   break; }
			case 1: { tag -> setArtist(new_string);  break; }
			case 2: { tag -> setAlbum(new_string);   break; }
			case 3: { tag -> setComment(new_string); break; }
			case 4: { tag -> setGenre(new_string);   break; }
		}

		RETVAL = newSVpv(new_string, 0);
	OUTPUT: RETVAL

SV *
_tagger_ogg_tag_get_num(self, tagn)
	SV *self
	unsigned int tagn;

	INIT:
		Tag *tag;
		Vorbis::File *file;
		unsigned int num;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		tag = file -> tag();

		switch (tagn) {
			case 0: { num = tag -> year();   break; }
			case 1: { num = tag -> track();  break; }
		}

		RETVAL = newSVuv(num);
	OUTPUT: RETVAL

SV *
_tagger_ogg_tag_set_num(self, tagn, number)
	SV *self
	unsigned int tagn
	unsigned int number

	INIT:
		Tag *tag;
		Vorbis::File *file;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		tag = file -> tag();

		switch (tagn) {
			case 0: { tag -> setYear(number);  break; }
			case 1: { tag -> setTrack(number); break; }
		}

		RETVAL = newSVuv(number);
	OUTPUT: RETVAL

SV *
_tagger_ogg_prop_get_num(self, propn)
	SV *self
	unsigned int propn;

	INIT:
		Vorbis::File *file;
		unsigned int num;
		AudioProperties *prop;
	CODE:
		if (sv_isobject(self) && sv_derived_from(self, "Audio::Tagger::Ogg"))
			file = INT2PTR(Vorbis::File *, SvIV((SV *) SvRV(self)));
		else
			Perl_croak(aTHX_ "$var is not of type Audio::Tagger::Ogg");

		prop = file -> audioProperties();

		switch (propn) {
			case 0: { num = prop -> bitrate();    break; }
			case 1: { num = prop -> sampleRate(); break; }
			case 2: { num = prop -> channels();   break; }
		}

		RETVAL = newSVuv(num);
	OUTPUT: RETVAL
