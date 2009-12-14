/*
 * lapack_dlascl.c
 *
 *This program is a C interface to dlascl.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlascl(const enum lapack_symmetry_type type, const int kl, const int ku, const double cfrom, const double cto, const int m, const int n, double * a, const int lda, int * info )
{
#ifdef F77_INT
	F77_INT F77_kl=kl, F77_ku=ku, F77_m=m, F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_kl kl
	#define F77_ku ku
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_type;
#else
	#define F77_type C_type
#endif

	char C_type=' ';
	if (type == lapack_general) {
		 C_type = 'G';
	} else if (type == lapack_lower_triangular) {
		 C_type = 'L';
	} else if (type == lapack_upper_triangular) {
		 C_type = 'U';
	} else if (type == lapack_upper_hessenberg) {
		 C_type = 'H';
	} else if (type == lapack_symetric_band_lower_stored) {
		 C_type = 'B';
	} else if (type == lapack_symetric_band_upper_stored) {
		 C_type = 'Q';
	} else if (type == lapack_band) {
		 C_type = 'Z';
	}

#ifdef F77_CHAR
	F77_type = C2F_CHAR(&C_type)
#endif

	f77_dlascl(&F77_type, &F77_kl, &F77_ku, &cfrom, &cto, &F77_m, &F77_n, a, &F77_lda, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
