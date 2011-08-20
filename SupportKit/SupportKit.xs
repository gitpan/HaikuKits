/*
 * Automatically generated file
 */
 
#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

#undef Copy // this macro might interfere with function names

#include "SupportKit.cpp"
MODULE = Haiku::SupportKit	PACKAGE = Haiku::SupportKit

INCLUDE: ext/Haiku/Beep.xs
INCLUDE: ext/Haiku/Archivable.xs
INCLUDE: ext/Haiku/Archiver.xs
INCLUDE: ext/Haiku/Unarchiver.xs
INCLUDE: ext/Haiku/Errors.xs
INCLUDE: ext/Haiku/TypeConstants.xs

# since the XS included above probably changed it, force correct module
MODULE = Haiku::SupportKit	PACKAGE = Haiku::SupportKit

SV*
B_PRId8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRId8);
		dualize(RETVAL, "B_PRId8");
	OUTPUT:
		RETVAL

SV*
B_PRIi8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIi8);
		dualize(RETVAL, "B_PRIi8");
	OUTPUT:
		RETVAL

SV*
B_PRId16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRId16);
		dualize(RETVAL, "B_PRId16");
	OUTPUT:
		RETVAL

SV*
B_PRIi16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIi16);
		dualize(RETVAL, "B_PRIi16");
	OUTPUT:
		RETVAL

SV*
B_PRId32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRId32);
		dualize(RETVAL, "B_PRId32");
	OUTPUT:
		RETVAL

SV*
B_PRIi32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIi32);
		dualize(RETVAL, "B_PRIi32");
	OUTPUT:
		RETVAL

SV*
B_PRId64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRId64);
		dualize(RETVAL, "B_PRId64");
	OUTPUT:
		RETVAL

SV*
B_PRIi64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIi64);
		dualize(RETVAL, "B_PRIi64");
	OUTPUT:
		RETVAL

SV*
B_PRIu8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIu8);
		dualize(RETVAL, "B_PRIu8");
	OUTPUT:
		RETVAL

SV*
B_PRIo8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIo8);
		dualize(RETVAL, "B_PRIo8");
	OUTPUT:
		RETVAL

SV*
B_PRIx8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIx8);
		dualize(RETVAL, "B_PRIx8");
	OUTPUT:
		RETVAL

SV*
B_PRIX8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIX8);
		dualize(RETVAL, "B_PRIX8");
	OUTPUT:
		RETVAL

SV*
B_PRIu16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIu16);
		dualize(RETVAL, "B_PRIu16");
	OUTPUT:
		RETVAL

SV*
B_PRIo16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIo16);
		dualize(RETVAL, "B_PRIo16");
	OUTPUT:
		RETVAL

SV*
B_PRIx16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIx16);
		dualize(RETVAL, "B_PRIx16");
	OUTPUT:
		RETVAL

SV*
B_PRIX16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIX16);
		dualize(RETVAL, "B_PRIX16");
	OUTPUT:
		RETVAL

SV*
B_PRIu32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIu32);
		dualize(RETVAL, "B_PRIu32");
	OUTPUT:
		RETVAL

SV*
B_PRIo32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIo32);
		dualize(RETVAL, "B_PRIo32");
	OUTPUT:
		RETVAL

SV*
B_PRIx32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIx32);
		dualize(RETVAL, "B_PRIx32");
	OUTPUT:
		RETVAL

SV*
B_PRIX32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIX32);
		dualize(RETVAL, "B_PRIX32");
	OUTPUT:
		RETVAL

SV*
B_PRIu64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIu64);
		dualize(RETVAL, "B_PRIu64");
	OUTPUT:
		RETVAL

SV*
B_PRIo64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIo64);
		dualize(RETVAL, "B_PRIo64");
	OUTPUT:
		RETVAL

SV*
B_PRIx64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIx64);
		dualize(RETVAL, "B_PRIx64");
	OUTPUT:
		RETVAL

SV*
B_PRIX64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIX64);
		dualize(RETVAL, "B_PRIX64");
	OUTPUT:
		RETVAL

SV*
B_SCNd8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNd8);
		dualize(RETVAL, "B_SCNd8");
	OUTPUT:
		RETVAL

SV*
B_SCNi8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNi8);
		dualize(RETVAL, "B_SCNi8");
	OUTPUT:
		RETVAL

SV*
B_SCNd16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNd16);
		dualize(RETVAL, "B_SCNd16");
	OUTPUT:
		RETVAL

SV*
B_SCNi16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNi16);
		dualize(RETVAL, "B_SCNi16");
	OUTPUT:
		RETVAL

SV*
B_SCNd32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNd32);
		dualize(RETVAL, "B_SCNd32");
	OUTPUT:
		RETVAL

SV*
B_SCNi32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNi32);
		dualize(RETVAL, "B_SCNi32");
	OUTPUT:
		RETVAL

SV*
B_SCNd64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNd64);
		dualize(RETVAL, "B_SCNd64");
	OUTPUT:
		RETVAL

SV*
B_SCNi64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNi64);
		dualize(RETVAL, "B_SCNi64");
	OUTPUT:
		RETVAL

SV*
B_SCNu8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNu8);
		dualize(RETVAL, "B_SCNu8");
	OUTPUT:
		RETVAL

SV*
B_SCNo8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNo8);
		dualize(RETVAL, "B_SCNo8");
	OUTPUT:
		RETVAL

