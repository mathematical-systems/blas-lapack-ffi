#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclascl_(char* type, int* kl, int* ku, float* cfrom, float* cto, int* m, int* n, void* a, int* lda, int* info)
{
	enum lapack_symmetry_type typeC;
	if (*type=='G') typeC = lapack_general;
	else if(*type=='L') typeC = lapack_lower_triangular;
	else if(*type=='U') typeC = lapack_upper_triangular;
	else if(*type=='H') typeC = lapack_upper_hessenberg;
	else if(*type=='B') typeC = lapack_symetric_band_lower_stored;
	else if(*type=='Q') typeC = lapack_symetric_band_upper_stored;
	else if(*type=='Z') typeC = lapack_band;
	else typeC = 0;
	lapack_clascl(typeC, *kl, *ku, *cfrom, *cto, *m, *n, a, *lda, info);
}
