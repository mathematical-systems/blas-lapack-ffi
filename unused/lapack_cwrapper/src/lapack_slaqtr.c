/*
 * lapack_slaqtr.c
 *
 *This program is a C interface to slaqtr.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaqtr(const long int ltran, const long int lreal, const int n, const float * t, const int ldt, const float * b, const float w, float * scale, float * x, float * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ldt=ldt;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ldt ldt
	#define F77_info info
#endif

#ifdef F77_LOG
	F77_LOG F77_ltran=ltran, F77_lreal=lreal;
#else
	#define F77_ltran ltran
	#define F77_lreal lreal
#endif

	f77_slaqtr(&F77_ltran, &F77_lreal, &F77_n, t, &F77_ldt, b, &w, scale, x, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