SV*
B_SCNx8()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNx8);
		dualize(RETVAL, "B_SCNx8");
	OUTPUT:
		RETVAL

SV*
B_SCNu16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNu16);
		dualize(RETVAL, "B_SCNu16");
	OUTPUT:
		RETVAL

SV*
B_SCNo16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNo16);
		dualize(RETVAL, "B_SCNo16");
	OUTPUT:
		RETVAL

SV*
B_SCNx16()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNx16);
		dualize(RETVAL, "B_SCNx16");
	OUTPUT:
		RETVAL

SV*
B_SCNu32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNu32);
		dualize(RETVAL, "B_SCNu32");
	OUTPUT:
		RETVAL

SV*
B_SCNo32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNo32);
		dualize(RETVAL, "B_SCNo32");
	OUTPUT:
		RETVAL

SV*
B_SCNx32()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNx32);
		dualize(RETVAL, "B_SCNx32");
	OUTPUT:
		RETVAL

SV*
B_SCNu64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNu64);
		dualize(RETVAL, "B_SCNu64");
	OUTPUT:
		RETVAL

SV*
B_SCNo64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNo64);
		dualize(RETVAL, "B_SCNo64");
	OUTPUT:
		RETVAL

SV*
B_SCNx64()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_SCNx64);
		dualize(RETVAL, "B_SCNx64");
	OUTPUT:
		RETVAL

SV*
B_PRIuSIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIuSIZE);
		dualize(RETVAL, "B_PRIuSIZE");
	OUTPUT:
		RETVAL

SV*
B_PRIoSIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIoSIZE);
		dualize(RETVAL, "B_PRIoSIZE");
	OUTPUT:
		RETVAL

SV*
B_PRIxSIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIxSIZE);
		dualize(RETVAL, "B_PRIxSIZE");
	OUTPUT:
		RETVAL

SV*
B_PRIXSIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIXSIZE);
		dualize(RETVAL, "B_PRIXSIZE");
	OUTPUT:
		RETVAL

SV*
B_PRIdSSIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIdSSIZE);
		dualize(RETVAL, "B_PRIdSSIZE");
	OUTPUT:
		RETVAL

SV*
B_PRIiSSIZE()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIiSSIZE);
		dualize(RETVAL, "B_PRIiSSIZE");
	OUTPUT:
		RETVAL

SV*
B_PRIuADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIuADDR);
		dualize(RETVAL, "B_PRIuADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIoADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIoADDR);
		dualize(RETVAL, "B_PRIoADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIxADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIxADDR);
		dualize(RETVAL, "B_PRIxADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIXADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIXADDR);
		dualize(RETVAL, "B_PRIXADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIuPHYSADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIuPHYSADDR);
		dualize(RETVAL, "B_PRIuPHYSADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIoPHYSADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIoPHYSADDR);
		dualize(RETVAL, "B_PRIoPHYSADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIxPHYSADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIxPHYSADDR);
		dualize(RETVAL, "B_PRIxPHYSADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIXPHYSADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIXPHYSADDR);
		dualize(RETVAL, "B_PRIXPHYSADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIuGENADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIuGENADDR);
		dualize(RETVAL, "B_PRIuGENADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIoGENADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIoGENADDR);
		dualize(RETVAL, "B_PRIoGENADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIxGENADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIxGENADDR);
		dualize(RETVAL, "B_PRIxGENADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIXGENADDR()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIXGENADDR);
		dualize(RETVAL, "B_PRIXGENADDR");
	OUTPUT:
		RETVAL

SV*
B_PRIdOFF()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIdOFF);
		dualize(RETVAL, "B_PRIdOFF");
	OUTPUT:
		RETVAL

SV*
B_PRIiOFF()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIiOFF);
		dualize(RETVAL, "B_PRIiOFF");
	OUTPUT:
		RETVAL

SV*
B_PRIdDEV()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIdDEV);
		dualize(RETVAL, "B_PRIdDEV");
	OUTPUT:
		RETVAL

SV*
B_PRIiDEV()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIiDEV);
		dualize(RETVAL, "B_PRIiDEV");
	OUTPUT:
		RETVAL

SV*
B_PRIdINO()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIdINO);
		dualize(RETVAL, "B_PRIdINO");
	OUTPUT:
		RETVAL

SV*
B_PRIiINO()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIiINO);
		dualize(RETVAL, "B_PRIiINO");
	OUTPUT:
		RETVAL

SV*
B_PRIdTIME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIdTIME);
		dualize(RETVAL, "B_PRIdTIME");
	OUTPUT:
		RETVAL

SV*
B_PRIiTIME()
	CODE:
		RETVAL = newSV(0);
		sv_setiv(RETVAL, (IV)B_PRIiTIME);
		dualize(RETVAL, "B_PRIiTIME");
	OUTPUT:
		RETVAL

MODULE = Haiku::SupportKit	PACKAGE = Haiku::SupportKit::DEBUG

SV*
FETCH(tie_obj)
		SV* tie_obj;
	CODE:
		RETVAL = newSViv(debug_level);
	OUTPUT:
		RETVAL

void
STORE(tie_obj, value)
		SV* tie_obj;
		SV* value;
	CODE:
		debug_level = SvIV(value);
		
MODULE = Haiku::SupportKit	PACKAGE = Haiku::SupportKit

BOOT:
	set_up_debug_sv("Haiku::SupportKit::DEBUG");
