#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <taglib/tag.h>

using namespace TagLib;

MODULE = Audio::Tagger		PACKAGE = Audio::Tagger

PROTOTYPES: ENABLE

INCLUDE: xs/File.xs
INCLUDE: xs/MP3.xs
