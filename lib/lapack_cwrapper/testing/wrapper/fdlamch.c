#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdlamch_(double* output, char* cmach)
{
	enum lapack_cmach_type cmachC;
	if (*cmach=='E') cmachC = lapack_eps;
	else if(*cmach=='S') cmachC = lapack_sfmin;
	else if(*cmach=='B') cmachC = lapack_base;
	else if(*cmach=='P') cmachC = lapack_epsbase;
	else if(*cmach=='N') cmachC = lapack_t;
	else if(*cmach=='R') cmachC = lapack_rnd;
	else if(*cmach=='M') cmachC = lapack_emin;
	else if(*cmach=='U') cmachC = lapack_rmin;
	else if(*cmach=='L') cmachC = lapack_emax;
	else if(*cmach=='O') cmachC = lapack_rmax;
	else cmachC = 0;
	*output = lapack_dlamch( cmachC);
}
