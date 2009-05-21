#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fshsein_(char* side, char* eigsrc, char* initv, long int* select, int* n, float* h, int* ldh, float* wr, float* wi, float* vl, int* ldvl, float* vr, int* ldvr, int* mm, int* m, float* work, int* ifaill, int* ifailr, int* info)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	enum lapack_eig_source_type eigsrcC;
	if (*eigsrc=='Q') eigsrcC = lapack_source_chseqr;
	else if(*eigsrc=='N') eigsrcC = lapack_source_chseqr;
	else eigsrcC = 0;
	enum lapack_init_vector_type initvC;
	if (*initv=='N') initvC = lapack_no_vectors;
	else if(*initv=='U') initvC = lapack_user_vectors;
	else initvC = 0;
	lapack_shsein(sideC, eigsrcC, initvC, select, *n, h, *ldh, wr, wi, vl, *ldvl, vr, *ldvr, *mm, m, work, ifaill, ifailr, info);
}
